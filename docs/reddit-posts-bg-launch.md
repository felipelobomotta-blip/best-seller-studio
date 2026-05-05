# Reddit Launch Posts — Book Genesis

Quatro posts com ângulos diferentes pra reduzir flag de cross-post. Ordem sugerida: do mais seguro pro mais arriscado.

---

## 1) r/ClaudeAI

**Title:** I built a Claude Code skill that runs a 7-phase book production pipeline (Book Genesis V4)

**Body:**

Been using Claude Code daily for fiction work and kept hitting the same wall: scoring during drafting pushes you to write for the evaluator. So I built a skill folder that flips it.

`/book-genesis-codex` runs one phase prompt at a time:

0. Intake (brief, market map, story engine)
1. Foundation (characters, theme, emotional curve)
2. Architecture (outline, tension map, opening)
3. Drafting (chapter files)
4. **Adversarial audit** (structural criticism BEFORE any scoring)
5. Final score across 10 dimensions
6. Editorial package (logline, blurb, synopsis, cover brief)

Everything persists to files (PROJECT_STATE.yaml, ASSUMPTIONS.md, manuscript/, etc.) so the agent can resume any phase across sessions. Same skill works on Codex, Antigravity, Kimi — anything file-aware.

Result so far: 10+ book projects through it in under 30 days.

Repo (MIT): https://github.com/felipelobomotta-blip/book-genesis-v4

Curious how others are structuring multi-phase Claude Code skills — would love feedback on the audit-before-score sequencing.

---

## 2) r/SideProject

**Title:** I open-sourced my AI book production pipeline — 10+ books in 30 days

**Body:**

Spent the last few months iterating on a workflow for writing fiction with AI assistance. The first version had 19 different live constraints and I kept burning out trying to please the evaluator. Stripped it down to a 7-phase loop with one constraint per phase.

What's in the repo:

- The universal core (markdown skill folder, agent-agnostic)
- The legacy V4/V5 system (kept for compatibility)
- 10 case studies across genres — memoir, hermetic fantasy, vigilante thriller, LitRPG, cozy mystery, apocalyptic literary
- Cover concepts for each
- Pipeline manifest, phase prompts, scoring contract

The pipeline is portable across Claude Code, Codex, Antigravity, Kimi — anywhere an agent can read and write files.

Numbers: 10+ book projects pushed through in <30 days. Manuscripts stay private; everything else is public.

MIT licensed. Would love feedback from other indie builders on what's working / what's broken in the workflow.

https://github.com/felipelobomotta-blip/book-genesis-v4

---

## 3) r/LocalLLaMA

**Title:** Agent-agnostic file-backed pipeline for long-form generation (Book Genesis V4)

**Body:**

Sharing a pattern that's been working well for me on long-form generation. The thing I kept getting wrong with local/agentic setups was state management — losing thread between sessions, losing context between phases, scoring at the wrong time.

Book Genesis is a markdown-only pipeline (no binary, no model wrapper). The agent reads:

- `AGENTS.md` — what to do
- `manifest.yaml` — phase order
- `prompts/` — one phase prompt at a time
- `scoring/` — evidence-based scoring contract
- `PROJECT_STATE.yaml` — durable state

7 phases, one active prompt at a time, file-backed. Tested on Claude Code natively; ports cleanly to anything that does file IO + reasoning.

Key architectural choice: **adversarial audit before scoring**. Phase 4 is structural criticism, runs before any quantitative dimension. Stops score inflation cold.

10 dimensions in the score (originality, theme, characters, prose, pacing, emotion, coherence, market, voice, opening) with floor principle — weakest dimension caps the book.

Repo + case studies + manifest: https://github.com/felipelobomotta-blip/book-genesis-v4

Interested in feedback on the file-backed multi-phase pattern — does this generalize beyond fiction?

---

## 4) r/writing

⚠️ **Aviso:** este sub é hostil com ferramentas de IA. Risco alto de remoção/downvote. Posto só se você quiser mesmo. Use o flair de "Resources" ou "Discussion" se permitido.

**Title:** A workflow that puts the writer back in front of the AI evaluator (open source)

**Body:**

I'm a writer who started using AI assistance and kept noticing my drafts getting worse, not better. Took a while to figure out why: the system was scoring my pages while I was still writing them, and my brain was bending toward what made the evaluator happy instead of what the story needed.

Stripped my workflow down to one rule: **no scoring during the draft. Audit the structure adversarially. Then score with evidence.**

What I ended up with is a 7-phase pipeline (intake → foundation → architecture → drafting → audit → score → editorial package) that runs on any AI tool that reads files. The audit phase is structural criticism only — it has to find the cracks in the book before anything gets a number. Score then uses 10 dimensions and a floor principle: a book is only as strong as its weakest one. Brilliant prose doesn't save a broken opening.

The whole thing is open-source markdown — no plugin, no binary. The point is to keep the writer in charge of the loop.

If anyone here is trying to use AI carefully on fiction, the workflow file is here: https://github.com/felipelobomotta-blip/book-genesis-v4

Genuinely interested in feedback from writers — especially what's missing from the audit phase.

---

## Posting hygiene

- Stagger by ~2-4 hours between subs (not all in one sitting).
- Read at least 2-3 recent threads in each sub before posting (mods check).
- If you have karma in any sub, post there first.
- Reply to every comment within first 2 hours — engagement quality matters more than upvotes for the algorithm.
- If a post gets removed, ask the mods why politely. Don't repost.
