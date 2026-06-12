# CodeBuild Status

## Current status

`buildspec.yml` is a legacy example and is not the primary validation path for this proof-of-concept.

The primary validation path is:

```text
GitHub Actions -> Policy Guard -> tests -> orchestrator -> audit report
```

## Required cleanup before use

Before using CodeBuild as an active path, review and update:

- runtime versions
- dependency installation
- Terraform assumptions
- artifact handling
- environment configuration
- smoke test target configuration

## Portfolio interpretation

Treat CodeBuild support as a future / optional integration idea until the buildspec has been separately validated.
