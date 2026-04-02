# Changelog

## V4.1.1 — Entity Tracking + English Standardization (2026-03-21)

### New Skill: entity-tracker
- Builds and maintains `ENTITY_STATE.yaml` -- persistent, structured state for manuscript entities
- Two modes: BUILD (from foundation/outline) and UPDATE (incremental after chapter batches)
- Tracks characters (physical facts, traits, knowledge graph, location log), locations, timeline, objects (Chekhov status), world rules, organizations
- Conflict detection: flags contradictions as UNRESOLVED without resolving them
- Source-mandatory: every entry requires chapter:paragraph citation
- Consumed by continuity-guardian, prose-craft, dialogue-polish, book-editor, chaos-engine

### Upgraded: continuity-guardian
- Reads ENTITY_STATE.yaml instead of rebuilding databases from scratch
- New Audit 6: YAML vs Text Divergence -- validates UNRESOLVED conflicts
- Outputs suggested YAML patches alongside markdown report
- Backward compatible: falls back to V4 behavior if YAML doesn't exist

### English Standardization
- Translated 2 remaining Portuguese skills to English: editorial-package, production-prep
- Book-orchestrator checkpoints now language-adaptive (no hardcoded Portuguese)
- STATE.yaml schema fields now in English (migration note included)

### Documentation
- FAQ updated: fixed skill count (was 12, now 21), added V4.1.1 information
- README updated: skill count 21, pipeline diagram with entity-tracker phases
- Skills reference updated: entity-tracker entry, cross-skill consumption notes
- Architecture doc updated: entity-tracker data flow

### Showcase
- Added Age of Aquarius (Hermetic Fantasy, EN, Genesis Score 9.16, 97K words)
- Added multilingual synopses (EN, ES) for Protocolo Nao Encontrado

---

## V4.1 — Autonomous Pipeline (2026-03-15)

V4.1 adds 8 new skills, doubles the phase count to 14, and introduces fully autonomous execution with `/book-auto`.

### New Skills (8)

| Skill | Phase | What It Solves |
|-------|-------|---------------|
| **reader-persona** | 1.5 | Writer was writing for nobody specific. Now 3-5 personas with psychology, deal-breakers, triggers drive every downstream decision. |
| **voice-fingerprint** | 2.5 | Characters sounded alike (failed cover-the-name test). Now Voice DNA document with per-character specs, differentiation matrix, voice-under-pressure variants. |
| **continuity-guardian** | 2.7 + 5.5 | Characters knew things before being told. Dead characters reappeared. Now 5 systematic audits: character consistency, timeline, information flow, plot threads, world rules. |
| **dialogue-polish** | 3.1 | Dialogue was the #1 voice-bleeding point. Now dedicated pass with cover-the-name test, subtext injection, tag/beat ratio check. |
| **hook-craft** | 3.2 | Chapters started with weather and ended with sleep. Now 6 hook types + 6 pull types scored 1-10, plus binge test across all chapters. |
| **mechanical-preprocess** | 3.8 | Single agent couldn't process 30 chapters for em-dash removal (context overflow). Now bash handles 80%, agent reviews 20%. Scales to any manuscript size. |
| **quality-gate** | 4.5 | Human had to babysit every eval→fix→re-eval cycle. Now auto-loop with max 3 iterations, escalation protocol, regression detection. |
| **book-auto** | Entry | 150+ manual invocations per book. Now one command, 3 checkpoints, everything else automatic. |

### Pipeline Changes

- **7 phases → 14 phases.** New sub-phases for reader personas (1.5), voice DNA (2.5), outline continuity (2.7), dialogue polish (3.1), hook craft (3.2), mechanical preprocessing (3.8), quality gate (4.5), manuscript continuity (5.5).
- **Manual → Autonomous.** The book-orchestrator agent now has 200 turns and runs the full pipeline with 3 human checkpoints.
- **Orchestrator updated.** `book-genesis` SKILL.md now has all 14 phase gates, dispatch templates for all 20 skills, and STATE.yaml schema with voice_dna, reader_personas, continuity, quality_gate, and mechanical_preprocess tracking.

### Systemic Fixes (learned from Protocolo Vermelho + Era de Aquário iterations)

1. **Editor vs Writer for voice:** book-editor inserts markers but can't change voice architecture. Voice work now requires book-writer (full rewrite with voice constraints from voice-dna.md).
2. **Pre-fab stopping sentences don't stop:** Generating sentences out of context then distributing fails. Writer must create them in-context at peak emotional moments.
3. **Bash for mechanical cleanup:** AI agents hit context limits processing 30 chapters. Bash pipeline handles pattern matching at any scale, agent only reviews diffs.
4. **Single agent scaling limit:** One agent handles ~3-5 chapters reliably. For full manuscripts: batch into groups of 5 or use mechanical preprocessing.
5. **Voice-under-pressure is non-negotiable:** Same voice at peace and crisis caps Characters at 7.5. Must be specified in voice-dna.md before writing begins.

---

# Changelog -- V2 to V4

Every change listed here traces back to a specific failure identified in the 5-genre system analysis (docs/system-analysis.md). V3 was an internal iteration with ~75 calibrations. V4 is the public release.

---

## New Skills

### chaos-engine (Disruptor)
- **Problem it solves:** System analysis Section 9 -- "Missing Phase: The Disruption Pass." All 5 test books were under authorial control at all times. No mechanism existed to introduce unpredictability.
- **What it does:** Operates between writing (Phase 3) and evaluation (Phase 4) as Phase 3.5. Moves scenes, deletes expected paragraphs, inserts irrelevant details, breaks emotional management moments, strips explanatory clauses from similes.
- **Writer can reject** individual disruptions.

### book-editor (Editor)
- **Problem it solves:** V2 relied on the writer to revise their own work, producing diminishing returns. Same blind spots in revision as in writing.
- **What it does:** Dedicated revision agent with a different perspective. Classifies weaknesses by 4-type taxonomy (structural, connective, prose, factual). Executes revisions in priority order. Uses Genesis Score to determine which dimension gets attention first.

### book-researcher (Researcher)
- **Problem it solves:** System analysis Section 6 -- "Give the Evaluator Comp Title Passages." The evaluator had no reference text to benchmark against. Research was shallow (embedded in orchestrator).
- **What it does:** Deep market research in Phase 1. Produces comp title passages for evaluator benchmarking, bestseller-dna.md with extracted prose patterns, market gap analysis, genre convention checklists.

---

## Genesis Score Changes

### V2 to V3.7

- **5 anti-inflation rules expanded to 10.** Added: external benchmark anchoring (Rule 6), scope declaration (Rule 7), discovery test (Rule 8), devoted reader test (Rule 9), oscillation analysis (Rule 10).
- **External benchmark anchoring.** Specific published works define score anchors: Normal People, Gone Girl, Atomic Habits, The Alchemist, Fifty Shades. Scores must be placed NEXT TO these benchmarks.
- **Genre-adjusted profiles.** 8 genre profiles adjust ALL 7 dimensions. What scores 8.0 in literary fiction differs from 8.0 in a thriller. Prose priority, pacing priority, character depth, theme weight, and chaos frequency all vary by genre.
- **Theoretical ceiling by genre.** Literary fiction caps at 9.5, thriller at 9.0, parable fiction at 8.5. No score reaches 10.0.
- **Engagement types (5 mechanisms).** Empathy, Fascination, Self-Insertion, Intellectual Stimulation, Aspiration/Identity. Primary engagement type adjusts CVI-Legacy weights and writing priorities.
- **Pattern #11 hard check.** After every evaluation, mandatory re-scan for Explanatory Extension pattern. More than 2 per chapter average = mandatory revision.

### CVI System (NEW)

- **CVI-Launch.** 6 inputs predicting first-year sales: market timing, comp title freshness, hook strength, platform/audience, pacing score, genre convention compliance. Gate: >= 7.0 for editorial submission.
- **CVI-Legacy.** 5 inputs predicting 20-year staying power: re-readability, emotional resonance, shareability (MAX x 0.6 + AVG x 0.4), identity effect, cultural vocabulary penetration.
- **Engagement-adjusted CVI-Legacy weights.** Aspiration/Identity engagement type shifts Identity Effect to 25% weight.
- **Prescriptive NF override.** Adds Framework Utility (25%) as 6th input for prescriptive non-fiction.
- **Separation of concerns.** Genesis Score governs revision priority. CVI governs submission readiness. A book can have strong craft but weak market timing, or weak craft but perfect market moment.

---

## Anti-AI Protocol

### 10 patterns expanded to 20

New patterns added (11-20), all identified because they appeared in ALL FIVE test books:

11. **The Explanatory Extension** -- #1 pipeline fingerprint. Every observation completed and explained. When you write a simile, STOP. Do not extend it.
12. **Binary Negation Openers** -- "Not X. Not Y. [What it actually is]." Define by assertion, not negation.
13. **Precision Flex** -- Unnecessarily exact numbers used to seem concrete.
14. **Emotional Control Demonstration** -- Character notices emotion, manages it, continues. Sometimes the management must FAIL.
15. **Authoritative Description** -- Settings described with encyclopedic confidence. Characters new to a place should notice LESS and be confused by MORE.
16. **Philosophical Asides** -- Universal truths masquerading as character thoughts. If it works on a coffee mug, rewrite it.
17. **Clean Dialogue** -- Characters speaking in orderly turns, each line precisely responsive. Real conversation overlaps, fragments, goes sideways.
18. **Thematic Echo Chamber** -- Every detail resonating with the theme. Allow 30-40% pure TEXTURE.
19. **Graduated Reveal** -- Establish normal, introduce anomaly, escalate, close. This is ONE structure. Others exist.
20. **Emotional Temperature Report** -- Periodic body check-ins at regular intervals like vital signs.

### Genre-adjusted thresholds (NEW)

Human bestsellers score 0-13/20. Target is NOT zero:
- Literary Fiction: 0-3 clean
- Memoir: 0-4 clean
- Commercial Fiction: 0-8 clean
- Prescriptive NF: 0-12 clean

Benchmarks: Normal People 1/20, Where the Crawdads Sing 7/20, The Midnight Library 13/20.

A manuscript scoring 0/20 in commercial fiction reads as over-corrected AI. Some patterns are features of accessible prose, not AI fingerprints.

### Prevention over detection (NEW)

V2 approach: write, then scan. V4 approach: internalize all 20 patterns BEFORE writing. The scan is a safety net, not the primary defense.

---

## Character System

### Character Chaos Profiles (NEW)
- **Problem it solves:** System analysis Section 3 -- "Thinking Like Plot Servants." Every character's thoughts served the plot. No irrelevant thoughts, no cognitive mess, no human noise.
- **4 chaos types per character:** Irrelevant thought (1-2 sentences, no narrative justification), cognitive distortion in action, unprompted memory at the wrong time, failed emotional management.
- **Genre-adjusted frequency:** Literary fiction/memoir: 1+ per chapter. Commercial fiction: 1 per 2-3 chapters. Prescriptive NF: skip for author.
- **Inhabited vs. mediated chaos.** The chaos takes over the prose for a moment. The narrator does not comment. The reader experiences it directly.
- **Composure calibration.** Genuinely composed characters get subtle chaos -- a flicker, a microsecond. Still present, just filtered through composure.
- **Secondary character chaos.** Every secondary character in a scene gets ONE moment of their own chaos -- a reaction that is NOT about the protagonist.

### Voice Under Pressure (NEW)
- **Problem it solves:** System analysis Section 7 -- all 5 voices converged to the same register under stress.
- Voice bank must include 3+ samples of the voice FAILING. Voice MUST change under emotional pressure.

### Voice Inhabitation Protocol (NEW)
- **Problem it solves:** System analysis Section 9 -- Claude imitated voices rather than inhabiting them.
- Before writing each chapter, write a 200-300 word freewrite AS the character. Discarded. Purpose: BECOME the character before writing their story.

---

## Emotional System

### Emotional Anchors Replace Numerical Curves
- **Problem it solves:** System analysis Section 2 -- "4/10" curves produced chapters at exactly 4/10 intensity. No surprise.
- Each chapter gets a specific image, moment, or line the reader should carry away. Concrete, not abstract.

### Emotional Surprises (NEW)
- Each chapter specifies where the expected emotion should be WRONG. A laugh in grief. Calm in danger.

### Expanded Emotional Techniques
- **Problem it solves:** System analysis Section 2 -- emotion was always "physical sensation + metaphor."
- 6 techniques added: contradiction, understatement, dramatic irony, wrong reaction, accumulated mundane detail, body rebels.

### "Would You Remember This Tomorrow?" Test (NEW)
- After evaluation: "What image or line would the reader remember the next morning?" If nothing specific, the chapter has failed.

### Vulnerability Before Competence (NEW)
- **Problem it solves:** System analysis Section 1B -- all 5 test books opened with competence.
- If 3+ pages of competence pass without vulnerability, insert a moment of weakness.

---

## Commercial Viability

### Casual Reader Gate (NEW)
- **Problem it solves:** System analysis Section 9 -- all 3 beta readers were sophisticated.
- Airport reader who decides on vibes. If they put it down, the chapter fails regardless of Genesis Score.

### CVI-Launch and CVI-Legacy (NEW)
- Separate commercial prediction from craft quality. See Genesis Score Changes.

### Identity Effect (NEW)
- At least once every 3-4 chapters, a moment that makes the reader feel something about THEMSELVES. Drives recommendations.

### Cultural Vocabulary (NEW)
- Branded terms the reader adopts into speech. First introduction organic, reinforcement deepens meaning.

### Re-Read Architecture (NEW)
- Planned details that gain meaning after the ending. Invisible on first read, illuminating on second.

---

## Evaluation System

### 4th Beta Reader: The Casual Reader (NEW)
- The person who decides on vibes, not craft.

### Comp Title Passage Benchmarking (NEW)
- **Problem it solves:** System analysis Section 6 -- evaluator had no reference text.
- book-researcher provides actual passages from published bestsellers. Evaluator benchmarks against real prose.

### Cross-Book Pattern Detection (NEW)
- **Problem it solves:** System analysis Section 6 -- evaluator was blind to cross-book patterns.
- Compare output against previous pipeline output for repeated patterns.

---

## Pipeline Architecture

### 6 phases expanded to 7
- Phase 3.5 (Disruption) added between Writing and Evaluation.

### Structural Diversity (NEW)
- **Problem it solves:** System analysis Pattern 19 -- all 5 books used Graduated Reveal.
- 8 structural types for chapters. No consecutive repeats.

### 7 Opening Strategies for Chapter 1 (NEW)
- **Problem it solves:** System analysis Section 8 -- all 5 books opened with "competent professional encounters anomaly."
- 7 types: voice bomb, in medias res, wrong emotion, confession, question, ordinary made strange, failure.

### Reading Speed Design (NEW)
- 1-2 acceleration passages and 1-2 deceleration passages per chapter. Speed VARIATION creates "can't put down."

### Scene Transition Toolkit (NEW)
- 5 types: hard cut, sensory bridge, dialogue bridge, time compression, emotional carry. Vary across chapters.

### Exposition Disguises (NEW)
- 5 techniques: conflict delivery, discovery delivery, wrong delivery, cost delivery, incidental delivery.

### Dialogue Craft Expansion (NEW)
- Interruptions (mid-word), repetition under stress, responding to the wrong thing, trailing off, silence as dialogue, "said" as dominant tag.

### Mandatory Ugly Sentence (NEW)
- **Problem it solves:** System analysis Section 10G -- Claude defaults to polish.
- One deliberately rough sentence per chapter in a quiet moment.

### The Impulse Instruction (NEW)
- **Problem it solves:** System analysis Section 10A -- "Teach the Writer to Lose Control."
- After writing as planned, follow unplanned pulls for 2-3 paragraphs. Keep if better.

### Flexible Obligations (NEW)
- **Problem it solves:** System analysis Section 9 -- 5 simultaneous obligations produced checkbox chapters.
- One obligation per chapter allowed to take a backseat.

### Writer Self-Reports (NEW)
- Every chapter produces a report: word count, emotional anchor, chaos moments, impulse deviations, ugly sentence, anti-AI scan, outline deviations, structural approach, secondary character moments.

### STATE.yaml (renamed from PROJECT_STATE.yaml)
- Now tracks writer self-reports, disruption reports, CVI scores, engagement type configuration.
