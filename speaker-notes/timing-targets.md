# Timing Targets — 4-Hour Notre Dame Watch-Along

**Talk total:** 240 min content + 20 min breaks = **4h20 wall-clock**.

Track your real-clock against these targets during dry-runs. If you're off by > 5 min by the time you reach a break, identify what overran and trim from the recovery section noted below.

---

## Cumulative time markers

| Cum. clock | Section | Section length | What's running |
|------------|---------|----------------|----------------|
| **00:00** | Part 1 starts | 40 min | Opening + landscape + CLAUDE.md walkthrough + effective + rules/hooks preview |
| 00:40 | Part 2 starts | 30 min | End-to-end demo (25 min live within) |
| 01:10 | Part 3 starts | 30 min | Skills walkthrough + hands-on + design principles |
| **01:40** | **BREAK** | 10 min | Stretch / coffee |
| 01:50 | Part 4 starts | 25 min | Orchestration + multi-agent + mini-demo |
| 02:15 | Part 5 starts | 45 min | Replication (15-min live demo within) |
| **03:00** | **BREAK** | 10 min | Stretch / coffee / pre-flight check Demo 5 |
| 03:10 | Part 6 starts | 45 min | Peer review + responses (28 min live total) |
| 03:55 | Part 7 starts | 25 min | Closing + cross-tool + Q&A |
| **04:20** | END | — | Tickets, hands shaken, walk to coffee |

---

## Per-section internal targets

### Part 1 (40 min) — minute markers from start

- 00:00 — 00:05 — Opening framing (4-5 slides)
- 00:05 — 00:10 — Tool landscape + 4 primitives
- 00:10 — 00:25 — CLAUDE.md walkthrough (LIVE — open file in editor)
- 00:25 — 00:35 — Effective CLAUDE.md (include/exclude, finance + accounting examples, length budget)
- 00:35 — 00:40 — Rules + hooks preview, tee-up Part 2

**Recovery section if running long:** trim the rules+hooks preview (covered again in Part 4).

### Part 2 (30 min) — minute markers from start (00:40)

- 00:40 — 00:43 — Setup framing
- 00:43 — 01:08 — Live demo (25 min, see `demos/01-end-to-end/README.md`)
- 01:08 — 01:10 — Wrap debrief

**Demo abort trigger:** if at 01:00 (T+15 from demo start) the review fanout hasn't fired, kill live + play recording.

### Part 3 (30 min) — minute markers from start (01:10)

- 01:10 — 01:15 — What is a skill (5 slides, no demo)
- 01:15 — 01:25 — `/preregister` walkthrough + invocation
- 01:25 — 01:35 — Hands-on (10 min paper exercise)
- 01:35 — 01:40 — Design principles + workshop wrap

**Recovery section if running long:** cut workshop volunteer share to 1 person (was planned for 2).

### Part 4 (25 min) — minute markers from start (01:50)

- 01:50 — 01:55 — Why orchestration (6-step loop)
- 01:55 — 02:05 — Three patterns where multi-agent helps
- 02:05 — 02:10 — When it doesn't (decomposition trap)
- 02:10 — 02:15 — Hooks + mini-demo

**Recovery section if running long:** skip the mini-demo (briefly describe what it would do).

### Part 5 (45 min) — minute markers from start (02:15)

- 02:15 — 02:20 — Replication-first framing + personal anecdote
- 02:20 — 02:30 — Code inventory + cross-artifact-review pattern
- 02:30 — 02:40 — AEA-style packaging
- 02:40 — 02:55 — Live demo (15 min, see `demos/04-replication/README.md`)
- 02:55 — 03:00 — Wrap

**Demo abort trigger:** at 02:50 (T+10 from demo start), if discrepancy not surfaced, switch to recording.

### Part 6 (45 min) — minute markers from start (03:10)

- 03:10 — 03:15 — Referee-perspective framing
- 03:15 — 03:35 — Live demo 5a: `/review-paper --peer AER` (20 min)
- 03:35 — 03:45 — Drafting referee responses framing
- 03:45 — 03:53 — Live demo 5b: `/respond-to-referees` (8 min)
- 03:53 — 03:55 — Wrap

**Demo 5a abort:** at 03:30 (T+15 of demo), if no editorial decision yet, switch to recording.
**Demo 5b abort:** at 03:51 (T+6 of demo 5b), describe the rest with `expected-decision.md` open.

### Part 7 (25 min) — minute markers from start (03:55)

- 03:55 — 04:00 — Full-stack recap
- 04:00 — 04:10 — Cross-tool strategies (mini-demo OPTIONAL)
- 04:10 — 04:15 — Ecosystem tour
- 04:15 — 04:20 — Resources + Q&A start

**Q&A buffer:** if Part 7 ends at 04:15 instead of 04:20, you have 5 extra minutes for Q&A. **Use it.**

---

## Drift recovery rules

1. **If 5+ min behind by the first break (01:40):** cut Part 4's mini-demo. Talk through it instead.
2. **If 10+ min behind by the second break (03:00):** consider truncating Part 6's response-letter demo (5b). The `--peer` demo (5a) is the headline; 5b can be described.
3. **If running ahead:** spend the slack in Q&A at the end. Don't add material — Q&A is what builds adoption.

---

## Live-demo budgets (read this before any rehearsal)

| Demo | Hard ceiling | Soft target | Abort point |
|------|--------------|-------------|-------------|
| Demo 1 (Part 2 end-to-end) | 25 min | 22 min | T+15 if no fanout |
| Demo 3 (Part 4 orchestration) | 5 min | 3 min | T+3 if hook hasn't fired |
| Demo 4 (Part 5 replication) | 15 min | 12 min | T+10 if no discrepancy |
| Demo 5a (Part 6 peer review) | 20 min | 18 min | T+15 if no editorial decision |
| Demo 5b (Part 6 response letter) | 8 min | 6 min | T+6 if mapping not visible |
| Demo 6 (Part 7 cross-tool) | 3 min | 2 min | OPTIONAL — skip if behind |

**If a demo hits hard ceiling without recording fallback ready: stop the demo, narrate what would have happened, move on.** Better to lose 2 min of demo than 10 min of confused-audience time.
