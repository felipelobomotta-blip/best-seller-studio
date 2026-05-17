---
name: literary-agent-panel
description: Use when a manuscript, book concept, opening pages, synopsis, query package, or Book Genesis project needs simulated literary agent, acquiring editor, bookseller, and target-reader review for market viability and publication readiness.
---

# Literary Agent Panel

This skill stress-tests a book from the market side. It does not write chapters. It decides whether a real agent, editor, bookseller, or target reader would keep reading, ask for pages, buy, recommend, or reject.

Use after:

- book idea/concept exists
- market research exists or is being questioned
- first 10 pages need commercial review
- full draft needs submission readiness review
- editorial package needs agent/editor feedback
- Book Genesis reaches audit, final score, or delivery

## Panel Roles

Run 4 voices, with separate verdicts:

1. Literary Agent: query hook, category clarity, comp fit, sellability, submission risk.
2. Acquiring Editor: manuscript strength, list fit, editorial labor, positioning.
3. Bookseller/Category Buyer: shelf fit, cover/copy expectations, reader promise.
4. Target Reader: opening pull, emotional promise, readability, recommendability.

## Review Inputs

Read only available materials:

- `PROJECT_STATE.yaml`
- `research/market-research.md`
- `foundation/positioning.md`
- opening pages or chapter files
- synopsis/query/cover copy
- `evaluations/genesis-score.md`

If a required market artifact is missing, flag it as a blocker instead of inventing confidence.

## Verdict Scale

Use one verdict per panel role:

- `PASS`: would continue, request, acquire, stock, or recommend.
- `FLAG`: viable but needs specific fixes.
- `BLOCK`: would reject or abandon for commercial/product reasons.

Overall verdict is the weakest role verdict. One `BLOCK` means not market-ready.

## Evaluation Criteria

Score 1-10 with short evidence:

- Category clarity
- Reader promise
- Opening-page pull
- Voice distinctiveness
- Comp-title fit
- Commercial pacing
- Emotional stakes
- Shelf/thumbnail fit
- Submission package strength
- Launch/platform leverage

## Output Format

Write to `evaluations/agent-panel.md` when inside a project.

```markdown
# Literary Agent Panel

## Overall Verdict
[PASS/FLAG/BLOCK] - [one sentence why]

## Panel Verdicts
| Role | Verdict | Reason |
|---|---|---|
| Literary Agent | ... | ... |
| Acquiring Editor | ... | ... |
| Bookseller/Buyer | ... | ... |
| Target Reader | ... | ... |

## Scores
| Criterion | Score | Evidence |
|---|---:|---|
| Category clarity | ... | ... |
| Reader promise | ... | ... |
| Opening-page pull | ... | ... |
| Voice distinctiveness | ... | ... |
| Comp-title fit | ... | ... |
| Commercial pacing | ... | ... |
| Emotional stakes | ... | ... |
| Shelf/thumbnail fit | ... | ... |
| Submission package strength | ... | ... |
| Launch/platform leverage | ... | ... |

## Top Rejection Risks
1. ...
2. ...
3. ...

## Fix Before Submission
1. ...
2. ...
3. ...

## Best Market Angle
[Specific positioning angle]

## Query/Package Notes
[What to change in logline, synopsis, comps, cover brief, or author bio]
```

## Rules

- Be candid. Do not flatter weak work.
- Use current-market logic. If comp titles are old, flag.
- Never promise bestseller status.
- Separate taste objections from commercial blockers.
- For Portuguese projects, evaluate Brazilian/Portuguese-language market fit unless user asks global/US.
