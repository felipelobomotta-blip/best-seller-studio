# Reddit Launch Kit

Use this to relaunch Book Genesis without looking like a recycled spam post from the old account. The point is to lead with the lesson, then show the repo and the cover wall as proof.

## Positioning

Primary angle:

```text
I used AI agents to push 10 book projects in under 30 days. The surprising lesson: more agents made the books worse, so I open-sourced the smaller Codex pipeline.
```

Secondary angle:

```text
The code is not a prompt. It is a file-backed publishing pipeline: state, assumptions, phase prompts, adversarial audit, scoring, and editorial package.
```

## Suggested Reddit Title

```text
I used Claude/Codex to push 10 book projects in under 30 days. The best version had fewer agents, not more.
```

Alternative:

```text
I open-sourced the AI book pipeline behind 10 book projects. Biggest lesson: the 19-skill version overfit its own evaluator.
```

## Reddit Body

```text
I spent the last month building and stress-testing an AI-assisted book pipeline.

The first version got huge: 17 phases, 19 skills, continuity tracking, reader simulations, scoring loops, revision agents, packaging, etc.

It caught a lot of errors.

It also started making the books worse.

The writer learned it was being judged on too many dimensions at once, so it stopped writing like a writer and started writing like a compliance engine.

So I ported the system into a smaller Codex version:

- one active phase prompt at a time
- PROJECT_STATE.yaml and ASSUMPTIONS.md
- durable artifacts instead of chat-only output
- draft before judgment
- adversarial audit before final score
- 10-dimension Genesis Score Codex
- editorial package at the end

The repo now includes:

- the portable Book Genesis Codex skill
- the legacy V4/V5 Claude Code system
- a 10-book proof gallery with covers/cover concepts
- 6 case studies explaining what each project taught the system
- portability notes for Codex, Claude Code, and Antigravity-style agents

Repo:
https://github.com/felipelobomotta-blip/book-genesis-v4

The most interesting files:

- docs/book-gallery.md
- skills/book-genesis-codex/
- docs/book-genesis-codex.md
- SHOWCASE.md

I am curious if anyone else building long-form agent workflows has seen the same tradeoff: more orchestration improves consistency, but too many live constraints hurt voice.
```

## First Comment

```text
Small clarification because "10 books" can sound like a fake flex:

The repo does not publish the private manuscripts. It publishes the pipeline, cover wall, case studies, score artifacts, outlines/synopses where safe, and the Codex skill itself.

I am sharing the system and what broke, not dumping private books into GitHub.
```

## Short X/Twitter Thread

```text
I used AI agents to push 10 book projects in under 30 days.

The weird lesson:
the 17-phase / 19-skill version was not the best one.
```

```text
It caught more errors.

But it also made the writer optimize for the evaluator.

The output got cleaner, more consistent, and less alive.
```

```text
So I rebuilt it as a smaller Codex pipeline:

- one active phase at a time
- file-backed state
- explicit assumptions
- draft before scoring
- adversarial audit before final score
- editorial package at the end
```

```text
Repo:
https://github.com/felipelobomotta-blip/book-genesis-v4

The proof layer:
10 book projects, covers/cover concepts, case studies, scoring artifacts, and the portable skill.
```

## Hacker News Title

```text
Show HN: Book Genesis Codex - a file-backed AI book pipeline
```

HN body:

```text
I built this after using Claude/Codex-style agents across 10 book projects in under 30 days.

The surprising part was that the larger version of the system - 17 phases, 19 skills, mid-draft gates, revision loops - caught more errors but often hurt the writing. The writer started optimizing for the evaluator.

The Codex version is smaller: durable project files, one active phase prompt at a time, adversarial audit before scoring, and an editorial package after the manuscript survives critique.

Repo:
https://github.com/felipelobomotta-blip/book-genesis-v4

Useful files:
- docs/book-gallery.md
- skills/book-genesis-codex/
- docs/book-genesis-codex.md
- SHOWCASE.md

Interested in feedback from people building long-form agent workflows.
```
