# Genesis V5.0 — Craft Mode Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Fork Book Genesis into Craft Mode (5-7 skills, better books) + Production Mode (full pipeline), based on empirical data showing inverse correlation between skill count and prose quality.

**Architecture:** Craft Mode separates the writer from the judge. Writer writes with minimal constraints (foundation + voice reference + continuity doc). Judge evaluates post-draft. Editor fixes surgically. No real-time pattern enforcement, no chaos injection, no quality gates between chapters.

**Tech Stack:** Markdown skills, Claude Code agents, bash installers

---

## Evidence Base

| Book | Pipeline | Skills | External Score |
|------|----------|--------|---------------|
| Protocolo Não Encontrado | V2 simple | ~6 | **8.2** |
| The Source Code | V4 full | 19 | **7.4** |
| Era de Aquário | Intermediate | ~12 | **6.2** |

Inverse correlation confirmed. Internal evaluator inflation: consistent -0.8.

---

## File Map

**CREATE (3 new files):**
- `skills/book-genesis/SKILL.md` — REWRITE as Craft Mode orchestrator (replaces current 999-line version)
- `skills/book-genesis-full/SKILL.md` — Move current V4 orchestrator here as "Production Mode"
- `docs/v5-philosophy.md` — Document the why

**MODIFY (4 files):**
- `skills/beta-reader/SKILL.md` — Add -0.8 calibration offset to all scores
- `skills/prose-craft/SKILL.md` — Remove real-time anti-AI enforcement, make it post-hoc diagnostic
- `agents/book-orchestrator.md` — Update to dispatch Craft Mode skills by default
- `README.md` — Update for V5 dual-track, new philosophy

**DEPRECATE (move to skills/deprecated/, not delete):**
- `skills/chaos-engine/SKILL.md` — Artificial noise kills authenticity
- `skills/quality-gate/SKILL.md` — Inter-chapter gates polish life out of text
- `skills/mechanical-preprocess/SKILL.md` — Move to post-hoc only
- `skills/dialogue-polish/SKILL.md` — Merge into book-editor
- `skills/hook-craft/SKILL.md` — Merge into book-editor

**KEEP UNCHANGED (core value):**
- `skills/narrative-foundation/SKILL.md`
- `skills/book-editor/SKILL.md`
- `skills/book-researcher/SKILL.md`
- `skills/editorial-package/SKILL.md`
- `skills/production-prep/SKILL.md`
- `skills/entity-tracker/SKILL.md`
- `skills/reader-persona/SKILL.md`
- `skills/voice-fingerprint/SKILL.md`
- `skills/continuity-guardian/SKILL.md`
- `skills/series-architect/SKILL.md`

---

## Task 1: Create deprecated/ directory and move 5 skills

**Files:**
- Move: `skills/chaos-engine/` → `skills/deprecated/chaos-engine/`
- Move: `skills/quality-gate/` → `skills/deprecated/quality-gate/`
- Move: `skills/mechanical-preprocess/` → `skills/deprecated/mechanical-preprocess/`
- Move: `skills/dialogue-polish/` → `skills/deprecated/dialogue-polish/`
- Move: `skills/hook-craft/` → `skills/deprecated/hook-craft/`

- [ ] **Step 1: Create deprecated directory and move skills**

```bash
mkdir -p skills/deprecated
mv skills/chaos-engine skills/deprecated/
mv skills/quality-gate skills/deprecated/
mv skills/mechanical-preprocess skills/deprecated/
mv skills/dialogue-polish skills/deprecated/
mv skills/hook-craft skills/deprecated/
```

- [ ] **Step 2: Verify moves**

```bash
ls skills/deprecated/
ls skills/ | wc -l  # should be 14 (was 19, moved 5)
```

- [ ] **Step 3: Commit**

```bash
git add -A
git commit -m "refactor: move 5 over-engineering skills to deprecated/

Empirical data: inverse correlation between skill count and prose quality.
chaos-engine (artificial noise), quality-gate (inter-chapter polish),
mechanical-preprocess, dialogue-polish, hook-craft moved to deprecated/.
Available for Production Mode users, removed from Craft Mode."
```

---

## Task 2: Rename current book-genesis to book-genesis-full (Production Mode)

**Files:**
- Move: `skills/book-genesis/` → `skills/book-genesis-full/`

- [ ] **Step 1: Copy current orchestrator to production mode**

```bash
cp -r skills/book-genesis skills/book-genesis-full
```

- [ ] **Step 2: Update the description frontmatter in book-genesis-full/SKILL.md**

Change the `name:` to `book-genesis-full` and `description:` to mention "Production Mode — full 17-phase pipeline with all skills including deprecated ones."

- [ ] **Step 3: Commit**

```bash
git add skills/book-genesis-full/
git commit -m "feat: preserve V4 full pipeline as book-genesis-full (Production Mode)"
```

---

## Task 3: Write new book-genesis Craft Mode orchestrator

**Files:**
- Rewrite: `skills/book-genesis/SKILL.md`

- [ ] **Step 1: Write the Craft Mode orchestrator**

The new book-genesis should be ~200-300 lines (not 999). Philosophy:

```
CRAFT MODE — Write freely, evaluate after, fix surgically.

PHASE 1: RESEARCH → /book-researcher
PHASE 2: FOUNDATION → /narrative-foundation + /voice-fingerprint (reference only, not prescriptive)
PHASE 3: WRITE → /prose-craft (one chapter at a time, NO simultaneous constraints)
   - Writer reads foundation + voice reference + previous chapter
   - Writer writes ONE CHAPTER with ONE instruction: "Write this chapter. Follow the outline. Trust your voice."
   - NO anti-AI scanning during writing
   - NO chaos injection
   - NO quality gates between chapters
   - Just write the whole damn book
PHASE 4: EVALUATE → /beta-reader (full manuscript, post-draft)
   - Run AFTER all chapters are written
   - Apply -0.8 calibration offset to all scores
   - Identify top 5 problems ranked by impact
PHASE 5: REVISE → /book-editor (surgical fixes on top 5 problems only)
PHASE 6: DELIVER → /editorial-package + /production-prep

6 phases. 8 skills. The writer breathes.
```

Key rules for the new orchestrator:
- "The writer is not a compliance engine. The writer writes."
- "Evaluation happens AFTER the draft exists, not during."
- "The -0.8 offset is not optional. Internal scores above 8.0 require external validation."
- "Show, don't checklist."
- Entity-tracker runs as passive reference (continuity-guardian checks post-draft)
- Voice-fingerprint creates a reference doc the writer reads ONCE, then writes freely

- [ ] **Step 2: Commit**

```bash
git add skills/book-genesis/SKILL.md
git commit -m "feat: Genesis V5 Craft Mode — 6 phases, 8 skills, writer breathes

Empirical finding: 19-skill pipeline scored 7.4 externally.
6-skill pipeline scored 8.2. Fewer constraints = better prose.

Craft Mode: research → foundation → write freely → evaluate post-draft → fix surgically → deliver.
No real-time anti-AI scanning. No chaos injection. No inter-chapter gates.
The writer writes. The judge judges after."
```

---

## Task 4: Add -0.8 calibration offset to beta-reader

**Files:**
- Modify: `skills/beta-reader/SKILL.md`

- [ ] **Step 1: Find the scoring output section**

Search for where scores are reported (Genesis Score table, CVI output).

- [ ] **Step 2: Add calibration offset**

After the scoring section, add:

```
## CALIBRATION OFFSET (V5 — empirically validated)

All scores produced by this evaluator carry a measured +0.8 inflation bias.
This was validated across 3 manuscripts against external literary critics:
- Internal 9.0 → External 8.2
- Internal 8.25 → External 7.4
- Internal 7.0 → External 6.2

AFTER computing all scores, apply:
- **Calibrated Score = Raw Score - 0.8**
- Report BOTH: "Raw: X.X | Calibrated: X.X"
- The CALIBRATED score is the one that predicts external reception
- Scores above 8.0 calibrated require external validation (beta readers, editors)
```

- [ ] **Step 3: Commit**

```bash
git add skills/beta-reader/SKILL.md
git commit -m "feat: add -0.8 calibration offset to evaluator (empirically validated)"
```

---

## Task 5: Make prose-craft post-hoc only for anti-AI

**Files:**
- Modify: `skills/prose-craft/SKILL.md`

- [ ] **Step 1: Find the anti-AI section**

Search for "anti-IA" or "anti-AI" or "20 patterns".

- [ ] **Step 2: Change from real-time enforcement to post-hoc diagnostic**

Add at the top of the anti-AI section:

```
## IMPORTANT: POST-HOC DIAGNOSTIC ONLY (V5)

The 20-pattern anti-AI scan runs AFTER the chapter is written, as a DIAGNOSTIC REPORT.
It does NOT constrain the writer during generation.

Why: Empirical data showed that real-time anti-AI enforcement makes prose self-conscious.
The writer who is checking 20 patterns while writing produces prose that "thinks better than it feels."
Write freely first. Scan after. Fix surgically.

When invoked DURING writing (Craft Mode): Skip the anti-AI scan. Just write.
When invoked AFTER writing (evaluation pass): Run the full 20-pattern scan as diagnostic.
```

- [ ] **Step 3: Commit**

```bash
git add skills/prose-craft/SKILL.md
git commit -m "feat: anti-AI scan becomes post-hoc diagnostic, not real-time constraint"
```

---

## Task 6: Update orchestrator agent for Craft Mode

**Files:**
- Modify: `agents/book-orchestrator.md`

- [ ] **Step 1: Add Craft Mode as default**

At the top of the file, after the description, add a mode selector:

```
## EXECUTION MODES

### CRAFT MODE (default — recommended)
6 phases. 8 skills. The writer breathes.
Use when: writing any book where voice and authenticity matter.

Phases: RESEARCH → FOUNDATION → WRITE (all chapters) → EVALUATE (post-draft) → REVISE → DELIVER

### PRODUCTION MODE (advanced)
17 phases. 19 skills. Full industrial pipeline.
Use when: user explicitly requests /book-genesis-full or needs the complete pipeline.
Invoke: /book-genesis-full
```

- [ ] **Step 2: Update the chapter loop for Craft Mode**

In Craft Mode, the chapter loop is SIMPLE:
- Write chapter
- Move to next chapter
- NO dialogue-polish, NO hook-craft, NO chaos-engine, NO mechanical-preprocess, NO quality gate between chapters
- After ALL chapters are written: run beta-reader on full manuscript

- [ ] **Step 3: Commit**

```bash
git add agents/book-orchestrator.md
git commit -m "feat: orchestrator defaults to Craft Mode, Production Mode via /book-genesis-full"
```

---

## Task 7: Update README + installers

**Files:**
- Modify: `README.md`
- Modify: `install.sh`
- Modify: `install.ps1`

- [ ] **Step 1: Update README**

Key changes:
- "19 AI skills" → "14 active skills + 5 deprecated (available in Production Mode)"
- Add "V5 Philosophy" section explaining the data-driven simplification
- Update the pipeline diagram to show Craft Mode (6 phases) as primary
- Add the empirical data table (3 books, external scores, inverse correlation)
- Badge: `skills-14-blue`

- [ ] **Step 2: Update installers**

The installer should still copy ALL skills (including deprecated/) so Production Mode works.
But update the count message: "Installing 14 active skills + 5 deprecated + 1 agent"

- [ ] **Step 3: Write docs/v5-philosophy.md**

Document:
- The empirical finding
- Why fewer skills = better books
- Craft Mode vs Production Mode
- The -0.8 calibration offset
- What was deprecated and why

- [ ] **Step 4: Commit**

```bash
git add README.md install.sh install.ps1 docs/v5-philosophy.md
git commit -m "docs: V5 launch — data-driven simplification, Craft Mode philosophy"
```

---

## Task 8: Update local installation

- [ ] **Step 1: Run installer**

```powershell
.\install.ps1
```

- [ ] **Step 2: Verify /book-genesis loads Craft Mode**

Open Claude Code, type `/book-genesis` — should show the 6-phase Craft Mode.

- [ ] **Step 3: Verify /book-genesis-full loads Production Mode**

Type `/book-genesis-full` — should show the 17-phase full pipeline.
