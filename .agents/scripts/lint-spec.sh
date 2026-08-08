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

strip_section_number() {
    local t="$1"
    if [[ "$t" =~ ^[0-9]+(\.[0-9]+)*[.][[:space:]]+(.*)$ ]]; then printf '%s' "${BASH_REMATCH[2]}"; else printf '%s' "$t"; fi
}

# ---------- Fastpath may NEVER carry a Rule 20 CONSEQUENCE (mechanical) -----
# Fastpath lands at `status: closed`, so it passes through NEITHER Rule 20 gate
# (`approved-pending-owner`, `verified`). It is the one lane where a guardrail
# change reaches production unreviewed, so the bar is enforced here as an ERROR
# rather than left to prose
# (`file://specs/2026-07-24-lifecycle-lean-execution/SPEC.md` §9).
#
# WHAT CHANGED 2026-08-06: the test was manifest-PATH membership — any hit
# against fleet-{files,hooks,skills}.txt. Path is a proxy for risk, and after
# Rule 20 narrowed to consequence on 2026-07-31 ("Path is not risk") the proxy
# failed BOTH ways: it barred a typo fix in a propagating doc, and it ADMITTED
# `.github/workflows/ci.yml`, a repo-local `.claude/hooks/<guard>.sh` and
# `.github/hooks/*.json` — none manifest-carried — so removing a CI gate was
# fastpath-eligible. Now the ENFORCEMENT SURFACE blocks and the manifest hit
# only advises. Net-tightening.
# Authority: file://specs/2026-08-06-guardrail-proxies-to-consequence/SPEC.md S1
#
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

# Paths that ARE an enforcement surface: changing one alters what is blocked or
# allowed, which is Rule 20's first test. Deliberately independent of the
# propagation manifests — a repo-local guard is exactly the case the old test
# missed.
# Broadened 2026-08-06 after the cross-family reviewer probed it: the first
# draft MISSED fleet-selfcheck.sh, tools/policy-check.sh, a guardrail outside
# .claude/hooks/, and — found here — `agents/githooks/pre-commit`, this fleet's
# OWN git hook, because the pattern demanded a literal dot on `.githooks`.
_FP_CONSEQUENCE_RE='(^|/)\.?githooks/|(^|/)\.github/workflows/|(^|/)hooks?/|(^|/)ci/gates?/|(^|/)(block|warn)-[A-Za-z0-9_.-]+\.(sh|mjs)$|(^|/)(lint|validate|audit|verify|guard)[-_][A-Za-z0-9_.-]+\.(sh|mjs)$|[-_](check|selfcheck|verify|guard|guardrail|policy)\.(sh|mjs)$|(^|/)(settings|permissions)\.json$|guardrail'
# Secrets / branch-protection are Rule 20's other two tests; they are claimed in
# prose rather than by path, so they are matched on the BODY only.
# Scoped and tightened after the first draft matched every SPEC alive: the
# front-matter field `requires_secrets:` tripped `secrets?`, and a bare `token`
# tripped the citation-grammar phrase "source token". A guardrail that fires on
# every artefact is a guardrail nobody reads.
# Broadened 2026-08-06: the tightened draft missed "rotate personal access
# tokens", "the GitHub PAT", and "an SSH private key" — all plainly Rule 20
# secrets work. Each alternative is anchored so the citation-grammar phrase
# "source token" and the front-matter key `requires_secrets` still do not match.
_FP_SECRET_RE='(credential|password|passphrase|private key|ssh key|api[_ -]?key|access[_ -]?tokens?|personal access tokens?|auth[_ -]?tokens?|bearer tokens?|github pat|\bPAT\b|\.env\b|branch[ -]protection|push[ -]protection|required reviewers|rotat(e|ing|ion)[a-z ]*(secret|token|key|credential)|secrets?[ -](handling|management|rotation)|handling secrets|a secret\b|secrets?\.(json|ya?ml))'

# MENTION IS NOT CHANGE (2026-08-07). Both tests below used to read the WHOLE
# document. Rule 20 asks what this SPEC *changes*; a SPEC that names a gate in
# order to say "I looked at this and did not touch it" changes nothing, and §5.2
# Residual risk is exactly where an honest author writes that sentence. So the
# guard fired on the disclosure and stayed silent on the omission — it taxed
# honesty and caught nothing. Observed live: a SPEC whose §2 named three
# documents and no guard was blocked because §5.2 explained a guard it had
# DECLINED to change.
#
# The fleet has ruled on this class once already: heredoc/quoted-string
# "mention immunity" for the dependency validator
# (`file://specs/2026-06-05-dep-validator-mention-immunity/SPEC.md`). This is
# the same defect in a different guard, so it gets the same answer.
#
# The fix is SCOPE, not a waiver. `file://specs/2026-07-02-rule20-strict-no-waiver/SPEC.md`
# forbids a suppression marker here — a `lint-ok:` escape would let an agent
# silence a Rule 20 guard on its own authority — so no marker is offered. Each
# test now reads the region that DECLARES the change:
#
#   (a) consequence  -> the "Files changed" section only. That list IS the
#                       change set; the fastpath template makes it §2 and all
#                       11 landed fastpath SPECs carry it.
#   (b) secrets      -> the body MINUS the Completion Report subtree. Secrets
#                       work is claimed in prose, not by path, so this one
#                       cannot narrow to §2 — but §5 is retrospective narration
#                       ("no credentials were touched"), never a scope claim.
#
# The two grammars stay distinct and that is the point: a bare backticked path
# in §2 DECLARES a change; `file://path:lines` CITES evidence (schema §2). The
# guard reads declarations. See the extractor comment for the measured reason
# citations are excluded even inside §2.
#
# Deleting §2 does NOT disable the guard: with no such section the scan falls
# back to the whole body and the error says so.
# Authority: owner directive `owner://transcript-2026-08-07`;
#            file://specs/2026-08-07-lint-spec-mention-immunity/SPEC.md
if [[ "$ARTEFACT" == "spec" && "$TYPE" == "fastpath" && $_fp_enforce -eq 1 ]]; then
    # Split the body once: the change-set DECLARATION, and the forward-looking
    # body (everything the Completion Report does not narrate).
    #
    # FENCE TRACKING IS LOAD-BEARING, not tidiness. A `##` line inside a fenced
    # code block is sample text, not a section, and treating it as one is
    # directly exploitable — both bypasses below were built and confirmed by
    # the cross-family reviewer (gpt-5.6-sol) against the first draft:
    #
    #   1. A fenced `## Files` set _fp_declared_found=1, which SUPPRESSED the
    #      whole-body fallback, while the document's real declaration lived
    #      under a section named "Change set". `.github/workflows/ci.yml`
    #      declared there was never read. Lint clean; the pre-fix whole-document
    #      scan had caught it.
    #   2. A fenced `## Completion Report` inside §1 opened the CR exemption
    #      early, so the rest of §1 — "Rotate the GitHub PAT used by CI" —
    #      was cut out of _fp_forward and the secrets test never saw it.
    #
    # Both are the SAME defect the fix exists to remove, one level down: the
    # scanner believed a mention of a heading was a heading.
    _fp_declared=""; _fp_declared_found=0; _fp_dec_depth=0; _fp_in_dec=0
    _fp_forward="";  _fp_in_cr=0; _fp_cr_depth=0
    _fp_fence=""
    for ((i=fm_end; i<total_lines; i++)); do
        _fl="${LINES[$i]}"
        # CommonMark fences: ``` or ~~~ (3+), up to 3 leading spaces. A fence
        # closes only on the same marker CHARACTER at the same length or longer,
        # so a ``` inside a ~~~~ block does not close it.
        if [[ "$_fl" =~ ^[[:space:]]{0,3}(\`{3,}|~{3,}) ]]; then
            _fm="${BASH_REMATCH[1]}"
            if [[ -z "$_fp_fence" ]]; then
                _fp_fence="$_fm"
            elif [[ "${_fm:0:1}" == "${_fp_fence:0:1}" && ${#_fm} -ge ${#_fp_fence} ]]; then
                _fp_fence=""
            fi
        elif [[ -z "$_fp_fence" && "$_fl" =~ ^(#{1,6})[[:space:]]+(.*)$ ]]; then
            _fh_depth=${#BASH_REMATCH[1]}
            _fh_title="$(strip_section_number "${BASH_REMATCH[2]}")"
            _fh_title="${_fh_title,,}"
            # A section ends at the next heading of equal-or-shallower depth.
            (( _fp_in_dec && _fh_depth <= _fp_dec_depth )) && _fp_in_dec=0
            (( _fp_in_cr  && _fh_depth <= _fp_cr_depth  )) && _fp_in_cr=0
            # "Files changed", "Files", "Interfaces / Files" — the word, not a
            # substring: `Profiles` must not match. NOT recognised inside the
            # Completion Report: a declaration nested in retrospective narration
            # is not a declaration, and allowing it there let an empty decoy
            # `### Files` suppress the fallback.
            if (( _fp_in_cr == 0 )) && [[ "$_fh_title" =~ (^|[^a-z])files([^a-z]|$) ]]; then
                _fp_in_dec=1; _fp_dec_depth=$_fh_depth; _fp_declared_found=1
            fi
            # ANCHORED. Unanchored, any heading merely containing the phrase
            # ("Notes on Completion Report format") opened the exemption.
            [[ "$_fh_title" =~ ^completion[[:space:]]+reports?$ ]] && { _fp_in_cr=1; _fp_cr_depth=$_fh_depth; }
        fi
        # Fenced lines are still CONTENT — only heading detection is suppressed.
        (( _fp_in_dec )) && _fp_declared+="$_fl"$'\n'
        (( _fp_in_cr )) || _fp_forward+="$_fl"$'\n'
    done
    # Fail SAFE: no declaration section means the guard has nothing authoritative
    # to read, so it reads everything rather than going quiet.
    _fp_scope_note=""
    if (( _fp_declared_found == 0 )); then
        _fp_declared="$(tail -n +$((fm_end + 1)) "$TARGET")"
        _fp_scope_note=" (no '## Files changed' section found, so the WHOLE document was scanned — add the section to scope this check to your actual change set)"
    fi

    # DECLARATION grammar only: a bare backticked path, which is how the
    # fastpath template writes §2. `file://path` and `file://path:12-20` are
    # CITATION grammar (schema §2) — evidence for a claim, not a claim of
    # change — so they are deliberately NOT extracted even inside §2. Tested:
    # extracting them re-created this very bug one level down, blocking
    # `good-fastpath-propagating-doc.md` because its §2 cites
    # `file://specs/2026-08-06-guardrail-proxies-to-consequence/SPEC.md`, whose
    # id contains "guardrail" and so hits _FP_CONSEQUENCE_RE. A citation is a
    # mention. Same rule, one level down.
    _fp_paths="$(printf '%s' "$_fp_declared" \
        | grep -oE '`[A-Za-z0-9_./-]+\.(md|sh|json|mjs|txt|ya?ml)`' | tr -d '`' | sort -u)"

    # A declaration section that names no path leaves the consequence test with
    # nothing to read. That is not an error — §2 may legitimately be prose — but
    # it MUST be visible, because it is also the shape an empty decoy section
    # would take to suppress the fallback.
    if (( _fp_declared_found == 1 )) && [[ -z "$_fp_paths" ]]; then
        emit_warn "fastpath" "$fm_end" "the 'Files changed' section names no backticked path, so the Rule 20 consequence check had nothing to read. List each changed file as \`path/to/file.ext\`."
    fi

    # (a) BLOCKING — an enforcement surface, as DECLARED in the change set.
    _fp_hit=""
    while read -r _cand; do
        [[ -z "$_cand" ]] && continue
        if printf '%s' "$_cand" | grep -qE "$_FP_CONSEQUENCE_RE"; then _fp_hit="$_cand"; break; fi
    done <<< "$_fp_paths"
    if [[ -n "$_fp_hit" ]]; then
        emit_err "fastpath" "$fm_end" "type: fastpath DECLARES a change to an enforcement surface ('$_fp_hit') — that alters what a gate blocks or allows, which is the Rule 20 bar, and fastpath skips both review gates. Escalate to a task/contract/decision SPEC.${_fp_scope_note}"
    fi

    # (b) BLOCKING — secrets or branch/push protection, claimed in prose.
    if printf '%s' "$_fp_forward" | grep -qiE "$_FP_SECRET_RE"; then
        emit_err "fastpath" "$fm_end" "type: fastpath claims secrets, credentials or branch/push protection work — both are Rule 20 tests, and fastpath skips both review gates. Escalate to a task/contract/decision SPEC. (The Completion Report is exempt: saying there afterwards that no secret was touched is not a claim that one was.)"
    fi

    # (c) ADVISORY — manifest-carried, but no consequence detected. Propagating
    # work correlates with risk without defining it, so this nudges, never blocks.
    if [[ -z "$_fp_hit" ]]; then
        _mf_root="$(cd "$(dirname "$(readlink -f "$0")")/.." && pwd)"
        _manifests=()
        for _m in fleet-files.txt fleet-hooks.txt fleet-skills.txt; do
            [[ -f "$_mf_root/scripts/$_m" ]] && _manifests+=("$_mf_root/scripts/$_m")
        done
        if (( ${#_manifests[@]} > 0 )); then
            while read -r _cand; do
                [[ -z "$_cand" ]] && continue
                # Match ONLY "a manifest entry is a path-boundary suffix of the
                # candidate". The reverse direction over-rejects: a bare
                # `README.md` matched scripts/audit-entry-docs-fixtures/README.md
                # and blocked an innocent fastpath.
                for _mf in "${_manifests[@]}"; do
                    if awk -v c="$_cand" '
                            /^[[:space:]]*(#|$)/ {next}
                            { e=$1
                              if (c==e) {found=1; exit}
                              n=length(c)-length(e)
                              if (n>0 && substr(c,n+1)==e && substr(c,n,1)=="/") {found=1; exit} }
                            END{exit(found?0:1)}' "$_mf" 2>/dev/null; then
                        emit_warn "fastpath" "$fm_end" "type: fastpath names a manifest-carried path ('$_cand'). Not blocking — path is not risk (Rule 20, narrowed 2026-07-31) — but propagating work often IS consequential: confirm it alters no gate verdict, no secret, no branch protection."
                        break 2
                    fi
                done
            done <<< "$_fp_paths"
        fi
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
