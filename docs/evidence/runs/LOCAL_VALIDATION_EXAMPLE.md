# Local Validation Example

This file is a stable evidence example. The live generated Markdown output is written to:

```text
/docs/evidence/runs/LOCAL_VALIDATION_REPORT.md
```

The plain text report is written to:

```text
Compliance_Audit_Report.txt
```

## Example result

| Status | Component | Details |
| --- | --- | --- |
| PASS | Documentation baseline | README.md found |
| PASS | Environment template | .env.example found |
| PASS | Python dependency manifest | requirements.txt found |
| PASS | Audit orchestrator | orchestrate.sh found |
| PASS | CI workflow | .github/workflows/compliance-check.yml found |
| PASS | Policy guard workflow | .github/workflows/policy-guard.yml found |
| PASS | Smoke test | tests/smoke/test_infra.py found |
| PASS | Documentation directory | docs found |
| PASS | Control mapping directory | docs/controls found |
| PASS | Evidence directory | docs/evidence found |
| PASS | Policy documentation directory | docs/policies found |
| PASS | Architecture documentation directory | docs/architecture found |
| PASS | ISO 27001 control mapping | docs/controls/ISO27001_CONTROL_MAPPING.md found |
| PASS | Audit evidence template | docs/evidence/AUDIT_EVIDENCE_TEMPLATE.md found |
| PASS | Validation report example | docs/evidence/VALIDATION_REPORT_EXAMPLE.md found |
| PASS | Policy-as-code model | docs/policies/POLICY_AS_CODE_MODEL.md found |
| PASS | System boundary model | docs/architecture/SYSTEM_BOUNDARIES.md found |
| PASS | AI boundary model | docs/architecture/AI_BOUNDARY_MODEL.md found |
| WARN | Smoke test target | Target URL not configured; smoke test should skip |
| WARN | Ranking component | Legacy prototype present; not active CI path |

## Example summary

| Metric | Count |
| --- | ---: |
| PASS | 18 |
| WARN | 2 |
| FAIL | 0 |

**FINAL STATUS:** PASSED_WITH_WARNINGS
