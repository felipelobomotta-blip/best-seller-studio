<div align="center">

<img src="assets/brand/logo-banner.svg" alt="Book Genesis" width="720">

# 📖 Book Genesis

### Turn one line of an idea into a fully evaluated book — with any AI agent.

**10+ book projects shipped in under 30 days. One pipeline. Any capable agent.**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Agent-agnostic](https://img.shields.io/badge/agent-agnostic-orange)](docs/portability.md)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-native-8A63D2)](#use-it-with-any-agent)
[![Codex](https://img.shields.io/badge/Codex-ready-111111)](#use-it-with-any-agent)
[![Build in public](https://img.shields.io/badge/build-in%20public-2ea44f)](#proof)

*Research → draft → adversarial audit → score → editorial package. Files in. Books out.*

</div>

---

## ⚡ TL;DR

```
/book-genesis-codex pt-br "thriller sobre um ex-policial que descobre
que sua vingança é parte do sistema que ele odeia"
```

One command. Seven phases. A durable project folder with a manuscript, a Genesis Score report, and a query-ready editorial package at the end. No magic prompt — a **reproducible file workflow** that runs on Claude Code, Codex, Antigravity, Kimi, or any agent that can read and write files.

> **Honest claim:** this proves a *pipeline scales*, not that every book is great literature. The system gives a writer with a real voice an infrastructure — it does **not** replace the voice. That distinction is the whole point.

---

## 🎬 See it run

> _Demo: a full pipeline run, from one-line idea to scored editorial package._
> _(screencast — see `assets/demo/book-genesis-demo.mp4`)_

<!-- TODO: embed assets/demo/book-genesis-demo.gif here once committed -->

---

## 🧠 What it is

Book Genesis started as a large Claude Code skill network for taking a one-line idea through research, drafting, evaluation, revision, and packaging. The current version is a smaller **universal core**: fewer live constraints, durable project files, **adversarial audit before scoring**, and an editorial package at the end.

The repo keeps both:

- **Universal Book Genesis Core** — the current portable pipeline in `skills/book-genesis-codex/`
- **Legacy V4/V5** — the older Claude Code skill system in `skills/`, `agents/`, and `knowledge/`

---

## 🔥 Why it's different

| Most "AI writes a book" tools | Book Genesis |
| --- | --- |
| One mega-prompt, one shot | **7 explicit phases**, one active prompt at a time |
| Model grades its own homework | **Adversarial audit *before* the score** |
| "It's 9/10!" (vibes) | **Evidence required for every dimension** |
| Optimizes for the evaluator mid-draft | **Draft first, judge later** |
| Locked to one tool | **Portable markdown — runs on any file agent** |
| Average looks fine | **Floor principle: only as strong as the weakest dimension** |

---

## 🚀 Pipeline

<div align="center"><img src="assets/brand/bestseller-skills-banner.svg" alt="Book Genesis pipeline" width="900"></div>

| Phase | Name | Main output |
| --- | --- | --- |
| 0 | Intake | assumptions, brief, market map, story engine |
| 1 | Foundation | characters, theme, emotional curve |
| 2 | Architecture | outline, tension map, opening strategy |
| 3 | Drafting | chapter files |
| 4 | **Adversarial Audit** | structural criticism *before* scoring |
| 5 | Final Score | Genesis Score report |
| 6 | Editorial Package | logline, blurb, synopsis, cover brief, query strategy |

```
PROJECT_STATE.yaml
ASSUMPTIONS.md
artifacts/
manuscript/
  chapters/
evaluations/
delivery/
```

---

## 📊 Genesis Score

Ten dimensions, scored with evidence, gated by a floor — not an average:

`Originality · Theme · Characters · Prose · Pacing · Emotion · Coherence · Market · Voice · Opening`

Approval requires a strong weighted average, **no weak floor dimension**, evidence for every score, and a **passed adversarial audit**. A book is only as strong as its weakest major dimension.

---

## 🏆 Proof

10 book projects pushed through the system in under 30 days, across genres, with no framework refit:

| Case | Genre | Note |
| --- | --- | --- |
| Protocolo Não Encontrado | memoir / generational essay | strong external response · peak score 9.04 · 60.8k words |
| Age of Aquarius | hermetic fantasy | high internal Genesis Score after iterative evaluation |
| Protocolo Vermelho | vigilante thriller | V4→V5 calibration exposed score inflation & pacing limits |
| The Source Code (+v2) | literary sci-fi thriller | audit-first scoring beats endless polishing |
| The Trumpet Protocol | apocalyptic literary thriller | custom theological-prophetic coherence dimension |
| The Seventh Manuscript | dark academia literary thriller | unreliable narration + meta-genre risk |
| Iron Core | LitRPG / dungeon core | genre-specific SRE-methodology constraint |
| The Saltwater Loaf | cozy mystery | fair-play clue system + cozy-market constraints |
| Agenda 2030 | apocalyptic sci-fi/fantasy | large-scale RAG/foundation calibration |

> Manuscripts are private (authors' commercial rights). Public artifacts include covers/concepts, synopses, score reports, and case notes. Full wall: [`docs/book-gallery.md`](docs/book-gallery.md) · [`SHOWCASE.md`](SHOWCASE.md).

---

## 🧩 Use it with any agent

Book Genesis is a folder of markdown instructions, manifests, scoring rules, and project-file contracts — portable across any tool that reads files and writes artifacts.

| Tool | How to run it |
| --- | --- |
| **Claude Code** | Install the skill folder, then run `/book-genesis-codex` |
| **Codex** | Point Codex at `AGENTS.md` or `skills/book-genesis-codex/SKILL.md` |
| **Antigravity** | Open the repo, tell the agent to follow `AGENTS.md` |
| **Kimi** | Upload/copy the skill folder or paste `AGENTS.md` + the manifest |
| **Any agent** | Provide the full `skills/book-genesis-codex/` folder |

```
Use Book Genesis. Read AGENTS.md, then follow
skills/book-genesis-codex/references/pipeline/manifest.yaml one phase at a time.
Persist decisions to files. Do not skip adversarial audit.
```

---

## 📦 Install

**macOS / Linux**
```bash
./install.sh
```

**Windows PowerShell**
```powershell
.\install.ps1
```

Then run `/book-genesis-codex`. Legacy commands remain available: `/book-genesis` (V5 Craft Mode) and `/book-genesis-full` (full V4/V5 pipeline).

---

## 🗺️ Repository map

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

## 🤝 Contributing & License

Issues and PRs welcome. Licensed under [MIT](LICENSE).

<div align="center">

**If this saved you a week of pipeline plumbing, drop a ⭐ — it's the cheapest way to help others find it.**

</div>
