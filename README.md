<div align="center">

<img src="assets/brand/logo-banner.svg" alt="Book Genesis" width="720">

### Ten books in thirty days. One pipeline. Any AI agent.

[![License: MIT](https://img.shields.io/badge/License-MIT-D4A574?style=for-the-badge&labelColor=0A0E27)](LICENSE)
[![Agents](https://img.shields.io/badge/Agents-Claude%20Code%20·%20Codex%20·%20Antigravity%20·%20Kimi-D4A574?style=for-the-badge&labelColor=0A0E27)](#use-it-with-any-agent)
[![Pipeline](https://img.shields.io/badge/Pipeline-7%20phases-D4A574?style=for-the-badge&labelColor=0A0E27)](#the-pipeline)
[![Score](https://img.shields.io/badge/Genesis%20Score-10%20dimensions-D4A574?style=for-the-badge&labelColor=0A0E27)](#the-genesis-score)

[**English**](README.md) · [**Português**](README.pt-BR.md)

</div>

---

## What it is

**Book Genesis** is an agent-agnostic AI book production pipeline. It takes a one-line idea through research, drafting, adversarial audit, scoring, and an editorial package — and it runs anywhere a capable AI agent can read and write files.

It is **not** a binary, a service, or a single prompt. It is a reproducible folder of markdown instructions, manifests, scoring rules, and project-file contracts. That is why it ports cleanly to Claude Code, Codex, Antigravity, Kimi, and every other file-aware agent on the market.

> **The pitch is simple.** 10+ book projects in under 30 days. One pipeline. Any capable agent.

---

## Why this version works better

The older V4/V5 system had many specialized skills and mid-draft gates. It caught problems, but it could push the writer to optimize for the evaluator while drafting. The universal core keeps the durable parts and removes the pressure points.

| Old V4/V5                          | Universal Core                         |
| ---------------------------------- | -------------------------------------- |
| Many live constraints              | One active phase prompt at a time      |
| Implicit assumptions               | Explicit assumptions file              |
| In-memory state                    | File-backed, durable project state     |
| Score-while-drafting               | Draft first, judge later               |
| Score before audit                 | Adversarial audit before final score   |
| Free-form scores                   | Evidence required for every score      |
| Single-tool dependency             | Portable across any file-aware agent   |

Both pipelines ship in the repo. Use whichever fits your run.

---

## The pipeline

The universal core runs a **7-phase workflow**:

```
  ╭──────────────╮      ╭──────────────╮      ╭──────────────╮      ╭──────────────╮
  │  0. INTAKE   │ ───▶ │ 1. FOUNDATION│ ───▶ │ 2. ARCHITEC- │ ───▶ │  3. DRAFTING │
  │  brief +     │      │  characters  │      │  outline +   │      │   chapter    │
  │  market map  │      │  theme curve │      │  tension map │      │    files     │
  ╰──────────────╯      ╰──────────────╯      ╰──────────────╯      ╰──────────────╯
                                                                            │
  ╭──────────────╮      ╭──────────────╮      ╭──────────────╮              │
  │ 6. EDITORIAL │ ◀─── │  5. FINAL    │ ◀─── │ 4. ADVERSAR. │ ◀────────────╯
  │  blurb +     │      │   SCORE      │      │    AUDIT     │
  │  cover brief │      │              │      │              │
  ╰──────────────╯      ╰──────────────╯      ╰──────────────╯
```

Default project shape:

```
PROJECT_STATE.yaml
ASSUMPTIONS.md
artifacts/
manuscript/
  └── chapters/
evaluations/
delivery/
```

---

## The Genesis Score

Every book is judged on **10 dimensions**:

`Originality` · `Theme` · `Characters` · `Prose` · `Pacing` · `Emotion` · `Coherence` · `Market` · `Voice` · `Opening`

Approval requires:

- A strong weighted average,
- **No weak floor dimension**,
- Cited evidence for every score,
- A passed adversarial audit.

> **The floor principle.** A book is only as strong as its weakest major dimension. Brilliant prose does not save a broken opening. A killer hook does not save dead pacing.

---

## Use it with any agent

| Tool          | How to run it                                                                | Status                       |
| ------------- | ---------------------------------------------------------------------------- | ---------------------------- |
| Claude Code   | Install the full skill folder, then `/book-genesis-codex`                    | Native multi-file skill      |
| Codex         | Point Codex at `AGENTS.md` or `skills/book-genesis-codex/SKILL.md`           | Native repo workflow         |
| Antigravity   | Open the repo and tell the agent to follow `AGENTS.md`                       | Agent playbook               |
| Kimi          | Upload the skill folder or paste `AGENTS.md` plus the manifest               | File-backed workflow         |
| Other agents  | Provide the full `skills/book-genesis-codex/` folder                         | Portable markdown system     |

**Claude Code example:**

```bash
/book-genesis-codex pt-br "thriller sobre um ex-policial que descobre que sua vingança é parte do sistema que ele odeia"
```

**Codex / Antigravity / Kimi:**

> Use Book Genesis. Read `AGENTS.md`, then follow `skills/book-genesis-codex/references/pipeline/manifest.yaml` one phase at a time. Persist decisions to files. Do not skip adversarial audit.

---

## Installation

The installer copies full skill directories — including `references/` — into Claude Code's skill directory.

**macOS / Linux**

```bash
./install.sh
```

**Windows PowerShell**

```powershell
.\install.ps1
```

After installation:

```
/book-genesis-codex
```

Legacy commands still work:

- `/book-genesis` — V5 Craft Mode
- `/book-genesis-full` — full V4/V5 production pipeline

---

## Proof gallery

10 book projects pushed through the system in under 30 days. The local run is now above 10 ready or near-ready manuscripts in under a month. Manuscripts stay private; the repo ships pipeline, covers, public artifacts, and case studies.

| Case                       | Genre                              | Pipeline note                                                  |
| -------------------------- | ---------------------------------- | -------------------------------------------------------------- |
| Protocolo Não Encontrado   | memoir / generational essay        | early simpler pipeline, strong external response               |
| Age of Aquarius            | hermetic fantasy                   | high internal Genesis Score after iterative evaluation         |
| Protocolo Vermelho         | vigilante thriller                 | V4→V5 calibration showed score inflation and pacing limits     |
| The Source Code            | literary sci-fi thriller           | long revision loops revealed diminishing returns               |
| The Source Code v2         | literary sci-fi thriller rewrite   | audit-first scoring proved safer than endless polishing        |
| The Trumpet Protocol       | apocalyptic literary thriller      | custom theological-prophetic coherence dimension               |
| The Seventh Manuscript     | dark academia literary thriller    | foundation for unreliable narration and meta-genre risk        |
| Iron Core                  | LitRPG / dungeon core              | genre-specific SRE-methodology constraint                      |
| The Saltwater Loaf         | cozy mystery                       | fair-play clue system and cozy-market constraints              |
| Agenda 2030                | apocalyptic sci-fi/fantasy         | large-scale RAG / foundation calibration                       |

Full summaries in [`SHOWCASE.md`](SHOWCASE.md), [`docs/book-gallery.md`](docs/book-gallery.md), and [`examples/cases/`](examples/cases/).

---

## When to use which pipeline

**Use the Universal Core when** you are starting a new book, moving between Claude Code / Codex / Antigravity / Kimi, want fewer constraints during drafting, or care about durable project state.

**Use legacy V4/V5 when** you need the old skill network, want maximum explicit control, are reproducing earlier cases, or are testing a specialized sub-skill.

---

## Repository map

```
skills/book-genesis-codex/   current universal core
skills/                      legacy Claude Code skills
agents/                      legacy autonomous orchestrator
knowledge/                   benchmark and craft references
docs/                        architecture, migration, scoring, portability
examples/                    public artifacts and case studies
assets/covers/               covers and cover concepts
```

---

## Portability

Book Genesis is designed to work across agent environments because the real product is not a binary or a single prompt — it is a reproducible file workflow.

- `AGENTS.md` tells repo-aware agents what to do.
- `skills/book-genesis-codex/SKILL.md` explains the operating loop.
- `references/pipeline/manifest.yaml` defines the phase order.
- `references/prompts/` contains the phase prompts.
- `references/scoring/` contains the scoring contract.

See [`docs/portability.md`](docs/portability.md) for Claude Code, Codex, Antigravity, Kimi, and generic agent instructions.

---

## License

MIT. Use it, fork it, ship books with it. If a manuscript ships because of Book Genesis, a credit in the colophon is appreciated, never required.

---

<div align="center">

**Built for writers who want to run the loop, not babysit it.**

[Read the docs](docs/) · [Browse the cases](SHOWCASE.md) · [Star on GitHub](https://github.com/felipelobomotta-blip/book-genesis-v4)

</div>
