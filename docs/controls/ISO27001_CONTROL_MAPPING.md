# ISO 27001 Control Mapping

## Purpose

This document provides a lightweight control mapping baseline for the AI-ITSM Compliance Auto proof-of-concept.

This is not a complete ISO 27001 implementation or certification package. It is a starter mapping for connecting ITSM evidence automation to common information security control themes.

## Control mapping baseline

| Control area | Repository evidence | Validation approach | Status |
| --- | --- | --- | --- |
| Information security policies | `docs/policies/POLICY_AS_CODE_MODEL.md` | Required documentation exists and is version controlled | POC |
| Asset and information classification | `.env.example`, documentation boundaries | Configuration examples avoid real secrets | POC |
| Operations security | `orchestrate.sh`, GitHub Actions workflows | CI-triggered validation and report generation | POC |
| Secure development and change control | Git history, workflows, tests | Repository changes trigger checks | POC |
| Incident and evidence handling | `docs/evidence/` templates | Audit evidence structure is available | POC |

## Evidence principle

The repository should not claim compliance automatically. It should produce structured evidence that a human reviewer can inspect.

## Future improvements

- Add explicit control IDs matching the selected ISO 27001 version.
- Add risk class handling for ITSM documentation changes.
- Add evidence retention rules.
- Add reviewer approval requirements.
