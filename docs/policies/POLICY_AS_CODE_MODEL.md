# Policy-as-Code Model

## Purpose

This document defines the lightweight policy-as-code model used by the repository.

The goal is not to replace formal governance. The goal is to make minimum repository evidence checks repeatable in CI.

## Current policy checks

The repository should validate that:

- required documentation exists
- environment examples exist without real values
- CI workflow exists
- policy guard workflow exists
- smoke testing is configurable
- audit evidence templates exist
- architecture boundaries are documented

## Policy levels

| Level | Meaning | Example |
| --- | --- | --- |
| PASS | Required evidence exists | README and workflows are present |
| WARN | Optional or future evidence is missing | Smoke test target not configured |
| FAIL | Required evidence is missing | Evidence template absent |

## Principle

A compliance automation workflow should not simply print success. It should explain what was checked and why the result is acceptable.
