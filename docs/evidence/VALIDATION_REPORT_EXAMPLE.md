# Validation Report Example

This example shows the intended shape of generated repository-state evidence.

```text
ITSM COMPLIANCE AUDIT REPORT
Generated: YYYY-MM-DD HH:MM:SS
Environment: Local-Validation / GitHub Actions
Scope: Repository-state evidence validation
--------------------------------------------------
Status | Component | Details
--------------------------------------------------
PASS | Documentation baseline | README.md found
PASS | Environment template | .env.example found
PASS | CI workflow | compliance workflow found
WARN | Smoke test target | Target URL not configured; smoke test should skip
WARN | Ranking component | Legacy prototype present; not active CI path
--------------------------------------------------
Summary: PASS=10 WARN=2 FAIL=0
FINAL STATUS: PASSED_WITH_WARNINGS
```

## Interpretation

`PASSED_WITH_WARNINGS` is acceptable for local or portfolio POC validation when optional environment-specific values are not configured.

`FAILED` means required repository evidence is missing.
