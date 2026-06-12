from pathlib import Path
import subprocess


def test_orchestrator_script_contains_report_header():
    script = Path("orchestrate.sh").read_text(encoding="utf-8")
    assert "ITSM COMPLIANCE AUDIT REPORT" in script
    assert "Compliance_Audit_Report.txt" in script
    assert "FINAL STATUS" in script


def test_orchestrator_generates_markdown_report():
    result = subprocess.run(
        ["bash", "orchestrate.sh"],
        check=False,
        text=True,
        capture_output=True,
    )

    assert result.returncode == 0, result.stderr

    report = Path("docs/evidence/runs/LOCAL_VALIDATION_REPORT.md")
    assert report.exists()

    content = report.read_text(encoding="utf-8")
    assert "# Local Validation Report" in content
    assert "| Status | Component | Details |" in content
    assert "| PASS | Documentation baseline | README.md found |" in content
    assert "**FINAL STATUS:**" in content
