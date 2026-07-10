#!/usr/bin/env bash
# lint-spec.sh — lean lint for BES IDEA.md and SPEC.md artefacts.
#
# WS-SPEC lean (2026-07-01, file://specs/2026-07-01-ws-spec-system-lean/SPEC.md):
# the heavy six-prefix citation grammar + per-paragraph section-inheritance
# heuristic and the RFC-2119 per-section scope enforcement are REPLACED by a
# lighter, SECTION-LEVEL evidence gate. Evidence enforcement is RETAINED —
# every content-heavy section MUST carry at least one source token (a path,
# command, URL, or owner quote) — but the accepted forms are broadened and
# the per-paragraph inheritance / RFC machinery is removed. The three typed
# templates collapse to one; `type` is now optional and no longer selects a
# template.
#
# Non-mutating, offline. Exits:
#   0 — clean   1 — blocking errors   2 — advisory-only warnings   64 — usage
#
# Suppression: <!-- lint-ok: no-citation --> anywhere in a content-heavy
# section silences the evidence audit for that section.

set -eu

PROG="$(basename "$0")"
usage() { printf 'usage: %s <path-to-IDEA.md-or-SPEC.md>\n' "$PROG" >&2; exit 64; }

[[ $# -eq 1 ]] || usage
TARGET="$1"
[[ -f "$TARGET" ]] || { printf '%s: not a file: %s\n' "$PROG" "$TARGET" >&2; exit 64; }
BASENAME="$(basename "$TARGET")"

errors=()
warnings=()
emit_err()  { errors+=("$1");  printf '%s:%s: %s\n' "$TARGET" "$2" "$3" >&2; }
emit_warn() { warnings+=("$1"); printf '%s:%s: warning: %s\n' "$TARGET" "$2" "$3" >&2; }

# ---------- Front-matter parse ----------
fm_start=0; fm_end=0
mapfile -t LINES < "$TARGET"
total_lines=${#LINES[@]}
if [[ $total_lines -gt 0 && "${LINES[0]}" == "---" ]]; then
    fm_start=1
    for ((i=1; i<total_lines; i++)); do
        if [[ "${LINES[$i]}" == "---" ]]; then fm_end=$((i+1)); break; fi
    done
fi
if [[ $fm_start -eq 0 || $fm_end -eq 0 ]]; then
    emit_err "front-matter" 1 "missing or unterminated YAML front-matter block"
fi

declare -A FM
if [[ $fm_end -gt 0 ]]; then
    for ((i=1; i<fm_end-1; i++)); do
        line="${LINES[$i]}"
        [[ "$line" =~ ^[[:space:]]*# ]] && continue
        [[ -z "${line// }" ]] && continue
        [[ "$line" =~ ^[[:space:]]*-[[:space:]] ]] && continue
        if [[ "$line" =~ ^([A-Za-z_][A-Za-z0-9_]*):[[:space:]]*(.*)$ ]]; then
            key="${BASH_REMATCH[1]}"; val="${BASH_REMATCH[2]}"
            val="${val%%[[:space:]]#*}"; FM[$key]="$val"
        fi
    done
fi

# ---------- Type detection (type is OPTIONAL post-lean) ----------
ARTEFACT="spec"
[[ "$BASENAME" == "IDEA.md" ]] && ARTEFACT="idea"
if [[ "$ARTEFACT" == "idea" ]]; then TYPE="${FM[implies_spec_type]:-}"; else TYPE="${FM[type]:-}"; fi
case "$TYPE" in
    task|contract|decision|fastpath|"") ;;
    *) emit_warn "front-matter" "$fm_end" "unknown type: $TYPE" ;;
esac

# ideated_in advisory (non-blocking): schema §1.2 REQUIRES a repo-relative
# path for non-fastpath SPECs; `null` is valid ONLY for type: fastpath.
# Surface drift (absent / literal null / non-path) as advisory, not blocking,
# so the REQUIRED field stops silently drifting without dead-stopping work.
if [[ "$ARTEFACT" == "spec" && "$TYPE" != "fastpath" ]]; then
    iv="${FM[ideated_in]:-}"
    if [[ -z "$iv" ]]; then
        emit_warn "front-matter" "$fm_end" "ideated_in absent (schema §1.2 REQUIRES a repo-relative path for non-fastpath specs)"
    elif [[ "$iv" == "null" ]]; then
        emit_warn "front-matter" "$fm_end" "ideated_in is 'null' (allowed only for type: fastpath)"
    elif [[ "$iv" != */* ]]; then
        emit_warn "front-matter" "$fm_end" "ideated_in '$iv' is not a repo-relative path (schema §1.2)"
    fi
fi

# ---------- Required-section presence (unified core) ----------
# WS-SPEC lean: one flexible spec format. The linter enforces only the
# universal CORE sections; the unified template RECOMMENDS the fuller set
# (Goals/Non-Goals, Test/Validation, Evidence, type-specific sections) but
# they are OPTIONAL. `## Normative Language` is no longer required.
required_sections=()
if [[ "$ARTEFACT" == "idea" ]]; then
    required_sections=( "Recommendation" )
elif [[ "$TYPE" == "fastpath" ]]; then
    required_sections=( "Problem" "Completion Report" )
else
    required_sections=( "Problem" "Acceptance Criteria" "Completion Report" )
fi

strip_section_number() {
    local t="$1"
    if [[ "$t" =~ ^[0-9]+(\.[0-9]+)*[.][[:space:]]+(.*)$ ]]; then printf '%s' "${BASH_REMATCH[2]}"; else printf '%s' "$t"; fi
}

observed_titles=(); observed_title_lines=()
for ((i=fm_end; i<total_lines; i++)); do
    line="${LINES[$i]}"
    if [[ "$line" =~ ^##[[:space:]](.+)$ ]]; then
        observed_titles+=("${BASH_REMATCH[1]}"); observed_title_lines+=($((i+1)))
    fi
done

section_present() {
    local needle="$1" t bare_needle bare_t
    bare_needle="$(strip_section_number "$needle")"
    for t in "${observed_titles[@]:-}"; do
        bare_t="$(strip_section_number "$t")"
        [[ "$bare_t" == "$bare_needle" || "$bare_t" == "$bare_needle "* || "$bare_t" == "$bare_needle("* ]] && return 0
    done
    return 1
}

for s in "${required_sections[@]:-}"; do
    if ! section_present "$s"; then emit_err "section" "$fm_end" "missing required section: ## $s"; fi
done

# ---------- Build per-section line ranges ----------
section_starts=(); section_ends=(); section_titles_all=()
for ((idx=0; idx<${#observed_titles[@]}; idx++)); do
    section_titles_all+=("${observed_titles[$idx]}")
    section_starts+=($((observed_title_lines[$idx]-1)))
done
for ((idx=0; idx<${#section_starts[@]}; idx++)); do
    if (( idx+1 < ${#section_starts[@]} )); then section_ends+=($((section_starts[idx+1]-1))); else section_ends+=($((total_lines-1))); fi
done

# ---------- Evidence gate (section-level) ----------
# Every content-heavy section MUST carry at least one SOURCE TOKEN somewhere
# in its body. Source tokens (broadened, lighter than the old six-prefix
# grammar): a citation prefix, a bare URL, a backticked path/file/command, or
# a substantial owner/verbatim quote.
content_heavy_title() {
    # The evidence-bearing sections: those that assert external facts /
    # authority and are expected to cite sources. Narrative sections
    # (Problem, Goals, Test tables) are context, not evidence, and are not
    # gated.
    local t="$1"
    case "$t" in
        *"Authority Map"*|*"Substance Citations"*|*"Current System Facts"*|\
        *"Code/Docs Reality Check"*|*"Decision Criteria"*|*"Candidate Options"*) return 0 ;;
    esac
    return 1
}

has_evidence() {
    local buf="$1"
    [[ "$buf" =~ (file://|cmd://|url://|owner://|judgment://|https?://) ]] && return 0
    [[ "$buf" =~ \`[^\`]*[/.][^\`]*\` ]] && return 0
    [[ "$buf" =~ \`(git|bash|grep|node|npm|sh|cd|rm|cp|mv|cat|sed|awk|test|diff|chmod|find|ls|mkdir|jq|python3?|bats|shellcheck|gh)[[:space:]] ]] && return 0
    # Any backticked multi-word token (command with args, not only the
    # allowlist above) — schema §2.1 accepts "a backticked path/file or
    # command" generically (e.g. `make lint`, `cargo test`).
    [[ "$buf" =~ \`[^\`]+[[:space:]][^\`]+\` ]] && return 0
    [[ "$buf" =~ \"[^\"]{25,}\" ]] && return 0
    # A markdown blockquote carrying a substantial (>=25-char) verbatim /
    # owner quote — the form the IDEA/SPEC templates model for owner quotes.
    [[ "$buf" =~ \>[[:space:]][^\`]{25,} ]] && return 0
    return 1
}

SUPPRESS_CITE='<!-- lint-ok: no-citation -->'

for ((idx=0; idx<${#section_titles_all[@]}; idx++)); do
    title="${section_titles_all[$idx]}"
    content_heavy_title "$title" || continue
    body=""
    in_fence=0
    for ((j=section_starts[idx]+1; j<=section_ends[idx]; j++)); do
        l="${LINES[$j]}"
        [[ "$l" =~ ^\`\`\` ]] && { in_fence=$((1-in_fence)); continue; }
        (( in_fence )) && continue
        body="$body $l"
    done
    [[ "$body" == *"$SUPPRESS_CITE"* ]] && continue
    has_evidence "$body" && continue
    emit_err "evidence" $((section_starts[idx]+1)) "content-heavy section '$title' carries no source token (path / command / URL / owner quote)"
done

# ---------- Summary ----------
n_sections=${#observed_titles[@]}
n_cites=0
for prefix in 'file://' 'cmd://' 'url://' 'owner://' 'judgment://'; do
    c=$(grep -c -F -- "$prefix" "$TARGET" || true); n_cites=$((n_cites + c))
done
printf '== lint-spec.sh summary ==\n'
printf 'target:                %s\n' "$TARGET"
printf 'artefact / type:       %s / %s\n' "$ARTEFACT" "${TYPE:-<unset>}"
printf 'sections (top-level):  %d\n' "$n_sections"
printf 'evidence-token hits:   %d\n' "$n_cites"
printf 'errors:                %d\n' "${#errors[@]}"
printf 'warnings:              %d\n' "${#warnings[@]}"

if (( ${#errors[@]} > 0 )); then exit 1; fi
if (( ${#warnings[@]} > 0 )); then exit 2; fi
exit 0
