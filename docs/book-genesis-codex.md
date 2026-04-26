# Book Genesis Codex

Book Genesis Codex is the portable, reduced-pressure version of Book Genesis created during the Codex migration. It keeps the parts that proved durable across books and removes the brittle orchestration that made earlier versions overfit their own rubrics.

The core is available as a multi-file skill at:

```text
skills/book-genesis-codex/
  SKILL.md
  agents/openai.yaml
  references/
    pipeline/manifest.yaml
    pipeline/phases.md
    prompts/
    scoring/genesis-score-codex.md
    legacy-v4-book-genesis.md
```

## Why It Exists

V4/V5 were powerful but heavy. The system grew into 17 phases, 19 skills, multiple mid-draft gates, quality loops, chaos passes, mechanical preprocessors, and entity tracking. That helped catch problems, but it also trained the writer to satisfy the evaluator while drafting.

The Codex version makes a different bet:

- persist decisions to files
- keep the active phase small
- draft before judging
- audit structurally before scoring
- score with evidence, not vibes
- package only after the audit and score are clear

## Canonical Pipeline

| Phase | Name | Output |
|-------|------|--------|
| 0 | Intake | `ASSUMPTIONS.md`, brief, market map, story engine |
| 1 | Foundation | characters, theme, emotional curve |
| 2 | Architecture | outline, tension map, opening strategy |
| 3 | Drafting | chapter files in `manuscript/chapters/` |
| 4 | Adversarial Audit | structural criticism before score |
| 5 | Final Score | Genesis Score Codex report |
| 6 | Editorial Package | logline, blurb, synopsis, cover brief, query strategy |

Default project tree:

```text
PROJECT_STATE.yaml
ASSUMPTIONS.md
artifacts/
manuscript/
  chapters/
evaluations/
delivery/
```

## Genesis Score Codex

The Codex score uses 10 dimensions:

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

Approval requires:

- Floor Score >= 8.5
- Weighted Average >= 9.0
- no dimension below 8.0
- evidence for every dimension
- adversarial audit not marked `MAJOR REWRITE`

The floor principle remains the most important rule: the manuscript is only as strong as its weakest major dimension.

## What Changed From V4/V5

| Earlier system | Codex edition |
|----------------|---------------|
| Many active skills at once | One active phase prompt at a time |
| `STATE.yaml` plus specialized state files | `PROJECT_STATE.yaml` plus explicit assumptions |
| Mid-draft scoring pressure | Draft first, audit and score after |
| Chaos and mechanical passes inside drafting | Structural variety during drafting, repair after |
| Claude Code first | Portable skill package for Codex, Claude Code, and agent IDEs |
| V4 legacy as default | V4 legacy kept as reference only |

## How It Has Behaved In Codex

The Codex port has been most reliable when treated as a project-file workflow, not as a chat-only prompt. Its strongest behavior so far:

- it resumes cleanly because state is explicit
- it separates assumption, drafting, audit, and score
- it avoids the earlier "19 constraints while writing" failure mode
- it makes migration between agents easier because every phase is a file contract

The remaining risk is not technical. It is editorial: any AI writing system can inflate its own assessment if audit and scoring are not adversarial. That is why Phase 4 is mandatory and cannot be skipped.

## Usage Notes

For a new project:

```text
/book-genesis-codex pt-br "memoir sobre burnout e reconstrucao profissional"
```

For an existing manuscript:

```text
/book-genesis-codex audit this manuscript and continue from Phase 4
```

For packaging only:

```text
/book-genesis-codex create the editorial package from this approved manuscript
```

Use the old `/book-genesis` or `/book-genesis-full` only when you explicitly want the legacy Claude Code pipeline.
