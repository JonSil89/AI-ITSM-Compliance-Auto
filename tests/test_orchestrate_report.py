from pathlib import Path


def test_orchestrator_script_contains_report_header():
    script = Path("orchestrate.sh").read_text(encoding="utf-8")
    assert "ITSM COMPLIANCE AUDIT REPORT" in script
    assert "Compliance_Audit_Report.txt" in script
    assert "FINAL STATUS" in script
