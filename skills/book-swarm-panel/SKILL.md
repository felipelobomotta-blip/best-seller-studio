---
name: book-swarm-panel
description: Use when a book project needs MiroFish-style simulated reader swarms, niche reader panels, public-opinion simulation, launch reaction testing, cultural/sensitivity risk scouting, agent interviews, review heatmaps, or revision tickets from many fictional readers. Use for requests mentioning simulated readers, public opinion, BookTok/Goodreads/Reddit/Twitter reaction, niche specialists, 20+ agents, crowd response, market reaction, or "MiroFish for books".
---

# Book Swarm Panel

Book Swarm Panel runs a clean-room, book-specific swarm simulation inspired by MiroFish architecture. It creates many fictional readers, lets cohorts react to manuscript/package inputs, interviews selected agents, and writes durable evaluation artifacts.

It does not certify cultural approval, publication readiness, or bestseller odds. Simulated readers are diagnostic proxies.

## When To Use

Use this skill for:

- simulated reader panels larger than normal beta reads
- niche/sensitivity-risk scouting before human consultants
- public-opinion tests for a manuscript, premise, cover copy, query, launch angle, or controversy
- BookTok/Goodreads/Reddit/Twitter-style reaction forecasts
- testing whether the book is being framed wrong
- generating heatmaps and revision tickets for `book-editor`
- re-running a post-revision panel with comparable calibration

Do not use this as a replacement for paid sensitivity readers, legal review, factual consultants, or human beta readers.

## Output Location

Always write durable files.

Default run folder:

```text
<project>/evaluations/book-swarm/<YYYY-MM-DD>-<run-slug>/
  persona-roster.json
  sample-map.md
  cohort-reports.md
  interviews.md
  public-opinion-report.md
  risk-heatmap.md
  revision-tickets.md
  score-calibration.md
  SUMMARY.md
```

If no project folder exists, create `evaluations/book-swarm/` near the provided manuscript.

## Core Rule

Separate these claims:

- **Simulated signal:** useful hypothesis from fictional readers.
- **Editorial judgment:** craft/market interpretation by the agent running the skill.
- **Human validation needed:** anything involving lived culture, religion, trauma, law, medicine, or protected communities.

Never phrase simulated niche approval as real community approval.

## Workflow

1. **Load context**
   - Read `PROJECT_STATE.yaml`, `ASSUMPTIONS.md`, `foundation/positioning.md`, `research/market-research.md`, previous `evaluations/*.md`, and manuscript chapters when available.
   - If package testing, also read logline, query, synopsis, cover copy, cover brief, and launch materials.

2. **Choose mode**
   - `reader-swarm`: broad beta reaction.
   - `niche-risk`: cultural, religious, professional, geopolitical, or domain risk.
   - `public-opinion`: social reaction to premise, excerpts, controversy, package, or launch angle.
   - `package-reaction`: agent/editor/bookseller/reader reaction to query, copy, comps, cover, metadata.
   - `post-revision`: compare current run against earlier score using same calibration.
   - `hybrid`: combine modes when user asks for an aggressive market-level pass.

3. **Build sample map**
   - For manuscripts >= 60k words, use stratified sampling unless user asks for full read.
   - Always include first chapter, final chapter, climax, weakest flagged chapters, strongest flagged chapters, and any revised chapters.
   - Record chapters fully read, partially read, and not read.

4. **Generate persona roster**
   - Create 12-80 agents by default.
   - For public opinion, use 40-250 short personas if feasible.
   - Assign each persona: cohort, taste, expertise, tolerance, bias, trigger points, social behavior, likely abandon threshold, influence weight.

5. **Run cohort evaluations**
   - Each cohort reports abandon point, confusion, delight, objection, shareability, rating, and evidence.
   - Specialist/niche cohorts report `PASS`, `FLAG`, or `BLOCK`, with line or scene evidence.

6. **Simulate public reaction when requested**
   - Model 3-5 waves: initial hook, controversy, defense, backlash, stabilization.
   - Track what spreads, what gets misread, who defends the book, who attacks it, and which framing reduces harm.

7. **Interview selected agents**
   - Pick agents with strongest love, strongest rejection, most useful niche concern, and most representative middle response.
   - Ask why they reacted that way and what change would move rating.

8. **Synthesize**
   - Produce `risk-heatmap.md`, `revision-tickets.md`, calibrated scores, and `SUMMARY.md`.
   - Mark every issue as `FIX`, `INVESTIGATE`, `IGNORE`, or `HUMAN-VALIDATE`.

## Default Cohorts

Use only cohorts relevant to the book.

- Literary craft reader: prose, subtext, theme, memorability.
- Genre devourer: pace, hooks, abandon points, emotional payoff.
- Hostile continuity reader: logic, causality, timelines, contradictions.
- Anti-AI reader: synthetic phrasing, symmetry, over-explanation, empty abstraction.
- Literary agent: category, query hook, comps, submission risk.
- Acquiring editor: editorial labor, list fit, manuscript ceiling.
- Bookseller/category buyer: shelf fit, cover/copy promise, hand-sell angle.
- Target reader: desire, readability, recommendation likelihood.
- Non-target skeptic: where book repels wrong audience.
- Public reviewer: likely Goodreads/Amazon review language.
- BookTok/short-form reader: quotability, aesthetic hook, controversy.
- Reddit-style longform commenter: objections, lore analysis, argument threads.
- Niche/sensitivity proxy: cultural, religious, professional, or lived-experience risks.

## Persona Schema

Use this shape in `persona-roster.json`:

```json
{
  "id": "agent_001",
  "cohort": "niche-risk",
  "name": "fictional persona label, not real person",
  "background": "specific but fictional",
  "taste": ["what they love"],
  "intolerances": ["what makes them reject"],
  "expertise_scope": "what they can evaluate",
  "cannot_validate": "what still requires a human",
  "social_behavior": {
    "platform": "reddit|booktok|goodreads|agent-inbox|private-beta",
    "activity_level": 0.7,
    "influence_weight": 1.2,
    "conflict_style": "quiet|argumentative|evangelist|skeptical"
  }
}
```

## Scoring

Report both raw and calibrated scores.

Default calibration:

- subtract `0.8` from internal enthusiasm scores unless prior project calibration says otherwise
- cap simulated niche approval at `FLAG` unless human validation exists
- overall readiness cannot exceed weakest major gate by more than `0.4`

Required score lines:

```text
Raw swarm score:
Calibrated score:
Confidence:
Coverage:
Weakest cohort:
Best cohort:
Human validation still needed:
```

## Risk Heatmap

Use this severity scale:

- `PASS`: no meaningful issue found.
- `FLAG`: likely fix or consultant check.
- `BLOCK`: serious rejection, harm, factual, or market risk.

Heatmap columns:

```markdown
| Area | Chapter/Asset | Cohort | Severity | Evidence | Fix Type | Owner |
|---|---|---|---|---|---|---|
```

Fix types:

- `structural`
- `connective`
- `prose-texture`
- `factual`
- `package`
- `human-validate`

## Revision Tickets

Write tickets so `book-editor` can act without reinterpreting the whole report.

```markdown
## Ticket BS-001: Short title

Severity: BLOCK|FLAG
Mode: structural|connective|prose-texture|factual|package|human-validate
Files: path(s)
Evidence:
- ...

Problem:
...

Required Change:
...

Preserve:
- ...

Acceptance Test:
- ...
```

## Public Opinion Simulation

When simulating public opinion, produce scenario ranges, not certainty.

Required sections:

- best framing
- worst framing
- likely praise
- likely backlash
- likely misread
- viral quotes or concepts
- review headline samples
- 1-star review pattern
- 5-star review pattern
- mitigation edits
- package changes

Useful framing tests:

- What does the first sentence promise?
- What does the cover copy accidentally imply?
- Which community might feel used?
- Which reader becomes an advocate?
- Which reader posts a rejection thread?
- What gets screenshotted?

## Niche Risk Simulation

Rules:

- Label all niche agents as simulated proxies.
- Give each proxy narrow scope.
- Avoid claiming insider certainty.
- Prefer "this may read as..." over "this is wrong" unless the text has a clear factual contradiction.
- Every cultural/religious/professional issue gets `HUMAN-VALIDATE` if publication-facing.

For each niche cohort:

```markdown
Scope:
What this proxy can flag:
What this proxy cannot validate:
Top risks:
Line/scene evidence:
Recommended edits:
Human consultant needed:
```

## MiroFish Bridge

MiroFish integration is optional.

Use MiroFish only when the user asks to run actual MiroFish/social simulation or when a MiroFish project/server is already available. Do not copy AGPL MiroFish code into this skill.

Bridge pattern:

1. Export manuscript/package seed files.
2. Create MiroFish simulation requirement.
3. Run MiroFish externally.
4. Import persona files, action logs, interviews, and report.
5. Convert results into this skill's output files.

If MiroFish cannot run, use the clean-room simulation workflow above.

## Final Response

Keep final answer short:

- run folder
- calibrated score
- strongest signal
- worst blocker
- next action

Do not paste full reports into chat if files were written.
