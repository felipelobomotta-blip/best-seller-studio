# Book Genesis

Book Genesis is an agent-agnostic AI book production pipeline for **Claude Code, Codex, Antigravity, Kimi, and any file-based AI agent**.

The pitch is simple:

```text
10+ book projects in under 30 days. One pipeline. Any capable agent.
```

It started as a large Claude Code skill network for taking a one-line idea through research, drafting, evaluation, revision, and packaging. The current version is a smaller universal core: fewer live constraints, durable project files, adversarial audit before scoring, and an editorial package at the end.

The repository keeps both:

- **Universal Book Genesis Core**: the current portable pipeline in `skills/book-genesis-codex/`
- **Legacy V4/V5**: the older Claude Code skill system in `skills/`, `agents/`, and `knowledge/`

The folder name `book-genesis-codex` is kept for compatibility with existing installs. The workflow itself is not Codex-only.

## Proof Gallery

10 book projects were pushed through the system in under 30 days, and the broader local run is now above 10 ready or near-ready books in under a month. The manuscripts are private, but the repo includes the pipeline, covers/cover concepts, public artifacts, and case studies.

| | | | | |
|---|---|---|---|---|
| <img src="assets/covers/protocolo-nao-encontrado.jpeg" width="130" alt="Protocolo Nao Encontrado cover"> | <img src="assets/covers/age-of-aquarius.svg" width="130" alt="Age of Aquarius cover concept"> | <img src="assets/covers/protocolo-vermelho.svg" width="130" alt="Protocolo Vermelho cover concept"> | <img src="assets/covers/the-source-code.png" width="130" alt="The Source Code cover"> | <img src="assets/covers/the-trumpet-protocol.svg" width="130" alt="The Trumpet Protocol cover concept"> |
| Protocolo Nao Encontrado | Age of Aquarius | Protocolo Vermelho | The Source Code | The Trumpet Protocol |

See the full 10-book wall in [docs/book-gallery.md](docs/book-gallery.md).

## Use It With Any Agent

Book Genesis is a folder of markdown instructions, manifests, scoring rules, and project-file contracts. That makes it portable across tools that can read files and write project artifacts.

| Tool | How to run it | Status |
|------|---------------|--------|
| Claude Code | Install the full skill folder, then run `/book-genesis-codex` | Native multi-file skill |
| Codex | Point Codex at `AGENTS.md` or `skills/book-genesis-codex/SKILL.md` | Native repo workflow |
| Antigravity | Open the repo and tell the agent to follow `AGENTS.md` | Agent playbook |
| Kimi | Upload/copy the skill folder or paste `AGENTS.md` plus the manifest | File-backed workflow |
| Other agents | Provide the full `skills/book-genesis-codex/` folder | Portable markdown system |

Claude Code example:

```text
/book-genesis-codex pt-br "thriller sobre um ex-policial que descobre que sua vinganca e parte do sistema que ele odeia"
```

Codex, Antigravity, Kimi, or another repo-aware agent:

```text
Use Book Genesis. Read AGENTS.md, then follow skills/book-genesis-codex/references/pipeline/manifest.yaml one phase at a time.
Persist decisions to files. Do not skip adversarial audit.
```

## Pipeline

The universal core runs a 7-phase workflow:

| Phase | Name | Main output |
|-------|------|-------------|
| 0 | Intake | assumptions, brief, market map, story engine |
| 1 | Foundation | characters, theme, emotional curve |
| 2 | Architecture | outline, tension map, opening strategy |
| 3 | Drafting | chapter files |
| 4 | Adversarial Audit | structural criticism before scoring |
| 5 | Final Score | Genesis Score report |
| 6 | Editorial Package | logline, blurb, synopsis, cover brief, query strategy |

Default project shape:

```text
PROJECT_STATE.yaml
ASSUMPTIONS.md
artifacts/
manuscript/
  chapters/
evaluations/
delivery/
```

## Why This Version Works Better

The older V4/V5 system had many specialized skills and mid-draft gates. It caught problems, but it could make the writer optimize for the evaluator while drafting. The universal core keeps the durable parts and removes the pressure points:

- one active phase prompt at a time
- explicit assumptions
- file-backed state
- draft before judgment
- adversarial audit before final score
- evidence-based scoring
- portable multi-file structure

Read the migration notes in [docs/book-genesis-codex.md](docs/book-genesis-codex.md).

## Installation

The installer copies full skill directories, including `references/`, into Claude Code's skill directory.

macOS / Linux:

```bash
./install.sh
```

Windows PowerShell:

```powershell
.\install.ps1
```

After installation:

```text
/book-genesis-codex
```

Legacy commands are still available:

- `/book-genesis`: V5 Craft Mode
- `/book-genesis-full`: full V4/V5 production pipeline

## Portability

Book Genesis is designed to work across agent environments because the real product is not a binary, service, or single prompt. It is a reproducible file workflow:

- `AGENTS.md` tells repo-aware agents what to do.
- `skills/book-genesis-codex/SKILL.md` explains the operating loop.
- `references/pipeline/manifest.yaml` defines the phase order.
- `references/prompts/` contains the phase prompts.
- `references/scoring/` contains the scoring contract.

See [docs/portability.md](docs/portability.md) for Claude Code, Codex, Antigravity, Kimi, and generic agent instructions.

## Genesis Score

The current score uses 10 dimensions:

1. Originality
2. Theme
3. Characters
4. Prose
5. Pacing
6. Emotion
7. Coherence
8. Market
9. Voice
10. Opening

Approval requires a strong weighted average, no weak floor dimension, evidence for every score, and a passed adversarial audit. The floor principle remains central: the book is only as strong as its weakest major dimension.

## Case Studies

The casebook documents how the system behaved across different genres and maturity levels:

| Case | Genre | Pipeline note | Status |
|------|-------|---------------|--------|
| Protocolo Nao Encontrado | memoir / generational essay | early simpler pipeline, strong external response | documented artifact set |
| Age of Aquarius | hermetic fantasy | high internal Genesis Score after iterative evaluation | documented artifact set |
| Protocolo Vermelho | vigilante thriller | V4 to V5 calibration showed score inflation and pacing limits | local production case |
| The Source Code | literary sci-fi thriller | long revision loops revealed diminishing returns | local production case |
| The Source Code v2 | literary sci-fi thriller rewrite | portable-agent revision proved audit-first scoring is safer than endless polishing | local production case |
| The Trumpet Protocol | apocalyptic literary thriller | custom theological-prophetic coherence dimension | local production case |
| The Seventh Manuscript | dark academia literary thriller | portable-agent foundation for unreliable narration and meta-genre risk | local production case |
| Iron Core | LitRPG / dungeon core | genre-specific SRE-methodology constraint | local production case |
| The Saltwater Loaf | cozy mystery | fair-play clue system and cozy-market constraints | local production case |
| Agenda 2030 | apocalyptic sci-fi/fantasy | large-scale RAG/foundation calibration | local production case |

Read the full summaries in [SHOWCASE.md](SHOWCASE.md), [docs/book-gallery.md](docs/book-gallery.md), and [examples/cases/](examples/cases/).

Private manuscripts are not included. Public examples contain summaries, outlines, synopses, score reports, and case notes only.

## Repository Map

```text
skills/book-genesis-codex/       current universal core
skills/                          legacy Claude Code skills
agents/                          legacy autonomous orchestrator
knowledge/                       benchmark and craft references
docs/                            architecture, migration, scoring, portability
examples/                        public artifacts and case studies
assets/covers/                   covers and cover concepts
```

## When To Use Which Pipeline

Use **Universal Book Genesis Core** when:

- starting a new book
- moving between Claude Code, Codex, Antigravity, Kimi, and other agent IDEs
- you want fewer constraints during drafting
- you care about durable project state

Use **legacy V4/V5** when:

- you need the old skill network
- you want maximum explicit control
- you are reproducing earlier cases
- you are testing a specialized sub-skill

## License

[MIT](LICENSE)
