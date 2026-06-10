<div align="center">

# Book Genesis V4

### You give it an idea. It gives you a complete book.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Runs%20on-Claude%20Code-blueviolet?style=for-the-badge)](https://claude.ai/code)
[![Quality Gate](https://img.shields.io/badge/Quality%20Gate-8.5%2F10%20floor-brightgreen?style=for-the-badge)](#the-3-quality-gates)
[![Agents](https://img.shields.io/badge/Agents-8%20specialized-orange?style=for-the-badge)](#the-agents)

</div>

---

No writing experience needed. No prompt engineering. No creative blocks.

You type your idea — even a half-formed shower thought — and the system runs 8 specialized AI agents in sequence to produce a complete, publication-ready manuscript that passes a real quality gate before it lands in your hands.

**Built and battle-tested over 6 months. 10+ books shipped.**

---

## How it works (plain English)

```
Your idea
   ↓
Phase 1  — Research
           The system reads the market for your genre.
           Finds what readers already hate about existing books.
           That gap becomes your weapon.
   ↓
Phase 1.5 — Premise Forge  ← NEW in V4
           Your raw idea is a seed, not a contract.
           5 structural variants are generated and scored.
           The one with the strongest irony engine wins.
           Your idea is elevated, not replaced.
   ↓
Phase 2  — Foundation & Outline
           Characters, theme, chapter map.
           Every story beat is intentionally subverted — no predictable arcs.
   ↓
           ── CHECKPOINT 1: you see the forged premise and approve ──
   ↓
Phase 3  — Chapter Loop (runs for every chapter)
           Write → polish dialogue → add hooks → inject chaos
           → score independently → if below 8.5: polish loop (max 5×)
           → if still failing: escalate
   ↓
Phase 4/5 — Full Manuscript Review & Revision
           Re-attacks any chapter below target.
           CVI score (bestseller potential index) must hit 9.0+.
   ↓
           ── CHECKPOINT 2: you see every chapter score and approve ──
   ↓
Phase 6  — Delivery Package
           Logline, back-cover blurb, query letter, formatted files.
   ↓
           ── CHECKPOINT 3: your finished book ──
```

You interact 3 times. The rest is automatic.

---

## The 3 quality gates

Most AI writing tools generate and hope. This one generates and enforces.

### Gate 1 — Premise floor ≥ 8.0

Before a single word of the book is written, the premise must pass.

The system scores 6 dimensions:
- **Hook** — does the one-sentence pitch make someone say "oh damn"?
- **Irony engine** — is there a structural contradiction that generates conflict automatically? (Think Gone Girl, Breaking Bad.) A situation without a contradiction maxes at 5.0.
- **Native escalation** — can you describe 3 escalation steps that follow from the premise itself — not external events?
- **The question** — is there one central question that only the last page can answer?
- **Gap fit** — is this book meaningfully different from every comparable title on the market?
- **Retellability** — can someone retell this premise tomorrow without notes? (This is the word-of-mouth mechanism — and the bestseller mechanism.)

The floor IS the score. A premise that scores 9/9/9/9/9/4 is a 4, not an 8.5.

If the winning variant scores below 8.0, the system flags exactly which dimension is blocking it at Checkpoint 1. No silent failures.

### Gate 2 — Chapter floor ≥ 8.5 (Genesis Score)

Every chapter is scored by an evaluator agent that **did not write it**.

The evaluator runs:
- 7-dimension Genesis Score where the floor is the score
- A 20-pattern anti-AI scan (clichés, hedged language, fake profundity, etc.)
- Simulation of 4 reader types (casual, hostile, genre fan, stretch reader)
- "Would you remember this chapter tomorrow?" test

Chapters between the hard floor (genre-adjusted 7.0–7.5) and the target (8.5) enter a Polish Loop:
- The evaluator produces a "Path to 8.5" work order naming exactly which dimensions need fixing
- The editor attacks only those dimensions
- Anti-inflation protection: +0.5 per cycle maximum, so jumping from 7.5 to 8.5 takes ≥ 2 real improvement cycles

Three possible verdicts: **PASS** / **POLISH** / **FAIL** — no ambiguity.

### Gate 3 — Exit: all chapters ≥ 8.5 + CVI-Launch ≥ 9.0

The manuscript only reaches the delivery package when:
1. Every chapter has passed Gate 2
2. The CVI-Launch (Commercial Viability Index) scores 9.0+

CVI-Launch 9.0 means "breakout potential, Gone Girl tier" — the manuscript has a word-of-mouth mechanism built in at the structural level.

---

## The agents

8 agents. Each is a markdown file — a complete system prompt with scoring rules, behavioral constraints, and anti-gaming protections.

| Agent | What it does |
|---|---|
| `book-orchestrator` | The pipeline manager. Dispatches all other agents, enforces every gate, routes the 3 checkpoints to you. |
| `book-researcher` | Reads the market. Finds comp titles and reader frustrations from real negative reviews. |
| `book-architect` | Forges the premise (dispatch 0), builds the structural foundation + outline (dispatch 1), writes the voice DNA (dispatch 2). |
| `book-writer` | Writes chapters with the 8.5 bar baked in as design targets, not post-hoc evaluation criteria. |
| `book-evaluator` | Independent scorer. Never writes — only judges. Runs the full audit: 7 dimensions + 4 readers + 20-pattern scan. |
| `book-editor` | Surgical revision. Only edits the specific dimensions blocking 8.5. Never touches what's working. |
| `book-disruptor` | Chaos agent. Runs between writer and evaluator to break predictability and inject human noise. |
| `book-packager` | Delivery. Logline, synopsis, query letter, formatted ebook + print files. |

---

## What's new in V4

### Premise Forge (Phase 1.5)

The biggest gap in every previous version: the system was great at executing ideas, but it executed your shower thought exactly as-is. If your raw idea lacked an irony engine, the best prose in the world couldn't save it.

Premise Forge treats your idea as a **seed, not a contract**:

1. Variant 1 = your raw idea scored honestly (if it already scores ≥ 8.0, it wins — forging for the sake of forging is a failure mode)
2. Variants 2–5 = forged versions, each using a different irony engine: invert the protagonist, relocate the stakes, fuse the seed with a real market gap, weaponize the #1 reader frustration from negative comp reviews, collapse two stock characters into one contradiction

**Hard rule: ELEVATE, DON'T REPLACE.** You must recognize your idea inside the winning premise. The `premise.md` output shows you verbatim: "here's what changed from your raw idea and why."

### The 8.5 Gate System

Previous versions targeted 8.5 but had no enforcement mechanism. V4 replaced this with:
- Per-chapter gates that block progress until the score passes
- Polish Loop with directed work orders (editor only touches what the evaluator flagged)
- Anti-inflation: each cycle can add +0.5 max, making it impossible to skip ahead quickly
- Exit gate requiring 100% chapter coverage + CVI-Launch ≥ 9.0
- 3-state verdict system: no more "close enough"

---

## Quick start

**Requirements:** [Claude Code](https://claude.ai/code)

```bash
# macOS / Linux
cp agents/*.md ~/.claude/agents/

# Windows (PowerShell)
Copy-Item agents\*.md $env:USERPROFILE\.claude\agents\
```

Then open Claude Code and type:

```
I have an idea for a book: [your idea here]
```

The `book-orchestrator` agent takes over. You'll be asked to approve 3 times. Everything else runs automatically.

**Cost estimate with Claude Sonnet 4.6:** roughly $20–30 per complete book.

---

## Live test

The first book running the complete V4 pipeline (premise forge → 8.5 gate → exit gate) is **THE LAST COVENANT** — a conspiracy thriller set during the 2026 FIFA World Cup, where a journalist covering the tournament uncovers an extraterrestrial first-contact cover-up.

Currently in production. When finished, the chapter scores and full evaluation artifacts will be published here as the first real-world V4 benchmark.

---

## Honest caveats

- The 8.5 score is an internally-calibrated quality ruler, not an objective market measurement. It's the best proxy available before publishing.
- "Bestseller" has market factors outside the manuscript (cover, marketing, timing, platform). The gate attacks the word-of-mouth mechanism (retellability + CVI), which is what the system can actually control.
- The quality gate guarantees the system never silently ships below target. It does not guarantee the target is perfectly calibrated for your specific genre.

---

## File structure

```
book-genesis-v4/
├── agents/
│   ├── book-orchestrator.md   ← start here
│   ├── book-architect.md
│   ├── book-researcher.md
│   ├── book-writer.md
│   ├── book-evaluator.md
│   ├── book-editor.md
│   ├── book-disruptor.md
│   └── book-packager.md
├── README.md
├── CHANGELOG.md
└── LICENSE
```

Each agent file is self-contained — readable on its own to understand exactly what the pipeline does at each step.

---

## Why I built this

I wanted to prove that an LLM pipeline could produce consistently high-quality long-form writing — not one-off lucky outputs, but a repeatable system with measurable quality.

The key insight: the bottleneck is not generation. It's evaluation. Good generation is easy; evaluation infrastructure is what makes quality actually hold over a full manuscript.

Book Genesis V4 is my current answer. The premise forge, the 8.5 gate, and the evaluator architecture are the parts I'm most proud of.

---

Built by [Felipe Lobo](https://github.com/felipelobomotta-blip) — developer and builder from Brazil.

MIT licensed. Fork it, build on it, ship books.

[X / Twitter](https://x.com/FelipeL72767971) · [LinkedIn](https://www.linkedin.com/in/felipeloboai/)
