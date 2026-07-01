#!/usr/bin/env bash
set -eu

usage() {
  echo "usage: bash agents/scripts/fleet-selfcheck.sh --check|--fix" >&2
}

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
root=$(CDPATH= cd -- "$script_dir/../.." && pwd -P)

# IS_SOURCE (SPEC §8.0): canonical fleet-skills manifest present AND the
# PROPAGATED marker file absent. Keys on `.agents/scripts/fleet-skills.txt`
# (a real child has it), NOT the bare `.agents/` dir — bes-fleet-policy
# carries a stray empty `.agents/` (CV-1). Cheap, filesystem-only, first.
if [ ! -f "$root/agents/scripts/fleet-skills.txt" ] || [ -f "$root/.agents/scripts/fleet-skills.txt" ]; then
  exit 0
fi

if [ "$#" -ne 1 ]; then
  usage
  exit 1
fi

mode=$1
if [ "$mode" != "--check" ] && [ "$mode" != "--fix" ]; then
  usage
  exit 1
fi

manifest="$root/agents/scripts/fleet-skills.txt"
canonical_skills="$root/agents/skills"
mirror_skills="$root/.claude/skills"
lock_path="$root/agents/fleet-manifest.lock.json"

tmp_files=""
cleanup() {
  for f in $tmp_files; do
    [ -n "$f" ] && [ -e "$f" ] && rm -f "$f"
  done
}
trap cleanup EXIT INT TERM

new_tmp() {
  tmp=$(mktemp)
  tmp_files="${tmp_files}${tmp_files:+ }$tmp"
  printf '%s\n' "$tmp"
}

read_manifest() {
  sed 's/^[[:space:]]*//; s/[[:space:]]*$//' "$manifest" \
    | awk 'length($0) > 0 && substr($0, 1, 1) != "#"'
}

expected_mirror_list() {
  read_manifest | while IFS= read -r skill; do
    printf '%s\n' "$skill/SKILL.md"
    refs="$canonical_skills/$skill/references"
    if [ -d "$refs" ]; then
      find "$refs" -maxdepth 1 -type f -name '*.md' -printf "$skill/references/%f\n"
    fi
  done | sort
}

# Only the MANIFEST-GOVERNED file set (SPEC §8.1): `<skill>/SKILL.md` and
# `<skill>/references/*.md` — the files fleet-sync.sh manages. NON-governed
# resources (e.g. `<skill>/known-good/*`, `<skill>/tests/*`) live in the
# mirror legitimately and MUST NOT be treated as orphans or deleted (CV-3).
actual_mirror_list() {
  [ -d "$mirror_skills" ] || return 0
  # DEPTH-BOUNDED so `find`'s slash-spanning `*` cannot match nested
  # non-governed files (e.g. `<skill>/tests/SKILL.md`,
  # `<skill>/sub/references/x.md`) — revalidation CV-3 residue.
  (cd "$mirror_skills" \
    && find . -mindepth 2 -maxdepth 2 -type f -name 'SKILL.md' -printf '%P\n' \
    && find . -mindepth 3 -maxdepth 3 -type f -path './*/references/*.md' -printf '%P\n') \
    | sort
}

check_mirror() {
  expected=$(new_tmp)
  actual=$(new_tmp)
  expected_mirror_list > "$expected"
  actual_mirror_list > "$actual"

  mirror_stale=0
  changed=$(new_tmp)
  while IFS= read -r rel; do
    [ -n "$rel" ] || continue
    canonical_rel=${rel#*/}
    canonical="$canonical_skills/${rel%%/*}/$canonical_rel"
    mirror="$mirror_skills/$rel"
    if [ -f "$mirror" ] && ! cmp -s "$canonical" "$mirror"; then
      printf '%s\n' "$rel" >> "$changed"
    fi
  done < "$expected"

  missing=$(new_tmp)
  orphans=$(new_tmp)
  comm -23 "$expected" "$actual" > "$missing"
  comm -13 "$expected" "$actual" > "$orphans"

  if [ -s "$missing" ] || [ -s "$changed" ] || [ -s "$orphans" ]; then
    echo "stale mirror:" >&2
    while IFS= read -r rel; do [ -n "$rel" ] && echo "  missing .claude/skills/$rel" >&2; done < "$missing"
    while IFS= read -r rel; do [ -n "$rel" ] && echo "  changed .claude/skills/$rel" >&2; done < "$changed"
    while IFS= read -r rel; do [ -n "$rel" ] && echo "  orphan .claude/skills/$rel" >&2; done < "$orphans"
    mirror_stale=1
  fi

  return "$mirror_stale"
}

# Sync ONLY the governed file set (SPEC §8.1, CV-3): copy each expected
# `<skill>/SKILL.md` + `<skill>/references/*.md` from canonical, and remove
# ONLY governed-pattern orphans (a SKILL.md/references file for a removed
# skill/reference). MUST NOT `rm -rf` the mirror or delete non-governed
# resources (known-good/, tests/, etc.).
sync_mirror() {
  expected=$(new_tmp)
  actual=$(new_tmp)
  expected_mirror_list > "$expected"
  actual_mirror_list > "$actual"

  # remove governed-pattern orphans (present in mirror, absent from expected)
  comm -13 "$expected" "$actual" | while IFS= read -r rel; do
    [ -n "$rel" ] && rm -f "$mirror_skills/$rel"
  done

  # copy each expected governed file from canonical
  while IFS= read -r rel; do
    [ -n "$rel" ] || continue
    src="$canonical_skills/$rel"
    dst="$mirror_skills/$rel"
    mkdir -p "$(dirname "$dst")"
    cp "$src" "$dst"
  done < "$expected"
}

generate_lock() {
  out=$1
  node - "$root" "$out" <<'NODE'
const crypto = require("node:crypto");
const fs = require("node:fs");
const path = require("node:path");

const root = process.argv[2];
const outPath = process.argv[3];
const agentsDir = path.join(root, "agents");
const existingLockPath = path.join(agentsDir, "fleet-manifest.lock.json");

function rel(absPath) {
  return path.relative(root, absPath).split(path.sep).join("/");
}

function readManifest(relPath) {
  const absPath = path.join(root, relPath);
  if (!fs.existsSync(absPath)) {
    throw new Error(`manifest missing: ${relPath}`);
  }
  return fs
    .readFileSync(absPath, "utf8")
    .split(/\r?\n/)
    .map((line) => line.trim())
    .filter((line) => line.length > 0 && !line.startsWith("#"));
}

function entry(kind, sourcePath, targetPath) {
  const absPath = path.join(root, sourcePath);
  if (!fs.existsSync(absPath)) {
    throw new Error(`source file missing for ${kind}: ${sourcePath}`);
  }
  const bytes = fs.readFileSync(absPath);
  return {
    kind,
    source_path: sourcePath,
    target_path: targetPath,
    sha256: crypto.createHash("sha256").update(bytes).digest("hex"),
    bytes: bytes.length,
  };
}

function listMarkdownFiles(absDir) {
  if (!fs.existsSync(absDir)) return [];
  return fs
    .readdirSync(absDir, { withFileTypes: true })
    .filter((item) => item.isFile() && item.name.endsWith(".md"))
    .map((item) => path.join(absDir, item.name))
    .sort();
}

const manifests = {
  fleet_files: readManifest("agents/scripts/fleet-files.txt"),
  fleet_skills: readManifest("agents/scripts/fleet-skills.txt"),
  fleet_commands: readManifest("agents/scripts/fleet-commands.txt"),
  fleet_hooks: readManifest("agents/scripts/fleet-hooks.txt"),
  fleet_hook_fixtures: readManifest("agents/scripts/fleet-hook-fixtures.txt"),
};

const entries = [];

for (const file of manifests.fleet_files) {
  if (file === "fleet-manifest.lock.json") continue;
  entries.push(entry("agents-file", `agents/${file}`, `.agents/${file}`));
}

for (const command of manifests.fleet_commands) {
  entries.push(entry("command", `.claude/commands/${command}.md`, `.claude/commands/${command}.md`));
}

for (const skill of manifests.fleet_skills) {
  entries.push(entry("skill", `agents/skills/${skill}/SKILL.md`, `.claude/skills/${skill}/SKILL.md`));
  const referencesDir = path.join(agentsDir, "skills", skill, "references");
  for (const refPath of listMarkdownFiles(referencesDir)) {
    const sourcePath = rel(refPath);
    const referenceName = path.basename(refPath);
    entries.push(entry("skill-reference", sourcePath, `.claude/skills/${skill}/references/${referenceName}`));
  }
}

for (const hook of manifests.fleet_hooks) {
  entries.push(entry("hook", `.claude/hooks/${hook}`, `.claude/hooks/${hook}`));
}

entries.push(entry("harness", ".claude/hooks/tests/run-tests.sh", ".claude/hooks/tests/run-tests.sh"));

for (const fixture of manifests.fleet_hook_fixtures) {
  entries.push(entry("hook-fixture", `.claude/hooks/tests/fixtures/${fixture}`, `.claude/hooks/tests/fixtures/${fixture}`));
}

entries.push(
  entry("harness", ".claude/settings.json", ".claude/settings.json"),
  entry("harness", ".claude/scripts/statusline.sh", ".claude/scripts/statusline.sh"),
  entry("githook", "agents/githooks/commit-msg", ".githooks/commit-msg"),
);

entries.sort((a, b) => {
  const target = a.target_path.localeCompare(b.target_path);
  if (target !== 0) return target;
  return a.kind.localeCompare(b.kind);
});

let previous = {};
try {
  previous = JSON.parse(fs.readFileSync(existingLockPath, "utf8"));
} catch {
  previous = {};
}

const lock = {
  schema_version: 1,
  generated_at: new Date().toISOString(),
  source: previous.source || { repo: "bes-fleet-policy", commit: null, dirty: null },
  manifests,
  entries,
};

fs.writeFileSync(outPath, `${JSON.stringify(lock, null, 2)}\n`);
NODE
}

compare_locks() {
  actual=$1
  expected=$2
  node - "$actual" "$expected" <<'NODE'
const fs = require("node:fs");

const actualPath = process.argv[2];
const expectedPath = process.argv[3];

function readLock(lockPath, label) {
  try {
    return JSON.parse(fs.readFileSync(lockPath, "utf8"));
  } catch (error) {
    console.error(`stale lock: ${label} unreadable: ${error.message}`);
    process.exit(1);
  }
}

function normalized(lock) {
  if (!Array.isArray(lock.entries)) {
    throw new Error("entries must be an array");
  }
  return lock.entries
    .map((entry) => ({
      target_path: entry.target_path,
      sha256: entry.sha256,
      bytes: entry.bytes,
    }))
    .sort((a, b) => {
      const target = String(a.target_path).localeCompare(String(b.target_path));
      if (target !== 0) return target;
      const hash = String(a.sha256).localeCompare(String(b.sha256));
      if (hash !== 0) return hash;
      return Number(a.bytes) - Number(b.bytes);
    });
}

let actual;
let expected;
try {
  actual = normalized(readLock(actualPath, "actual"));
  expected = normalized(readLock(expectedPath, "expected"));
} catch (error) {
  console.error(`stale lock: ${error.message}`);
  process.exit(1);
}

if (JSON.stringify(actual) === JSON.stringify(expected)) {
  process.exit(0);
}

const actualByTarget = new Map(actual.map((entry) => [entry.target_path, entry]));
const expectedByTarget = new Map(expected.map((entry) => [entry.target_path, entry]));

console.error("stale lock:");
for (const entry of expected) {
  const current = actualByTarget.get(entry.target_path);
  if (!current) {
    console.error(`  missing ${entry.target_path}`);
  } else if (current.sha256 !== entry.sha256 || current.bytes !== entry.bytes) {
    console.error(`  changed ${entry.target_path}`);
  }
}
for (const entry of actual) {
  if (!expectedByTarget.has(entry.target_path)) {
    console.error(`  orphan ${entry.target_path}`);
  }
}
process.exit(1);
NODE
}

check_lock() {
  expected_lock=$(new_tmp)
  generate_lock "$expected_lock"
  compare_locks "$lock_path" "$expected_lock"
}

fix_lock() {
  expected_lock=$(new_tmp)
  generate_lock "$expected_lock"
  if ! compare_locks "$lock_path" "$expected_lock" >/dev/null 2>&1; then
    cp "$expected_lock" "$lock_path"
  fi
}

if [ "$mode" = "--check" ]; then
  status=0
  if ! check_mirror; then
    status=1
  fi
  if ! check_lock; then
    status=1
  fi
  if [ "$status" -ne 0 ]; then
    echo "run: bash agents/scripts/fleet-selfcheck.sh --fix" >&2
  fi
  exit "$status"
fi

sync_mirror
fix_lock
