#!/usr/bin/env bash
# validate-skill-provenance.sh — validate BES skill provenance metadata.
#
# Normal mode is warning-only for missing or stale provenance fields.
# --strict exits non-zero on warnings and is used by migration specs.

set -euo pipefail

strict=0
if [ "${1:-}" = "--strict" ]; then
  strict=1
  shift
fi

node --input-type=module - "$strict" "$@" <<'NODE'
import fs from "node:fs";
import path from "node:path";

const strict = process.argv[2] === "1";
const roots = process.argv.slice(3);
const scanRoots = roots.length > 0 ? roots : ["agents/skills", ".claude/skills", ".agents/skills"];
const allowedLicense = new Set(["internal-only", "unknown"]);
const allowedCompatibility = new Set(["copilot", "claude", "agent-skills", "bes-fleet"]);
const allowedOrigin = new Set(["internal", "borrowed", "adapted", "external", "unknown"]);
const allowedUpstream = new Set(["current", "dormant", "archived", "unknown", "not-applicable"]);
const allowedCadence = new Set(["quarterly", "semiannual", "annual", "ad-hoc"]);
const allowedAdoption = new Set(["verbatim", "adapted", "inspired-by", "bes-native", "unknown"]);
const allowedSecurity = new Set(["not-required", "needed", "complete", "blocked"]);
const allowedScripts = new Set(["none", "present"]);

const errors = [];
const warnings = [];
const checked = [];

function collectSkillFiles(root, files = []) {
  if (!fs.existsSync(root)) return files;
  for (const entry of fs.readdirSync(root, { withFileTypes: true })) {
    const full = path.join(root, entry.name);
    if (entry.isDirectory()) collectSkillFiles(full, files);
    else if (entry.isFile() && entry.name === "SKILL.md") files.push(full);
  }
  return files;
}

function stripQuotes(value) {
  const trimmed = value.trim();
  if ((trimmed.startsWith('"') && trimmed.endsWith('"')) || (trimmed.startsWith("'") && trimmed.endsWith("'"))) {
    return trimmed.slice(1, -1);
  }
  return trimmed;
}

function parseInlineList(value) {
  const trimmed = value.trim();
  if (trimmed === "[]") return [];
  if (!trimmed.startsWith("[") || !trimmed.endsWith("]")) return null;
  const body = trimmed.slice(1, -1).trim();
  if (!body) return [];
  return body.split(",").map((item) => stripQuotes(item.trim())).filter(Boolean);
}

function parseFrontmatter(text, file) {
  const match = text.match(/^---\r?\n([\s\S]*?)\r?\n---\r?\n/);
  if (!match) {
    errors.push(`${file}: missing YAML frontmatter`);
    return null;
  }
  const root = {};
  const stack = [{ indent: -1, value: root }];
  const lines = match[1].split(/\r?\n/);

  for (let index = 0; index < lines.length; index += 1) {
    const raw = lines[index];
    if (!raw.trim() || raw.trim().startsWith("#")) continue;
    const indent = raw.match(/^ */)[0].length;
    const line = raw.trim();
    while (stack.length > 1 && indent <= stack[stack.length - 1].indent) stack.pop();
    const parent = stack[stack.length - 1].value;

    if (line.startsWith("- ")) {
      if (!Array.isArray(parent)) {
        errors.push(`${file}: unsupported list item at frontmatter line ${index + 1}: ${raw}`);
        continue;
      }
      parent.push(stripQuotes(line.slice(2)));
      continue;
    }

    const parsed = line.match(/^([A-Za-z0-9_-]+):(?:\s*(.*))?$/);
    if (!parsed) {
      errors.push(`${file}: unsupported frontmatter line ${index + 1}: ${raw}`);
      continue;
    }
    const [, key, rawValue = ""] = parsed;
    const value = rawValue.trim();
    if (!value) {
      let container = {};
      const next = lines.slice(index + 1).find((candidate) => candidate.trim());
      if (next && next.match(/^ */)[0].length > indent && next.trim().startsWith("- ")) container = [];
      parent[key] = container;
      stack.push({ indent, value: container });
    } else if (value === "true" || value === "false") {
      parent[key] = value === "true";
    } else {
      const inlineList = parseInlineList(value);
      parent[key] = inlineList ?? stripQuotes(value);
    }
  }
  return root;
}

function hasSkillScripts(file) {
  const skillRoot = path.dirname(file);
  const scriptsDir = path.join(skillRoot, "scripts");
  if (!fs.existsSync(scriptsDir)) return false;
  const stack = [scriptsDir];
  while (stack.length) {
    const current = stack.pop();
    for (const entry of fs.readdirSync(current, { withFileTypes: true })) {
      const full = path.join(current, entry.name);
      if (entry.isDirectory()) stack.push(full);
      if (entry.isFile()) return true;
    }
  }
  return false;
}

function requireValue(file, data, key) {
  if (data[key] === undefined || data[key] === null || data[key] === "") {
    errors.push(`${file}: missing ${key}`);
    return false;
  }
  return true;
}

function validateEnum(file, label, value, allowed, severity = "error") {
  if (value === undefined || value === null || value === "") {
    (severity === "warning" ? warnings : errors).push(`${file}: missing ${label}`);
    return;
  }
  if (!allowed.has(value)) {
    errors.push(`${file}: invalid ${label}: ${value}`);
  }
}

function validateList(file, label, value, { required = true } = {}) {
  if (value === undefined) {
    (required ? errors : warnings).push(`${file}: missing ${label}`);
    return [];
  }
  if (!Array.isArray(value)) {
    errors.push(`${file}: ${label} must be a list`);
    return [];
  }
  return value;
}

function validateDate(file, label, value) {
  if (typeof value !== "string" || !/^\d{4}-\d{2}-\d{2}$/.test(value)) {
    errors.push(`${file}: ${label} must be YYYY-MM-DD`);
  }
}

function validateSkill(file) {
  const data = parseFrontmatter(fs.readFileSync(file, "utf8"), file);
  if (!data) return;
  checked.push(file);

  requireValue(file, data, "name");
  requireValue(file, data, "description");
  if (requireValue(file, data, "license") && !allowedLicense.has(data.license) && !/^[A-Za-z0-9-.+]+$/.test(data.license)) {
    errors.push(`${file}: invalid license: ${data.license}`);
  }
  const compatibility = validateList(file, "compatibility", data.compatibility);
  for (const item of compatibility) {
    if (!allowedCompatibility.has(item)) errors.push(`${file}: invalid compatibility: ${item}`);
  }
  for (const required of ["copilot", "claude", "bes-fleet"]) {
    if (!compatibility.includes(required)) warnings.push(`${file}: compatibility missing ${required}`);
  }
  validateList(file, "allowed-tools", data["allowed-tools"]);

  const metadata = data.metadata;
  if (!metadata || typeof metadata !== "object" || Array.isArray(metadata)) {
    warnings.push(`${file}: missing metadata block`);
    return;
  }

  const provenance = metadata.bes_provenance;
  if (!provenance || typeof provenance !== "object" || Array.isArray(provenance)) {
    warnings.push(`${file}: missing metadata.bes_provenance`);
  } else {
    validateEnum(file, "metadata.bes_provenance.origin", provenance.origin, allowedOrigin);
    const sourceUrls = validateList(file, "metadata.bes_provenance.source_urls", provenance.source_urls, { required: false });
    validateList(file, "metadata.bes_provenance.borrowed_from", provenance.borrowed_from, { required: false });
    validateEnum(file, "metadata.bes_provenance.upstream_status", provenance.upstream_status, allowedUpstream);
    if (provenance.origin && provenance.origin !== "internal" && provenance.origin !== "unknown" && sourceUrls.length === 0) {
      warnings.push(`${file}: non-internal origin should declare source_urls`);
    }
    if (provenance.last_audited === undefined) errors.push(`${file}: missing metadata.bes_provenance.last_audited`);
    else validateDate(file, "metadata.bes_provenance.last_audited", provenance.last_audited);
    if (provenance.audit_cadence !== undefined) validateEnum(file, "metadata.bes_provenance.audit_cadence", provenance.audit_cadence, allowedCadence);
    validateEnum(file, "metadata.bes_provenance.adoption_status", provenance.adoption_status, allowedAdoption);
    if (provenance.security_review !== undefined) validateEnum(file, "metadata.bes_provenance.security_review", provenance.security_review, allowedSecurity);
  }

  const surface = metadata.bes_tool_surface;
  if (!surface || typeof surface !== "object" || Array.isArray(surface)) {
    warnings.push(`${file}: missing metadata.bes_tool_surface`);
  } else {
    validateEnum(file, "metadata.bes_tool_surface.scripts", surface.scripts, allowedScripts);
    if (typeof surface.network !== "boolean") errors.push(`${file}: metadata.bes_tool_surface.network must be boolean`);
    validateList(file, "metadata.bes_tool_surface.dependencies", surface.dependencies);
    const secrets = validateList(file, "metadata.bes_tool_surface.secrets", surface.secrets);
    validateList(file, "metadata.bes_tool_surface.allowed_tools", surface.allowed_tools, { required: false });
    for (const secret of secrets) {
      if (/[=]/.test(secret) || secret.length > 80) errors.push(`${file}: secrets must name env vars, not values`);
    }
    const scriptsPresent = hasSkillScripts(file);
    if (scriptsPresent && surface.scripts !== "present") warnings.push(`${file}: skill-local scripts present but scripts != present`);
    if (!scriptsPresent && surface.scripts !== "none") warnings.push(`${file}: scripts declared present but no skill-local scripts found`);
  }
}

const files = [];
for (const root of scanRoots) collectSkillFiles(root, files);
for (const file of files.sort()) validateSkill(file);

for (const message of warnings) console.error(`warn: ${message}`);
for (const message of errors) console.error(`error: ${message}`);
console.log(`skill provenance: ${checked.length} files checked, ${warnings.length} warning(s), ${errors.length} error(s)`);

if (errors.length > 0 || (strict && warnings.length > 0)) process.exit(1);
NODE
