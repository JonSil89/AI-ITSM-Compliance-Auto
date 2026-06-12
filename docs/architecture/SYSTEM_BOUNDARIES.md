# System Boundaries

## Purpose

This document defines the current boundaries of the AI-ITSM Compliance Auto proof-of-concept.

## In scope

- repository-state evidence generation
- lightweight policy checks
- GitHub Actions validation
- optional smoke test target validation
- ISO 27001 mapping documentation baseline
- audit evidence templates
- legacy RankLSTM prototype as future ranking component

## Out of scope

- production compliance certification
- production GRC platform behavior
- autonomous remediation
- direct deployment
- full ITSM API integration
- production RAG stack

## Active validation path

```text
repository contents -> policy guard -> tests -> orchestrator -> audit report
```

## Future integration boundary

Future integrations should be added behind explicit adapters and environment-specific configuration.
