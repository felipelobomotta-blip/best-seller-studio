# The Source Code — Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Generate a publish-ready ~88K word sci-fi novel ("The Source Code") using the Book Genesis V4.1 pipeline.

**Architecture:** 14-phase pipeline executed via Book Genesis V4.1 skills. Each phase produces artifacts in the project directory. Quality gates between phases enforce Genesis Score floor 8.5+ and CVI-Launch 8.0+. Three human checkpoints (foundation, manuscript, delivery).

**Tech Stack:** Book Genesis V4.1 pipeline, 20 specialized skills, PROJECT_STATE.yaml for state management.

**Spec:** `docs/superpowers/specs/2026-03-17-the-source-code-design.md`

**Pipeline notes:**
- `manuscript-manager /check-in` at start of every session, `/check-out` at end
- `series-architect`: SKIP — standalone novel
- Acrostic: **"WE ARE THE LOOP IN SOURCE CODES"** (25 letters, confirmed)
- Eli's player_id number: **1137** (1+1+3+7=12=1+2=3, the Trinity; 11:37 appears on clocks, receipts, floors, addresses throughout)
- Entity hidden message: **"WHAT YOU SEEK IS SEEKING YOU"** = 7 words across Ch 10-21 Entity appearances
- Devoted Reader: ACTIVATE (SFF qualifies) — feeds CVI-Legacy and re-read architecture verification
- Quality gate config: genre=thriller, genesis_floor_override=8.0, anti_ai_max=8, pattern_11_max=6, em_dash_max=8_per_page, casual_reader_min=6
- Ch 22 is EXEMPT from ugly sentence requirement — the entire chapter IS the disruption
- Fibonacci name count: if target conflicts with natural prose, prioritize prose quality over exact count. Close approximation acceptable.
- Info-heavy chapters (Ch 9, 11, 13): ALL must be scene-driven. NO lectures. Flag for Casual Reader gate attention.

---

## Pre-Pipeline: Project Setup

### Task 0: Initialize Project Directory

**Files:**
- Create: `~/Desktop/the-source-code/STATE.yaml`
- Create: `~/Desktop/the-source-code/` (full directory structure)
- Reference: `docs/superpowers/specs/2026-03-17-the-source-code-design.md`

- [ ] **Step 1: Create project directory structure**

```bash
mkdir -p ~/Desktop/the-source-code/{manuscript/chapters,evaluations,continuity,feedback/beta-readers,research,delivery/{editorial,formatted},voice-bank/samples}
```

- [ ] **Step 2: Initialize STATE.yaml with project metadata**

Create `~/Desktop/the-source-code/STATE.yaml` with:

```yaml
project:
  title: "The Source Code"
  genre: "Sci-Fi"
  subgenre: "Speculative / Crossover (thriller + philosophical + esoteric)"
  target_audience: "Crossover — sci-fi mainstream, spiritual seekers, tech/AI crowd"
  word_count_target: 88000
  language: "en"
  device: "custom"  # Narrative glitches as format-as-content
  comp_titles:
    - "The Da Vinci Code (Dan Brown)"
    - "Dark Matter (Blake Crouch)"
    - "The Matrix (film)"
    - "The Alchemist (Paulo Coelho)"
    - "Illuminae (Kaufman & Kristoff)"
    - "The Power of Now (Eckhart Tolle)"
  created: "2026-03-17"
  updated: "2026-03-17"

phase:
  current: 1
  status: "in_progress"
  history: []

chapters:
  total_planned: 25
  completed: []

genesis_score:
  current_floor: 0.0
  dimensions:
    originality: {score: 0.0, evidence: "", last_updated: ""}
    theme: {score: 0.0, evidence: "", last_updated: ""}
    characters: {score: 0.0, evidence: "", last_updated: ""}
    prose_voice: {score: 0.0, evidence: "", last_updated: ""}
    pacing_coherence: {score: 0.0, evidence: "", last_updated: ""}
    emotion: {score: 0.0, evidence: "", last_updated: ""}
    dimension_7: {name: "Worldbuilding (Simulation Framework)", score: 0.0, evidence: "", last_updated: ""}

commercial_viability:
  cvi_launch: 0.0
  cvi_legacy: 0.0
  engagement_type:
    primary: "intellectual"
    secondary: "fascination"
    tertiary: "aspiration"
  commercial_pacing: 0.0
  tomorrow_test_anchors: 0
  casual_reader_verdict: 0
  shareability: {quote: 0, plot: 0, emotional: 0}
  concept_pitch: ""
  human_closeness: ""
  last_updated: ""

voice_bank:
  initialized: false
  sample_count: 0
  voice_description: ""
  voice_under_pressure: ""

voice_dna:
  created: false
  character_cards: 0
  differentiation_matrix: false
  cover_the_name_pass: false

reader_personas:
  created: false
  count: 0
  primary: ""
  hostile: ""

continuity:
  outline_check: false
  manuscript_check: false
  critical_findings: 0
  warning_findings: 0

quality_gate:
  chapters_passed: []
  chapters_escalated: []

mechanical_preprocess:
  em_dash_count: 0
  pattern_11_count: 0
  adverb_density: 0.0

evaluation_tracking:
  anti_ai_worst_3: []
  reader_verdicts:
    devourer: ""
    critic: ""
    hostile: ""
    casual: ""
    devoted: ""
  character_chaos:
    primary: 0
    secondary: 0
  discovery_test: ""
  residue_test: ""
  oscillation_count: 0
  pattern_11_count: 0

quality_gate_config:
  genre: "thriller"
  genesis_floor_override: 8.0
  anti_ai_max: 8
  pattern_11_max: 6
  em_dash_max_per_page: 8
  casual_reader_min: 6
  max_iterations: 3

player_id: 1137  # Appears as prices, times, floors, house numbers throughout

systemic_patterns: []
decisions: []
human_feedback: []
revision_cycles: 0
```

- [ ] **Step 3: Copy design spec into project research folder**

```bash
cp ~/Desktop/book-genesis-v4/docs/superpowers/specs/2026-03-17-the-source-code-design.md ~/Desktop/the-source-code/research/design-spec.md
```

- [ ] **Step 4: Copy bestseller-dna.md into project research folder**

```bash
cp ~/Desktop/book-genesis-v4/knowledge/bestseller-dna.md ~/Desktop/the-source-code/research/bestseller-dna.md
```

- [ ] **Step 5: Verify directory structure**

```bash
find ~/Desktop/the-source-code -type f | sort
```

Expected: STATE.yaml + research/design-spec.md + research/bestseller-dna.md

---

## Chunk 1: Pre-Production Phases (1 → 2.7)

These phases build the foundation BEFORE any prose is written. Human checkpoint at end of Chunk 1.

### Task 1: Phase 1 — Research (`/book-researcher`)

**Context to pass the skill:**
- Project dir: `~/Desktop/the-source-code/`
- Genre: Sci-Fi Speculative Crossover
- Concept: Simulation theory unifying AI, Kabbalah, numerology, all religions, pantheon mapping
- Language: English, US/Global market
- The design spec is at `research/design-spec.md` — the researcher should validate real-world references

**Files:**
- Create: `~/Desktop/the-source-code/research/market-research.md`
- Update: `~/Desktop/the-source-code/STATE.yaml` (phase → 1, then gate check)

- [ ] **Step 1: Invoke `/book-researcher`**

Pass: project dir, concept summary, genre, language, comp titles from spec.

The researcher must:
- Validate comp titles and find additional relevant comps
- Research the simulation theory book market (The Simulation Hypothesis by Rizwan Virk, etc.)
- Validate real-world references: Minecraft AI experiments (specify which one), Ian Stevenson's past-life research, double-slit experiment specifics, I Ching binary math, Ifa/Odu system
- Identify genre conventions for sci-fi crossover thrillers
- Confirm word count target (85-95K) is appropriate for market
- Document engagement type evidence

- [ ] **Step 2: Review research output**

Verify: market-research.md exists, comp titles validated, real-world refs confirmed, engagement type justified.

- [ ] **Step 3: Gate check — Phase 1 → 1.5**

Checklist:
- [ ] Market research report exists with comp titles
- [ ] Genre conventions documented
- [ ] Word count target confirmed
- [ ] Engagement type identified (primary: intellectual, secondary: fascination)
- [ ] User approves direction

Update STATE.yaml: `phase.current: 1.5`

---

### Task 2: Phase 1.5 — Reader Personas (`/reader-persona`)

**Context to pass:**
- Project dir, research/market-research.md, research/design-spec.md
- 3 target audiences: sci-fi mainstream, spiritual seekers, tech/AI crowd

**Files:**
- Create: `~/Desktop/the-source-code/reader-personas.md`
- Update: `~/Desktop/the-source-code/STATE.yaml`

- [ ] **Step 1: Invoke `/reader-persona`**

Must create 3-5 personas including:
- **PRIMARY:** The sci-fi thriller reader (drives pacing/tension decisions)
- **HOSTILE:** The "this is pseudoscience bullshit" skeptic (drives rigor)
- Plus: spiritual seeker, tech/AI programmer, casual airport reader

Each persona needs: deal-breakers, emotional triggers, what makes them share, what makes them quit.

- [ ] **Step 2: Gate check — Phase 1.5 → 2**

Checklist:
- [ ] 3-5 personas created in reader-personas.md
- [ ] PRIMARY persona identified
- [ ] HOSTILE persona identified
- [ ] Each has deal-breakers and emotional triggers

Update STATE.yaml: `phase.current: 2`

---

### Task 3: Phase 2 — Foundation (`/narrative-foundation`)

**Context to pass:**
- Project dir, design spec (THE critical input — contains all worldbuilding, characters, chapter structure, 7 Laws, pantheon, glitch mechanics, easter eggs)
- reader-personas.md, market-research.md

**Files:**
- Create: `~/Desktop/the-source-code/foundation.md`
- Create: `~/Desktop/the-source-code/outline.md`
- Update: `~/Desktop/the-source-code/STATE.yaml`

- [ ] **Step 1: Invoke `/narrative-foundation`**

The architect must use the design spec as primary source and produce:

**foundation.md:**
- Character profiles with CHAOS for all 6 characters (Eli Serra, Noor, Rabbi Saul, Marcus, The Entity, Agent Reyes)
  - Each needs: wound, lie, arc, irrelevant obsession, cognitive distortion, unprompted memory, failed emotional management
  - The Entity: special handling — non-human, Beta-class subroutine. Chaos = system behavior anomalies
- Theme as QUESTION: "If everything is code, does anything matter?"
- Engagement type: Primary intellectual, Secondary fascination, Tertiary aspiration
- Re-read architecture: which chapters contain re-read rewards (Fibonacci, acrostic, Entity message, binary)
- Cultural vocabulary: "the source code", "API call", "player_id", "respawn", "debug mode"

**outline.md:**
- 25 chapters mapped from design spec Section 6
- Each chapter must have:
  - Structural approach (one of 8 types, no consecutive repeats)
  - Emotional anchor (concrete image/moment, NOT "intensity: 8")
  - Emotional surprise (where expected emotion is wrong)
  - Word count target (from design spec Section 10 allocation table)
  - Which Law is dramatized (from design spec Section 14)
  - Which glitch occurs (from design spec Section 13 Master Glitch Schedule)
- Opening strategy for Ch 1: NOT competence cascade. Start in boredom/emptiness.
- Acrostic constraint: chapter titles must start with letters spelling "WE ARE THE LOOP IN SOURCE CODES" (25 letters)

**CRITICAL:** The outline must enforce the acrostic. Chapter titles are constrained by first letters: W-E-A-R-E-T-H-E-L-O-O-P-I-N-S-O-U-R-C-E-C-O-D-E-S.

- [ ] **Step 2: Review foundation and outline**

Verify:
- All 6 characters have full chaos profiles
- All 25 chapters have structural approach, anchor, surprise
- Acrostic spells correctly
- No two consecutive chapters use same structural approach
- Easter egg architecture is planted

- [ ] **Step 3: Gate check — Phase 2 → 2.5**

Checklist:
- [ ] Character profiles complete with CHAOS
- [ ] Chapter outline with emotional anchors and surprises
- [ ] Opening strategy defined (not competence cascade)
- [ ] Structural approach per chapter (8 types, no consecutive repeats)
- [ ] Theme as question
- [ ] Engagement type ranked
- [ ] Re-read architecture planned
- [ ] Cultural vocabulary identified
- [ ] Writer warnings flagged
- [ ] Stylistic device: "custom — narrative glitches"
- [ ] User approves foundation + outline

Update STATE.yaml: `phase.current: 2.5`

---

### Task 4: Phase 2.5 — Voice DNA (`/voice-fingerprint`)

**Context to pass:**
- Project dir, foundation.md, design spec (character descriptions)
- Special: The Entity communicates in patterns, not words. Its "voice" is mathematical/structural.

**Files:**
- Create: `~/Desktop/the-source-code/voice-dna.md`
- Create: `~/Desktop/the-source-code/voice-bank/` samples
- Update: `~/Desktop/the-source-code/STATE.yaml`

- [ ] **Step 1: Invoke `/voice-fingerprint`**

Must create:
- Global narrative voice profile (3rd person close, present-tense grounded shifting to unstable)
- Voice cards for: Eli (seeker, informal, pattern-noticing inner voice), Noor (precise, scientific but poetic when guard is down), Rabbi Saul (old-world, cryptic, Yiddish cadences), Marcus (blunt, techbro, dismissive-then-shaken), Reyes (controlled, bureaucratic, with cracks), The Entity (non-verbal — patterns, numbers, structural resonance)
- Voice differentiation matrix (min 3 markers per character pair)
- Voice-under-pressure for each character
- Anti-pattern checklist

- [ ] **Step 2: Initialize voice bank with 10+ samples**

Include >=3 voice-breaking samples and >=2 irrelevant-thought samples from published novels matching the tone (Dark Matter, The Da Vinci Code, etc.)

- [ ] **Step 3: Gate check — Phase 2.5 → 2.7**

Checklist:
- [ ] voice-dna.md created with all character cards
- [ ] Voice differentiation matrix complete
- [ ] Voice bank initialized (>=10 samples, >=3 breaking, >=2 irrelevant)

Update STATE.yaml: `phase.current: 2.7`

---

### Task 5: Phase 2.7 — Continuity Check (`/continuity-guardian`)

**Context to pass:**
- Project dir, outline.md, foundation.md, voice-dna.md, design spec

**Files:**
- Create: `~/Desktop/the-source-code/continuity/outline-audit.md`
- Update: `~/Desktop/the-source-code/STATE.yaml`

- [ ] **Step 1: Invoke `/continuity-guardian` in outline mode**

Must check:
- Timeline consistency across 25 chapters
- Information flow (character can't know X before it's revealed)
- Acrostic constraint integrity
- Glitch schedule consistency (Master Schedule from spec vs outline)
- Entity message easter egg: first words of Entity appearances Ch 10-21 spell "WHAT YOU SEEK IS SEEKING YOU" — 7 words across ~12 Entity appearances, verify mapping (some appearances may share a word or skip)
- Fibonacci name count feasibility
- Beta concept seed in Ch 7 connects to Ch 23 resolution
- Reyes arc: threat (Ch 8, 16) → ambiguity (Ch 19) → guardian (Ch 24)
- Noor arc: science (Ch 5) → disappears (Ch 20) → returns with proof (Ch 24)
- Marcus arc: skeptic (Ch 3) → freaks (Ch 16) → notebook (Ch 24)

- [ ] **Step 2: Review audit results**

If CRITICAL findings → fix in outline/foundation → re-run continuity check
If WARNING findings → log and decide: fix or defer with rationale

- [ ] **Step 3: Gate check — Phase 2.7 → 3**

Checklist:
- [ ] Continuity guardian ran on outline + foundation + voice-dna
- [ ] No CRITICAL findings
- [ ] All WARNINGs addressed or deferred with rationale

Update STATE.yaml: `phase.current: 3`

---

### **>>> HUMAN CHECKPOINT 1: Foundation Approval <<<**

Present to Felipe:
1. foundation.md — characters, theme, engagement type
2. outline.md — 25 chapters with acrostic, anchors, surprises, structural approaches
3. voice-dna.md — how each character sounds
4. continuity/outline-audit.md — any issues found

**Gate:** Felipe explicitly approves before any prose is written.

---

## Chunk 2: Writing Phases (3 → 3.8) — Per Chapter Loop

This is the production core. Each chapter goes through 5 sub-phases before evaluation. Repeat 25 times.

### Task 6: Per-Chapter Writing Loop (Repeat for Ch 1-25)

For EACH chapter (1 through 25), execute these steps in order:

#### Phase 3: Writing (`/prose-craft`)

**Context to pass per chapter:**
- Project dir, outline.md (this chapter's entry), foundation.md, voice-dna.md, reader-personas.md
- Previous chapter(s) for continuity
- Design spec Section 13 (Master Glitch Schedule) for this chapter's glitch
- Design spec Section 14 (Law dramatization) if this chapter has a Law
- **Ch 22 ONLY:** Design spec Section 12 (Ch 22 Content Brief) — this is the experimental chapter
- **Ch 1 ONLY:** No previous chapter exists. Pass outline.md entry for Ch 25 (the mirror chapter) as forward context — the writer needs to know what the last sentence will be since Ch 1's first sentence = Ch 25's last sentence.

**Files per chapter:**
- Create: `~/Desktop/the-source-code/manuscript/chapters/chapter-{NN}.md`
- Create: `~/Desktop/the-source-code/manuscript/chapters/chapter-{NN}-report.md` (writer self-report)

- [ ] **Step 6.1: Invoke `/prose-craft` for chapter N**

The writer must:
- Follow the outline entry for this chapter
- Use the structural approach assigned (no consecutive repeats)
- Hit the word count target from the allocation table
- Include the emotional anchor and emotional surprise
- Implement the assigned glitch (if any, per Master Glitch Schedule)
- Dramatize the assigned Law (if any, per Section 14)
- Include one ugly sentence
- Track Eli's name count for Fibonacci easter egg
- For Entity appearances: ensure first word matches the hidden message sequence
- Run 20-pattern anti-AI self-scan before submitting
- Produce self-report with: chaos moments, ugly sentence location, impulse deviations, anti-AI results, structural approach used

**Special chapters with extra requirements:**
- **Ch 1 (The Loop):** First sentence must contain hidden numeric pattern. Opening must NOT be competence cascade. Last sentence = will be echoed as last sentence of Ch 25.
- **Ch 7 (The Door):** Must plant Beta concept seed ("Balance. The runtime.")
- **Ch 11 (Same Function):** Scene-driven — Eli physically building the board. War/Ocean/Death modules only. NO info-dump.
- **Ch 13 (Other Servers):** Carries pantheon Part 2 + I Ching/Ifa binary beat as Noor's discovery scene.
- **Ch 18 (The Recursion):** Central chapter. Eli's AI asks his questions. Must land as the biggest revelation.
- **Ch 19 (Alpha):** Reyes ambiguity beat — leaves file with missing frequencies.
- **Ch 22 (Source):** Follow Content Brief exactly (Section 12). Multi-modal. 1,500-2,000 words. Binary decodes to "YOU WERE ALWAYS INSIDE."
- **Ch 24 (Reboot):** All character arcs close. Marcus with notebook. Noor with quantum data. Reyes as guardian. Saul smiles.
- **Ch 25 (The Loop):** Mirror Ch 1 structure. Last sentence = first sentence of Ch 1.

#### Phase 3.1: Dialogue Polish (`/dialogue-polish`)

- [ ] **Step 6.2: Invoke `/dialogue-polish` on chapter N**

Using voice-dna.md. Must pass cover-the-name test for all speaking characters.

#### Phase 3.2: Hook Craft (`/hook-craft`)

- [ ] **Step 6.3: Invoke `/hook-craft` on chapter N**

Opening hook + ending pull for each chapter. Ensure each chapter ending compels turning the page.

#### Phase 3.5: Disruption (`/chaos-engine`)

- [ ] **Step 6.4: Invoke `/chaos-engine` on chapter N**

Minimum 5 of 8 disruption operations:
1. Simile Surgery (Pattern #11 hard check)
2. Irrelevant Thought Injection
3. Emotional Control Break
4. Precision Deflation
5. Ugly Sentence (verify or add)
6. Negation Pattern Break
7. Missing Paragraph Deletion
8. Dialogue Mess

Writer reviews disruption and accepts/rejects each change.

#### Phase 3.8: Mechanical Preprocess (`/mechanical-preprocess`)

- [ ] **Step 6.5: Invoke `/mechanical-preprocess` on chapter N**

Bash-first cleanup (80% bash, 20% AI):
- Em-dash count within target
- Pattern #11 count
- Adverb density
- Other mechanical patterns

- [ ] **Step 6.6: Verify chapter file exists and report is complete**

```bash
ls ~/Desktop/the-source-code/manuscript/chapters/chapter-{NN}.md
ls ~/Desktop/the-source-code/manuscript/chapters/chapter-{NN}-report.md
```

---

## Chunk 3: Evaluation & Revision Phases (4 → 5.5)

After ALL chapters complete the writing loop, enter evaluation.

### Task 7: Phase 4 — Evaluation (`/beta-reader`)

**Context to pass:**
- Project dir, all chapter files, foundation.md, outline.md, reader-personas.md, design spec

**Files:**
- Create: `~/Desktop/the-source-code/evaluations/evaluation-round-1.md`
- Update: `~/Desktop/the-source-code/STATE.yaml`

- [ ] **Step 1: Invoke `/beta-reader` per chapter (all 25)**

Each chapter evaluated by 4 readers:
- Devourer (pacing — would they keep reading?)
- Critic (depth — does it hold up to scrutiny?)
- Hostile (the skeptic persona — "pseudoscience bullshit" test)
- Casual Reader (airport test — would they give 10 pages?)

Plus Devoted Reader (SFF activated — feeds CVI-Legacy and re-read architecture/easter egg verification).

Plus special tests:
- **Ch 1 only:** Discovery Test (BUY / MAYBE / PUT BACK)
- **Ch 25 only:** Residue Test (emotion vs. evaluation — what lingers?)
- **All chapters:** Tomorrow Test (what would reader remember tomorrow?)

- [ ] **Step 2: Full-manuscript macro evaluation**

After individual chapters, run macro eval:
- Structural repetition check
- Tension sag detection
- Chaos distribution across manuscript
- Oscillation count (target ~8)
- Anti-AI pattern density across full manuscript
- Acrostic verification (first letters of chapter titles)
- Entity message verification (first words spell Rumi quote)
- Fibonacci name count verification

- [ ] **Step 3: Calculate Genesis Score**

Score all 7 dimensions. Floor = lowest dimension. Target: 8.5+

- [ ] **Step 4: Calculate CVI-Launch and CVI-Legacy**

Using the formulas from the pipeline. Target CVI-Launch: 8.0+

---

### Task 8: Phase 4.5 — Quality Gate (`/quality-gate`)

- [ ] **Step 1: Invoke `/quality-gate`**

Auto-loop: evaluate → fix → re-evaluate (max 3 iterations per chapter)

If a chapter fails:
- Identify which dimensions are below floor
- Route to Phase 5 (revision) for targeted fixes
- Re-evaluate after revision
- If 3 cycles without floor improvement → flag for structural review (return to Phase 2 foundation)

- [ ] **Step 2: Verify all chapters passed or are flagged**

Update STATE.yaml with `quality_gate.chapters_passed` and `quality_gate.chapters_escalated`

---

### Task 9: Phase 5 — Revision (`/book-editor`)

**Files:**
- Modify: chapters that failed quality gate
- Create: `~/Desktop/the-source-code/evaluations/revision-notes-round-1.md`

**SCOPE:** Task 9 handles ONLY chapters that EXHAUSTED the quality gate's 3 internal iterations without passing (escalated chapters). Chapters that passed within the quality gate loop do NOT come here. This prevents double-revision.

- [ ] **Step 1: Invoke `/book-editor` on escalated chapters only**

4-type revision taxonomy:
- Structural (scene order, pacing, information flow)
- Connective (transitions, chapter links, arc continuity)
- Prose (voice, word choice, rhythm, anti-AI patterns)
- Factual (real-world references, internal consistency)

- [ ] **Step 2: Re-run evaluation on revised chapters**

Loop back to Task 7 for revised chapters only. Max 3 total revision cycles.

---

### Task 10: Phase 5.5 — Manuscript Continuity (`/continuity-guardian`)

**Files:**
- Create: `~/Desktop/the-source-code/continuity/manuscript-audit.md`

- [ ] **Step 1: Invoke `/continuity-guardian` in manuscript mode**

Full manuscript sweep:
- Cross-chapter character consistency
- Timeline integrity
- Plot thread completion (all Chekhov's guns fired)
- Glitch schedule executed correctly
- Easter egg integrity (acrostic, Fibonacci, Entity message, binary in Ch 22)
- Reyes arc: threat → ambiguity → guardian
- All 7 Laws dramatized
- Beta concept: seed (Ch 7) → payoff (Ch 23)

- [ ] **Step 2: Fix any CRITICAL findings**

If critical → revise affected chapters → re-evaluate → re-run continuity

- [ ] **Step 3: Assemble full manuscript**

```bash
cat ~/Desktop/the-source-code/manuscript/chapters/chapter-*.md > ~/Desktop/the-source-code/manuscript/full-manuscript.md
```

---

### **>>> HUMAN CHECKPOINT 2: Manuscript Approval <<<**

Present to Felipe:
1. Full manuscript (~88K words)
2. Genesis Score breakdown (floor target: 8.5+)
3. CVI-Launch and CVI-Legacy scores
4. Continuity audit results
5. Anti-AI scan results
6. Easter egg verification report

**Gate:** Felipe explicitly approves before delivery phase.

---

## Chunk 4: Delivery Phase (6)

### Task 11: Phase 6 — Editorial Package (`/editorial-package`)

**Files:**
- Create: `~/Desktop/the-source-code/delivery/editorial/logline.md`
- Create: `~/Desktop/the-source-code/delivery/editorial/synopsis-cover.md`
- Create: `~/Desktop/the-source-code/delivery/editorial/synopsis-editorial.md`
- Create: `~/Desktop/the-source-code/delivery/editorial/query-letter.md`
- Create: `~/Desktop/the-source-code/delivery/editorial/cover-brief.md`

- [ ] **Step 1: Invoke `/editorial-package`**

Using: full manuscript, research, design spec, Genesis Score, CVI scores.

Produce:
- Logline (1 sentence)
- Cover synopsis (150-200 words)
- Editorial synopsis (1-2 pages, spoilers included)
- Query letter (for US literary agents)
- Cover brief (visual direction for designer)

- [ ] **Step 2: Review editorial package**

Verify logline captures the crossover appeal. Query letter positions correctly for US market.

---

### Task 12: Phase 6 — Production Prep (`/production-prep`)

**Files:**
- Create: `~/Desktop/the-source-code/delivery/formatted/the-source-code.epub`
- Create: `~/Desktop/the-source-code/delivery/formatted/the-source-code-print.md`
- Create: `~/Desktop/the-source-code/delivery/formatted/proofreading-report.md`

- [ ] **Step 1: Invoke `/production-prep`**

8-category proofreading:
- Spelling, grammar, punctuation
- Consistency (names, places, dates)
- Formatting
- Chapter titles match acrostic
- Easter eggs intact after all edits

**CRITICAL production notes for The Source Code:**
- Ch 22: Binary must remain intact (01011001...). Hebrew (אין סוף) and Sanskrit (Tat tvam asi) in native scripts.
- Ch 22: Blank pages are INTENTIONAL — do not fill.
- Glitch paragraphs (repeated text, contradictory perspectives) are INTENTIONAL — do not "fix."
- Chapter numbering skip between Ch 15-16 is INTENTIONAL.
- Ch 25 last sentence = Ch 1 first sentence — verify match.

- [ ] **Step 2: Format for ebook and print**

Ebook: Monospace for binary. Native scripts for Hebrew/Sanskrit. Blank pages.
Print: Same + UV ink consideration for Phantom Chapter (Ch 15-16 gap).

---

### Task 13: Post-Pipeline — CVI Gate

- [ ] **Step 1: Final CVI-Launch verification**

Must be >= 7.0 for submission readiness. Target: 8.0+

If CVI-Launch < 7.0:
- Identify which CVI components are low
- If Commercial Pacing low → revise pacing in specific chapters
- If Casual Reader low → revisit Ch 1-3 hooks
- If Shareability low → strengthen the pantheon table scene, I Ching beat, key quotes
- Loop back to revision if needed

- [ ] **Step 2: Final Genesis Score verification**

Floor must be >= 8.0 (hard minimum). Target: 8.5+

---

### **>>> HUMAN CHECKPOINT 3: Delivery Approval <<<**

Present to Felipe:
1. Final manuscript (formatted)
2. Editorial package (logline, synopses, query letter, cover brief)
3. Final Genesis Score + CVI scores
4. Proofreading report
5. Easter egg verification (acrostic, Fibonacci, Entity message, binary, loop structure)

**Gate:** Felipe approves for submission/publication.

---

## Execution Notes

### Parallelization
- Tasks 1-5 (pre-production) are **sequential** — each depends on the previous
- Task 6 (writing loop) chapters are **sequential** — each chapter needs previous chapters for continuity
- Task 7 (evaluation) can parallelize individual chapter evaluations
- Tasks 11-12 (delivery) can run in parallel

### Estimated Pipeline Duration
- Pre-production (Tasks 0-5): ~5-8 agent sessions
- Writing loop (Task 6, 25 chapters x 5 sub-phases): ~25-50 agent sessions
- Evaluation & revision (Tasks 7-10): ~10-15 agent sessions
- Delivery (Tasks 11-13): ~3-5 agent sessions
- **Total: ~45-80 agent sessions**

### Risk Mitigation
- **Ch 22 is the highest risk chapter.** The multi-modal format may exceed pipeline capabilities. Have a human-assisted fallback ready.
- **Acrostic constraint** may conflict with natural chapter titling. Prioritize the acrostic — titles can be creative within the constraint.
- **Glitch mechanics** require production-prep to NOT "fix" intentional errors. Flag every glitch in a manifest file that production-prep references.
- **Genesis Score floor 8.5+ is ambitious.** If 8.0-8.5 after 3 revision cycles, accept and note the limitation. Don't enter infinite revision loops.

### State Management
- Update STATE.yaml after EVERY phase transition
- Log EVERY decision in `decisions` array with date, rationale, and phase
- If context is lost between sessions, STATE.yaml + outline.md + latest chapter are enough to resume
