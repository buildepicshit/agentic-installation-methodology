#!/usr/bin/env node
import crypto from "node:crypto";
import fs from "node:fs";
import path from "node:path";
import { spawnSync } from "node:child_process";
import { fileURLToPath } from "node:url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const root = path.resolve(__dirname, "..", "..");
const agentsDir = path.join(root, "agents");

// --out <path>: write the lock to an alternate path. Used by
// fleet-selfcheck.sh generate_lock() so both consumers share this ONE
// generator (P5 T-03 single-sourcing); default is the canonical lock.
const cliArgs = process.argv.slice(2);
let outOverride = null;
const outIdx = cliArgs.indexOf("--out");
if (outIdx !== -1) {
  outOverride = cliArgs[outIdx + 1];
  if (!outOverride) {
    console.error("generate-fleet-manifest-lock: --out requires a path");
    process.exit(1);
  }
}

// Child-repo guard: the lock is generated ONLY in the source repo
// (bes-fleet-policy) and the lock FILE is propagated to children. A
// sync-receiving repo has no canonical `agents/` tree (it uses `.agents/`),
// so this generator has nothing to generate here — no-op cleanly (exit 0)
// instead of throwing "manifest missing", mirroring fleet-selfcheck.sh's
// off-source behaviour.
if (!fs.existsSync(path.join(root, "agents", "scripts", "fleet-files.txt"))) {
  console.error(
    "generate-fleet-manifest-lock: canonical agents/scripts/fleet-files.txt " +
      "not found — not the source repo (bes-fleet-policy). The lock is " +
      "generated at source and propagated; nothing to do here.",
  );
  process.exit(0);
}

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

function git(args) {
  const result = spawnSync("git", ["-C", root, ...args], {
    encoding: "utf8",
  });
  if (result.status !== 0) return null;
  return result.stdout.trim();
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
  entries.push(
    entry(
      "command",
      `.claude/commands/${command}.md`,
      `.claude/commands/${command}.md`,
    ),
  );
}

for (const skill of manifests.fleet_skills) {
  entries.push(
    entry(
      "skill",
      `agents/skills/${skill}/SKILL.md`,
      `.claude/skills/${skill}/SKILL.md`,
    ),
  );

  const referencesDir = path.join(agentsDir, "skills", skill, "references");
  for (const refPath of listMarkdownFiles(referencesDir)) {
    const sourcePath = rel(refPath);
    const referenceName = path.basename(refPath);
    entries.push(
      entry(
        "skill-reference",
        sourcePath,
        `.claude/skills/${skill}/references/${referenceName}`,
      ),
    );
  }
}

for (const hook of manifests.fleet_hooks) {
  entries.push(entry("hook", `.claude/hooks/${hook}`, `.claude/hooks/${hook}`));
}

entries.push(
  entry(
    "harness",
    ".claude/hooks/tests/run-tests.sh",
    ".claude/hooks/tests/run-tests.sh",
  ),
);

for (const fixture of manifests.fleet_hook_fixtures) {
  entries.push(
    entry(
      "hook-fixture",
      `.claude/hooks/tests/fixtures/${fixture}`,
      `.claude/hooks/tests/fixtures/${fixture}`,
    ),
  );
}

entries.push(
  entry("harness", ".claude/settings.json", ".claude/settings.json"),
  entry(
    "harness",
    ".claude/scripts/statusline.sh",
    ".claude/scripts/statusline.sh",
  ),
  entry("githook", "agents/githooks/commit-msg", ".githooks/commit-msg"),
  entry("githook", "agents/githooks/pre-push", ".githooks/pre-push"),
);

entries.sort((a, b) => {
  const target = a.target_path.localeCompare(b.target_path);
  if (target !== 0) return target;
  return a.kind.localeCompare(b.kind);
});

const status = git(["status", "--porcelain"]);
const lock = {
  schema_version: 1,
  generated_at: new Date().toISOString(),
  source: {
    repo: "bes-fleet-policy",
    commit: git(["rev-parse", "HEAD"]),
    dirty: status === null ? null : status.length > 0,
  },
  manifests,
  entries,
};

const outPath = outOverride
  ? path.resolve(outOverride)
  : path.join(agentsDir, "fleet-manifest.lock.json");
fs.writeFileSync(outPath, `${JSON.stringify(lock, null, 2)}\n`);
console.log(`wrote ${outOverride ? outPath : rel(outPath)} with ${entries.length} entries`);
