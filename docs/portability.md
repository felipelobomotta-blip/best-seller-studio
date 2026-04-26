# Portability

Book Genesis now has two layers:

1. The legacy Claude Code system in `skills/`, `agents/`, and `knowledge/`.
2. The portable Codex-era skill in `skills/book-genesis-codex/`.

## Codex

Codex can use the skill directly from `skills/book-genesis-codex/` or from Felipe's local skill directory. The important part is that the whole folder is available, not just `SKILL.md`, because the phase prompts live under `references/`.

Expected behavior:

- load `SKILL.md`
- read `references/pipeline/manifest.yaml`
- load only the active phase prompt
- write project state and artifacts to files
- update `PROJECT_STATE.yaml` after every phase or chapter block

## Claude Code

Claude Code supports multi-file skills with `SKILL.md` plus supporting resources. Install with:

```bash
./install.sh
```

or on Windows:

```powershell
.\install.ps1
```

The installer copies the full skill folders into `~/.claude/skills/`, including `references/`.

Invocation:

```text
/book-genesis-codex
```

The older commands remain available:

- `/book-genesis` for the V5 Craft Mode orchestrator
- `/book-genesis-full` for the full V4/V5 production pipeline

## Antigravity And Other Agent IDEs

Antigravity-style agents do not need native skill support to use the Codex edition. Point the agent at:

```text
skills/book-genesis-codex/SKILL.md
skills/book-genesis-codex/references/pipeline/manifest.yaml
```

Then instruct it:

```text
Use Book Genesis Codex. Follow the phase order in the manifest.
Persist every important decision to files. Do not skip adversarial audit.
Only load the active phase prompt.
```

For repo-level agent behavior, `AGENTS.md` gives the same instruction in a cross-tool format.

## What To Copy Into Another Tool

Minimum:

```text
skills/book-genesis-codex/
```

Recommended:

```text
skills/book-genesis-codex/
docs/book-genesis-codex.md
docs/portability.md
examples/cases/
AGENTS.md
```

Do not copy only `SKILL.md`; the skill will lose the phase prompts and scoring contract.
