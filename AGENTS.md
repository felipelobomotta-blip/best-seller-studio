# Agent Instructions

This repository contains Book Genesis, a book-production workflow made of markdown skills and reference files.

## Default Behavior

When asked to create, plan, draft, audit, score, revise, or package a book, use the portable Codex edition unless the user explicitly asks for legacy V4/V5:

```text
skills/book-genesis-codex/SKILL.md
```

Load the manifest before advancing phases:

```text
skills/book-genesis-codex/references/pipeline/manifest.yaml
```

## Rules

- Persist important decisions to files.
- Keep `PROJECT_STATE.yaml` synchronized with reality.
- Keep `ASSUMPTIONS.md` explicit.
- Load only the prompt for the active phase.
- Do not skip Phase 4: Adversarial Audit.
- Do not run final scoring before the adversarial audit.
- Write Portuguese artifacts and prose in Portuguese when the book is in Portuguese.
- Treat legacy V4 material as historical reference unless the user asks for it.

## Legacy Commands

- `/book-genesis`: V5 Craft Mode legacy orchestrator.
- `/book-genesis-full`: full legacy production pipeline.
- `/book-genesis-codex`: portable Codex-era pipeline.

## Public Documentation

- `README.md`: public overview.
- `docs/book-genesis-codex.md`: Codex migration and current architecture.
- `docs/portability.md`: Codex, Claude Code, and Antigravity usage notes.
- `SHOWCASE.md`: casebook summary.
- `examples/cases/`: six case studies.
