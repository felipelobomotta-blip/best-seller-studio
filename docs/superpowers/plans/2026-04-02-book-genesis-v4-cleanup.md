# Book Genesis V4 — Pipeline Cleanup to 9.0+ Quality

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Fix all systemic inconsistencies identified by Opus + Codex dual audit, raising internal coherence from 7.5/10 to 9.0+. Kill dead skills, unify state schemas, fix orchestrator dispatch, reconcile thresholds, update installer/README.

**Architecture:** Three waves — Wave 1 kills dead code (reduces surface area), Wave 2 fixes wiring (makes surviving skills consistent), Wave 3 updates docs/installer (makes the public face accurate). Each wave produces a working, installable state.

**Tech Stack:** Markdown files (skills/agents), Bash/PowerShell (installers), Git

---

## File Map

**DELETE (3 files):**
- `skills/bestseller-orchestrator/SKILL.md` — V3 fossil, 13 broken skill refs
- `skills/kdp-publish/SKILL.md` — Portuguese, project-specific artifacts, not wired
- `skills/manuscript-manager/SKILL.md` — dead PROJECT_STATE.yaml schema

**MODIFY (8 files):**
- `agents/book-orchestrator.md` — fix dispatch names, state schema, floor threshold
- `skills/book-genesis/SKILL.md` — fix floor threshold ref
- `skills/chaos-engine/SKILL.md` — quota-based → quality-based disruption
- `skills/entity-tracker/SKILL.md` — fix Phase 2.7 STOP condition
- `skills/series-architect/SKILL.md` — fix broken skill refs
- `install.sh` — fix skill count
- `install.ps1` — fix skill count
- `README.md` — fix claims (skill count, floor, benchmark numbers)

---

## Wave 1: Kill Dead Code (reduce 22 → 19 skills)

### Task 1: Delete bestseller-orchestrator

**Files:**
- Delete: `skills/bestseller-orchestrator/SKILL.md`

- [ ] **Step 1: Verify no other file references it**

Run: `grep -r "bestseller-orchestrator\|bestseller.orchestrator" skills/ agents/ docs/ README.md --include="*.md" -l`
Expected: Only `skills/bestseller-orchestrator/SKILL.md` and possibly docs that list all skills

- [ ] **Step 2: Delete the skill directory**

```bash
rm -rf skills/bestseller-orchestrator
```

- [ ] **Step 3: Remove from docs/skills-reference.md if listed**

Search `docs/skills-reference.md` for "bestseller-orchestrator" and remove its entry.

- [ ] **Step 4: Commit**

```bash
git add -A skills/bestseller-orchestrator docs/skills-reference.md
git commit -m "chore: remove bestseller-orchestrator (V3 fossil with 13 broken skill refs)"
```

### Task 2: Delete kdp-publish

**Files:**
- Delete: `skills/kdp-publish/SKILL.md`

- [ ] **Step 1: Verify no other file references it**

Run: `grep -r "kdp-publish\|kdp.publish" skills/ agents/ docs/ README.md --include="*.md" -l`
Expected: Only its own file and possibly docs

- [ ] **Step 2: Delete the skill directory**

```bash
rm -rf skills/kdp-publish
```

- [ ] **Step 3: Remove from docs if listed**

Search `docs/skills-reference.md` and `docs/faq.md` for "kdp-publish" and remove entries.

- [ ] **Step 4: Commit**

```bash
git add -A skills/kdp-publish docs/
git commit -m "chore: remove kdp-publish (Portuguese-only, project-specific artifacts, not wired into pipeline)"
```

### Task 3: Delete manuscript-manager

**Files:**
- Delete: `skills/manuscript-manager/SKILL.md`

- [ ] **Step 1: Check references**

Run: `grep -r "manuscript-manager\|manuscript.manager" skills/ agents/ docs/ README.md --include="*.md" -l`
Note: `bestseller-orchestrator` referenced it but is already deleted. Other refs in docs need cleanup.

- [ ] **Step 2: Delete the skill directory**

```bash
rm -rf skills/manuscript-manager
```

- [ ] **Step 3: Remove from docs**

Remove entries from `docs/skills-reference.md`, `docs/faq.md`, and any other docs that reference it.

- [ ] **Step 4: Commit**

```bash
git add -A skills/manuscript-manager docs/
git commit -m "chore: remove manuscript-manager (dead PROJECT_STATE.yaml schema, incompatible with live orchestrators)"
```

---

## Wave 2: Fix Wiring (make surviving 19 skills + 1 agent consistent)

### Task 4: Fix orchestrator dispatch — replace phantom agent names with real skill names

**Files:**
- Modify: `agents/book-orchestrator.md`

- [ ] **Step 1: Replace all phantom agent dispatches with correct skill names**

Find and replace throughout `agents/book-orchestrator.md`:

| Old (phantom agent) | New (real skill) |
|---|---|
| `book-architect agent (persona building)` | `reader-persona skill` |
| `book-architect agent (characters, outline, theme)` | `narrative-foundation skill` |
| `book-architect agent (voice fingerprint)` | `voice-fingerprint skill` |
| `book-writer agent (one chapter at a time)` | `prose-craft skill` |
| `book-editor agent (cover-the-name, subtext)` | `dialogue-polish skill` |
| `book-editor agent (openings + endings)` | `hook-craft skill` |
| `book-disruptor agent (chaos injection)` | `chaos-engine skill` |
| `book-evaluator agent (Genesis Score, anti-AI, readers)` | `beta-reader skill` |
| `book-evaluator agent (outline audit)` | `continuity-guardian skill` |
| `book-evaluator agent (full manuscript audit)` | `continuity-guardian skill (full-manuscript mode)` |
| `book-packager agent (editorial + production)` | `editorial-package skill + production-prep skill` |
| `book-editor agent (targeted rewrites)` | `book-editor skill` |

Also update the pipeline diagram at the top:

```
PHASE 1:   RESEARCH            → /book-researcher
PHASE 1.5: READER PERSONAS     → /reader-persona
PHASE 2:   FOUNDATION          → /narrative-foundation
PHASE 2.5: VOICE DNA           → /voice-fingerprint
  >>> CHECKPOINT 1 <<<
PHASE 2.7: ENTITY TRACKING     → /entity-tracker (BUILD)
PHASE 2.8: CONTINUITY (outline) → /continuity-guardian
PHASE 3:   WRITING             → /prose-craft (one chapter at a time)
PHASE 3.1: DIALOGUE POLISH     → /dialogue-polish
PHASE 3.2: HOOK CRAFT          → /hook-craft
PHASE 3.5: DISRUPTION          → /chaos-engine
PHASE 3.7: ENTITY UPDATE       → /entity-tracker (UPDATE)
PHASE 3.8: MECH PREPROCESS     → /mechanical-preprocess
PHASE 4:   EVALUATION          → /beta-reader
PHASE 4.5: QUALITY GATE        → /quality-gate (auto-loop, max 3)
PHASE 5:   REVISION            → /book-editor
PHASE 5.5: ENTITY UPDATE       → /entity-tracker (UPDATE)
PHASE 5.6: CONTINUITY (ms)     → /continuity-guardian (full-manuscript)
  >>> CHECKPOINT 2 <<<
PHASE 6:   DELIVERY            → /editorial-package + /production-prep
  >>> CHECKPOINT 3 <<<
```

- [ ] **Step 2: Update dispatch prompts in Phase execution sections**

In every "Dispatch:" instruction, replace `book-architect agent` with the actual skill invocation. Example for PHASE 1.5:

Old: `Dispatch: book-architect agent`
New: `Invoke: /reader-persona`

Do this for ALL phase dispatch instructions throughout the file.

- [ ] **Step 3: Fix the quality gate floor — read from genre threshold instead of hardcoding**

Find line ~281: `Check if Genesis floor >= 7.5 AND Casual Reader verdict >= 7`
Replace with: `Read genre from STATE.yaml. Look up floor threshold from quality-gate genre table (literary: 7.5, commercial: 7.0, thriller: 7.0, memoir: 7.5, prescriptive NF: 7.0). Check if Genesis floor >= genre threshold AND Casual Reader verdict >= 7.`

- [ ] **Step 4: Commit**

```bash
git add agents/book-orchestrator.md
git commit -m "fix: orchestrator dispatches real skill names instead of phantom agents

Replaces 12 phantom agent references (book-architect, book-writer,
book-disruptor, book-evaluator, book-packager) with actual skill
invocations (/reader-persona, /narrative-foundation, /prose-craft, etc.).
Fixes quality gate to use genre-adjusted floor instead of hardcoded 7.5."
```

### Task 5: Fix chaos-engine — quality-based disruption instead of quota

**Files:**
- Modify: `skills/chaos-engine/SKILL.md`

- [ ] **Step 1: Find the quota rule**

Search for "Minimum 5 operations" or "at least 5" in the file.

- [ ] **Step 2: Replace with quality-based rule**

Old: `You MUST execute at least 5 of these 8 operations on every chapter.` (or similar)
New:
```
Execute operations BASED ON CHAPTER QUALITY — not by quota:
- Strong chapter (already has chaos, varied structure, good pacing): 2-4 operations
- Competent but predictable chapter (well-crafted but safe): 5-6 operations
- Weak chapter (flat, generic, pattern-heavy): 6-8 operations

Document which operations you applied, skipped, and WHY.
```

Also find rule 3 ("Minimum 5 operations per chapter") and update to:
```
Operations are quality-based, not quota-based. Strong chapters get fewer disruptions. Don't force noise into text that's already alive.
```

- [ ] **Step 3: Commit**

```bash
git add skills/chaos-engine/SKILL.md
git commit -m "fix: chaos-engine uses quality-based disruption instead of quota minimum"
```

### Task 6: Fix entity-tracker Phase 2.7 STOP condition

**Files:**
- Modify: `skills/entity-tracker/SKILL.md`

- [ ] **Step 1: Find the STOP condition**

Search for "If no chapters exist, STOP" or "at least one chapter has been written".

- [ ] **Step 2: Add SEED mode clarification**

After the existing STOP condition, add:
```
**Exception — Phase 2.7 (pre-writing SEED mode):**
When invoked at Phase 2.7 before any chapters exist, BUILD mode operates in SEED mode:
- Reads foundation.md and outline.md ONLY
- Seeds ENTITY_STATE.yaml with canonical character names, locations, and timeline from the outline
- Does NOT require chapters to exist
- The STOP condition ("no chapters exist") applies only when BUILD is invoked mid-pipeline as a recovery operation, not at Phase 2.7
```

- [ ] **Step 3: Commit**

```bash
git add skills/entity-tracker/SKILL.md
git commit -m "fix: entity-tracker supports pre-writing SEED mode at Phase 2.7"
```

### Task 7: Fix series-architect broken skill refs

**Files:**
- Modify: `skills/series-architect/SKILL.md`

- [ ] **Step 1: Find broken refs**

Search for `character-forge`, `emotion-engineer`, `hook-crafter` in the file.

- [ ] **Step 2: Replace with real skill names**

| Old | New |
|---|---|
| `character-forge` | `narrative-foundation` (character profiles with chaos) |
| `emotion-engineer` | `narrative-foundation` (Part 3 — Emotional Curve) |
| `hook-crafter` | `hook-craft` |

Update the integration section to reference real skills and add brief context for each.

- [ ] **Step 3: Commit**

```bash
git add skills/series-architect/SKILL.md
git commit -m "fix: series-architect references real skills (narrative-foundation, hook-craft)"
```

### Task 8: Fix book-genesis floor threshold

**Files:**
- Modify: `skills/book-genesis/SKILL.md`

- [ ] **Step 1: Search for hardcoded floor values**

Run: `grep -n "floor\|Floor\|8\.0\|7\.5" skills/book-genesis/SKILL.md`

- [ ] **Step 2: Update to genre-adjusted language**

Replace any hardcoded "floor >= 8.0" or "floor >= 7.5" with:
```
Floor >= genre threshold (see /quality-gate for genre-specific values: literary 7.5, commercial 7.0, thriller 7.0, memoir 7.5, prescriptive NF 7.0). Recommended >= 8.0 for editorial submission. >= 8.5 for best-seller/award level.
```

- [ ] **Step 3: Commit**

```bash
git add skills/book-genesis/SKILL.md
git commit -m "fix: book-genesis uses genre-adjusted floor from quality-gate"
```

---

## Wave 3: Update Public Face (installer, README, docs)

### Task 9: Update installers — correct skill count

**Files:**
- Modify: `install.sh`
- Modify: `install.ps1`

- [ ] **Step 1: Count actual skills after deletions**

Run: `ls -d skills/*/SKILL.md | wc -l`
Expected: 19 (was 22, deleted 3)

- [ ] **Step 2: Update install.sh**

Line 5: Change `# Installs 20 skills + 1 agent + knowledge base to ~/.claude/` to `# Installs 19 skills + 1 agent + knowledge base to ~/.claude/`
Line 29: Change `Installing 20 skills + 1 agent + knowledge base` to `Installing 19 skills + 1 agent + knowledge base`

- [ ] **Step 3: Update install.ps1**

Line 2: Change `# Installs 20 skills + 1 agent + knowledge base to ~/.claude/` to `# Installs 19 skills + 1 agent + knowledge base to ~/.claude/`
Line 23: Change `Installing 20 skills + 1 agent + knowledge base` to `Installing 19 skills + 1 agent + knowledge base`

- [ ] **Step 4: Commit**

```bash
git add install.sh install.ps1
git commit -m "chore: installer counts 19 skills (removed 3 dead skills)"
```

### Task 10: Update README — fix all inaccurate claims

**Files:**
- Modify: `README.md`

- [ ] **Step 1: Fix skill count**

Change `21 AI skills` → `19 AI skills` everywhere:
- Title line (h1)
- Badge: `skills-21-blue` → `skills-19-blue`
- Body text: "21 specialized AI skills" → "19 specialized AI skills"

- [ ] **Step 2: Fix floor claim**

Find: "hits 8.0+" or "scoring 8.0"
Replace with: "hits the genre-adjusted quality floor (7.0-7.5 depending on genre)"

- [ ] **Step 3: Fix benchmark claim if inaccurate**

If README says "15 bestsellers representing 350M+ copies" but the actual evaluator spec says "5 benchmarks / 338M+", update to match the evaluator's actual data.

- [ ] **Step 4: Remove references to deleted skills**

Search for `bestseller-orchestrator`, `kdp-publish`, `manuscript-manager` in the skills table and remove their entries.

- [ ] **Step 5: Commit**

```bash
git add README.md
git commit -m "docs: README reflects actual skill count (19), genre-adjusted floors, accurate benchmarks"
```

### Task 11: Update docs — architecture.md, skills-reference.md, faq.md

**Files:**
- Modify: `docs/architecture.md`
- Modify: `docs/skills-reference.md`
- Modify: `docs/faq.md`

- [ ] **Step 1: Remove deleted skills from all docs**

```bash
grep -rn "bestseller-orchestrator\|kdp-publish\|manuscript-manager\|PROJECT_STATE" docs/ --include="*.md"
```

Fix each occurrence — remove entries for deleted skills, replace PROJECT_STATE.yaml refs with STATE.yaml.

- [ ] **Step 2: Fix "4 readers" → "5 readers" in stale docs**

```bash
grep -rn "4-reader\|4 reader\|four reader" docs/ --include="*.md"
```

Update any stale "4-reader" references to "5-reader" to match the current beta-reader skill.

- [ ] **Step 3: Fix phantom agent names in architecture.md**

Replace any references to `book-architect`, `book-writer`, `book-disruptor`, `book-evaluator`, `book-packager` agents with the correct skill names.

- [ ] **Step 4: Commit**

```bash
git add docs/
git commit -m "docs: architecture/reference/faq reflect 19 skills, 5-reader simulation, real skill names"
```

---

## Wave 4: Sync Local Skills

### Task 12: Reinstall from updated repo to local Claude Code

**Files:**
- Run: `install.ps1` (Windows) or `install.sh`

- [ ] **Step 1: Run the installer from the updated repo**

```powershell
cd C:\Users\felip\Desktop\Programação\book-genesis-v4
.\install.ps1
```

Expected: 19 skills + 1 agent installed

- [ ] **Step 2: Verify local skills match repo**

```bash
diff <(ls ~/.claude/skills/ | sort) <(ls skills/ | sort)
```

Expected: identical (minus any non-book-genesis skills in local)

- [ ] **Step 3: Test by invoking /book-genesis**

Open Claude Code and type `/book-genesis` — verify it loads without errors.

- [ ] **Step 4: Commit (no code change — just verification)**

No commit needed. This is a verification step.

---

## Validation

After all tasks complete:

1. `grep -r "bestseller-orchestrator\|kdp-publish\|manuscript-manager" skills/ agents/ docs/ README.md` → 0 results
2. `grep -r "book-architect agent\|book-writer agent\|book-disruptor agent\|book-evaluator agent\|book-packager agent" agents/` → 0 results  
3. `grep -r "character-forge\|emotion-engineer\|hook-crafter" skills/` → 0 results
4. `grep -r "PROJECT_STATE" skills/ agents/` → 0 results
5. `ls -d skills/*/SKILL.md | wc -l` → 19
6. README badge says `skills-19`
7. Installer says "19 skills"
