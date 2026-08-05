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

# ---------- Owner-sealed records are exempt from FIELD advisories ----------
# `approved`, `decomposed`, `closed` and `superseded` are owner-only flips
# (schema §1.3). Once the owner has sealed a record, its front-matter is
# settled history: a warning that a field is missing or `null` is then a true
# statement about WHEN the SPEC was written, not a defect anyone will fix —
# because policy forbids editing a landed SPEC to satisfy a rule introduced
# after it (OPERATING_MODEL "Capture-after"). Nagging about it every run trains
# readers to ignore lint, which is the harm this exemption removes.
#
# Measured at introduction: 18 SPECs warned on `ideated_in`; 17 were `closed`
# and 1 `approved`. Every one predated the field it was being judged against.
# `ideated_in` entered the schema 2026-05-01 (`884d683`); nine of the warning
# SPECs are dated 2026-04-29.
#
# An agent CANNOT use this to silence itself: all four statuses are owner-only.
# A `draft` / `needs-revision` / `in-execution` / `verified` SPEC is still
# fully checked — which is exactly while it is still being authored.
# Authority: file://specs/2026-07-24-owner-sealed-field-advisories/SPEC.md
OWNER_SEALED=0
st_raw="${FM[status]:-}"
st_raw="${st_raw%"${st_raw##*[![:space:]]}"}"   # trim trailing whitespace
case "$st_raw" in approved|decomposed|closed|superseded) OWNER_SEALED=1 ;; esac

# ideated_in advisory (non-blocking): schema §1.2 REQUIRES a repo-relative
# path for non-fastpath SPECs. `null` is valid for type: fastpath (which skips
# the IDEA phase) and for a DECLARED capture-after SPEC (which also skips it —
# the work is landed first under owner directive, so no IDEA ever existed).
#
# The declaration is what makes the second case checkable. Before it existed,
# the OPERATING_MODEL capture-after precondition ("lint-spec.sh exit 0") was
# unsatisfiable by construction: capture-after has no IDEA, so ideated_in had
# to be null, so lint always exited 2. Measured 6 of 6 such SPECs, five of
# them already closed — a gate that always fires teaches the fleet to ignore
# gates. Authority: file://specs/2026-07-24-capture-after-lint-declaration/SPEC.md
#
# `capture_after` must carry an owner citation, not a bare `true`: the
# OPERATING_MODEL condition is an EXPLICIT owner directive, so an
# unattributable declaration would let any agent self-authorise the skip.
if [[ "$ARTEFACT" == "spec" && "$TYPE" != "fastpath" && $OWNER_SEALED -eq 0 ]]; then
    iv="${FM[ideated_in]:-}"
    ca="${FM[capture_after]:-}"
    ca="${ca%"${ca##*[![:space:]]}"}"   # trim trailing whitespace
    if [[ -n "$ca" && ! "$ca" =~ ^owner://[A-Za-z0-9][A-Za-z0-9._/-]*$ ]]; then
        emit_warn "front-matter" "$fm_end" "capture_after '$ca' must be an owner citation with a non-empty reference (owner://<ref>), not a bare scheme or flag (schema §1.2)"
    fi
    if [[ -z "$iv" ]]; then
        emit_warn "front-matter" "$fm_end" "ideated_in absent (schema §1.2 REQUIRES a repo-relative path for non-fastpath specs)"
    elif [[ "$iv" == "no-decision" ]]; then
        : # ideation happened, produced no decision, so no artefact — schema §1.2
    elif [[ "$iv" == "null" ]]; then
        if [[ -z "$ca" ]]; then
            emit_warn "front-matter" "$fm_end" "ideated_in is 'null' (allowed only for type: fastpath, or a capture-after spec declaring capture_after: owner://<ref>)"
        fi
    elif [[ "$iv" != */* ]]; then
        emit_warn "front-matter" "$fm_end" "ideated_in '$iv' is not a repo-relative path (schema §1.2)"
    fi
fi

# ---------- tracker_ref: form only ------------------------------------------
# Schema §1.2 makes tracker_ref CONDITIONAL: REQUIRED only when the OWNER ASKS
# for a GitHub issue tree. Nothing else triggers it.
#
# The former >3-slice arm was deleted 2026-08-05. OPERATING_MODEL "Work
# visibility" narrowed the Tier 2 trigger to owner-request-only on 2026-07-31
# ("A GitHub issue tree is REQUIRED only when the owner asks for one. Nothing
# else triggers it."), but this lint kept enforcing the retired slice-count
# arm, so a SPEC with four honest slices was refused its own quality gate.
# Owner-request is not mechanically detectable from the artefact, so nothing
# replaces it: only the FORM of a supplied value is checked here.
# Authority: file://agents/OPERATING_MODEL.md "Work visibility";
#            file://specs/2026-08-05-pocock-v1-2-and-harness-parity/SPEC.md S8
if [[ "$ARTEFACT" == "spec" && "$TYPE" != "fastpath" ]]; then
    tr_raw="${FM[tracker_ref]:-}"
    tr_raw="${tr_raw%"${tr_raw##*[![:space:]]}"}"   # trim trailing whitespace
    if [[ -n "$tr_raw" \
       && "$tr_raw" != "pending" \
       && ! "$tr_raw" =~ ^https://github\.com/[A-Za-z0-9._-]+/[A-Za-z0-9._-]+/issues/[0-9]+$ ]]; then
        emit_err "front-matter" "$fm_end" "tracker_ref '$tr_raw' must be a GitHub issue URL or the literal 'pending' (schema §1.2)"
    fi
fi

# ---------- Fastpath may NEVER carry guardrail paths (mechanical) ----------
# Fastpath lands at `status: closed`, so it passes through NEITHER Rule 20 gate
# (`approved-pending-owner`, `verified`). Prose alone therefore cannot hold this
# line: an author who misclassifies touch points would land a fleet-propagating
# change with no cross-family review at all. So it is enforced here, on the
# declared file list, as an ERROR rather than an advisory.
# Found by the r2 cross-family reviewer after the prose-only version shipped
# (`file://specs/2026-07-24-lifecycle-lean-execution/SPEC.md` §9).
# The rule has an EPOCH. Ten fastpath SPECs landed before 2026-07-24 naming
# manifest-carried paths, which was permitted then; policy forbids editing a
# landed record to satisfy a later rule (OPERATING_MODEL "Capture-after"), so
# they are read under the schema in force when they were written.
#
# The owner-sealed exemption CANNOT be reused here: a fastpath SPEC is authored
# at `status: closed` by design, so keying on seal would disable the guardrail
# on exactly the SPECs it must stop. The id date is the discriminator instead.
# An unparseable id fails SAFE (enforce).
_FP_EPOCH=20260724
_fp_enforce=1
if [[ "${FM[id]:-}" =~ ^([0-9]{4})-([0-9]{2})-([0-9]{2})- ]]; then
    _fp_date="${BASH_REMATCH[1]}${BASH_REMATCH[2]}${BASH_REMATCH[3]}"
    (( _fp_date < _FP_EPOCH )) && _fp_enforce=0
fi
if [[ "$ARTEFACT" == "spec" && "$TYPE" == "fastpath" && $_fp_enforce -eq 1 ]]; then
    _mf_root="$(cd "$(dirname "$(readlink -f "$0")")/.." && pwd)"
    _manifests=()
    for _m in fleet-files.txt fleet-hooks.txt fleet-skills.txt; do
        [[ -f "$_mf_root/scripts/$_m" ]] && _manifests+=("$_mf_root/scripts/$_m")
    done
    if (( ${#_manifests[@]} > 0 )); then
        # Collect backticked paths from the whole SPEC body: the declared file
        # list lives in "## 2. Files changed" but authors also name paths inline,
        # and over-collecting is the fail-safe direction here.
        while read -r _cand; do
            [[ -z "$_cand" ]] && continue
            # Match ONLY "a manifest entry is a path-boundary suffix of the
            # candidate". The reverse direction over-rejects: a bare `README.md`
            # matched the manifest's scripts/audit-entry-docs-fixtures/README.md
            # and blocked an innocent fastpath. Caught by this check's own
            # false-positive test row, not by review.
            for _mf in "${_manifests[@]}"; do
                if awk -v c="$_cand" '
                        /^[[:space:]]*(#|$)/ {next}
                        { e=$1
                          if (c==e) {found=1; exit}
                          n=length(c)-length(e)
                          if (n>0 && substr(c,n+1)==e && substr(c,n,1)=="/") {found=1; exit} }
                        END{exit(found?0:1)}' "$_mf" 2>/dev/null; then
                    emit_err "fastpath" "$fm_end" "type: fastpath names a manifest-carried path ('$_cand') — fastpath skips the review gates entirely, and propagation blast radius disqualifies it. (This is a FASTPATH threshold, not a Rule-20 classification: since 2026-07-31 Rule 20 fires on consequence, not path.) Escalate to a task/contract/decision SPEC."
                    break 2
                fi
            done
        done < <(grep -oE '`[A-Za-z0-9_./-]+\.(md|sh|json|mjs|txt|ya?ml)`' "$TARGET" | tr -d '`' | sort -u)
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
