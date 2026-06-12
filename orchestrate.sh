#!/bin/bash
set -euo pipefail

REPORT_FILE="Compliance_Audit_Report.txt"
REPORT_MD="docs/evidence/runs/LOCAL_VALIDATION_REPORT.md"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
PASS_COUNT=0
WARN_COUNT=0
FAIL_COUNT=0

mkdir -p docs/evidence/runs

line() {
  echo "$1" >> "$REPORT_FILE"
}

md_line() {
  echo "$1" >> "$REPORT_MD"
}

record_result() {
  local status="$1"
  local component="$2"
  local details="$3"

  line "$status | $component | $details"
  md_line "| $status | $component | $details |"
}

pass() {
  PASS_COUNT=$((PASS_COUNT + 1))
  record_result "PASS" "$1" "$2"
}

warn() {
  WARN_COUNT=$((WARN_COUNT + 1))
  record_result "WARN" "$1" "$2"
}

fail() {
  FAIL_COUNT=$((FAIL_COUNT + 1))
  record_result "FAIL" "$1" "$2"
}

check_file() {
  if [ -f "$1" ]; then
    pass "$2" "$1 found"
  else
    fail "$2" "$1 missing"
  fi
}

check_dir() {
  if [ -d "$1" ]; then
    pass "$2" "$1 found"
  else
    fail "$2" "$1 missing"
  fi
}

{
  echo "ITSM COMPLIANCE AUDIT REPORT"
  echo "Generated: $TIMESTAMP"
  echo "Environment: Local-Validation / GitHub Actions"
  echo "Scope: Repository-state evidence validation"
  echo "--------------------------------------------------"
  echo "Status | Component | Details"
  echo "--------------------------------------------------"
} > "$REPORT_FILE"

{
  echo "# Local Validation Report"
  echo
  echo "| Field | Value |"
  echo "| --- | --- |"
  echo "| Generated | $TIMESTAMP |"
  echo "| Environment | Local-Validation / GitHub Actions |"
  echo "| Scope | Repository-state evidence validation |"
  echo
  echo "## Results"
  echo
  echo "| Status | Component | Details |"
  echo "| --- | --- | --- |"
} > "$REPORT_MD"

check_file "README.md" "Documentation baseline"
check_file ".env.example" "Environment template"
check_file "requirements.txt" "Python dependency manifest"
check_file "orchestrate.sh" "Audit orchestrator"
check_file ".github/workflows/compliance-check.yml" "CI workflow"
check_file ".github/workflows/policy-guard.yml" "Policy guard workflow"
check_file "tests/smoke/test_infra.py" "Smoke test"

check_dir "docs" "Documentation directory"
check_dir "docs/controls" "Control mapping directory"
check_dir "docs/evidence" "Evidence directory"
check_dir "docs/policies" "Policy documentation directory"
check_dir "docs/architecture" "Architecture documentation directory"

check_file "docs/controls/ISO27001_CONTROL_MAPPING.md" "ISO 27001 control mapping"
check_file "docs/evidence/AUDIT_EVIDENCE_TEMPLATE.md" "Audit evidence template"
check_file "docs/evidence/VALIDATION_REPORT_EXAMPLE.md" "Validation report example"
check_file "docs/policies/POLICY_AS_CODE_MODEL.md" "Policy-as-code model"
check_file "docs/architecture/SYSTEM_BOUNDARIES.md" "System boundary model"
check_file "docs/architecture/AI_BOUNDARY_MODEL.md" "AI boundary model"

if [ -n "${SMOKE_TEST_URL:-}" ]; then
  pass "Smoke test target" "Target URL configured"
else
  warn "Smoke test target" "Target URL not configured; smoke test should skip"
fi

if [ -f "RankLSTM_model.py" ] && [ -f "main.py" ] && [ -f "data_utils.py" ]; then
  warn "Ranking component" "Legacy prototype present; not active CI path"
else
  warn "Ranking component" "Legacy prototype files incomplete or absent"
fi

line "--------------------------------------------------"
line "Summary: PASS=$PASS_COUNT WARN=$WARN_COUNT FAIL=$FAIL_COUNT"

md_line
md_line "## Summary"
md_line
md_line "| Metric | Count |"
md_line "| --- | ---: |"
md_line "| PASS | $PASS_COUNT |"
md_line "| WARN | $WARN_COUNT |"
md_line "| FAIL | $FAIL_COUNT |"

if [ "$FAIL_COUNT" -gt 0 ]; then
  line "FINAL STATUS: FAILED"
  md_line
  md_line "**FINAL STATUS:** FAILED"
  echo "FAILED: audit reports generated with failed checks: $REPORT_FILE and $REPORT_MD"
  exit 1
fi

if [ "$WARN_COUNT" -gt 0 ]; then
  line "FINAL STATUS: PASSED_WITH_WARNINGS"
  md_line
  md_line "**FINAL STATUS:** PASSED_WITH_WARNINGS"
  echo "PASSED_WITH_WARNINGS: audit reports generated: $REPORT_FILE and $REPORT_MD"
  exit 0
fi

line "FINAL STATUS: PASSED"
md_line
md_line "**FINAL STATUS:** PASSED"
echo "PASSED: audit reports generated: $REPORT_FILE and $REPORT_MD"
