# CLAUDE.MD — Claude-Mini

**Project:** Notre Dame faculty seminar — agentic AI for academic research
**Author:** Pedro H. C. Sant'Anna (Emory University)
**Audience:** Faculty in economics, finance, and accounting
**Format:** 4-hour watch-along

---

## Core Principles

- **Plan first.** Enter plan mode before non-trivial work; save plans to `quality_reports/plans/`.
- **Verify after.** Compile/render and confirm output at the end of every task.
- **Quality over completeness.** A 30-slide section that lands beats a 50-slide section that drags.
- **The deck is one file.** `Quarto/notre-dame-claude-mini.qmd` — single .qmd, single source of truth.

This repo is the **teaching distillation** of `claude-code-my-workflow`. Skills referenced here live in BOTH places (copies in `.claude/skills/` for demo invocation; canonical sources in the parent repo).

---

## Folder Structure

```
Claude-Mini/
├── Quarto/
│   ├── notre-dame-claude-mini.qmd    # The 4-hour deck
│   ├── _quarto.yml                   # Project config
│   └── claude-mini.scss              # Theme — Emory base + Anthropic-orange accent
├── Figures/                          # Logos + custom diagrams (SVGs)
├── demos/                            # 6 pre-staged demo bundles (one per part)
├── exercises/                        # Part 3 hands-on handouts
├── handouts/                         # Take-home PDFs
├── speaker-notes/                    # Slide script, demo choreography, pre-flight
└── .claude/skills/                   # Demo-only skills (subset of parent repo)
```

---

## Commands

```bash
# Render the deck to HTML
cd Quarto && quarto render notre-dame-claude-mini.qmd

# Preview live (auto-reload on save)
cd Quarto && quarto preview notre-dame-claude-mini.qmd

# Open the latest render
open Quarto/notre-dame-claude-mini.html
```

**Visual identity contract:**
The theme `Quarto/claude-mini.scss` is derived from Pedro's Econ 730 deck. Two section-divider color variants are available:
- `# Title {.emoryblue}` — for substance / case-study sections (Parts 2, 5, 6)
- `# Title {.claudeorange}` — for sections about the agent itself (Parts 1, 4, 7)

---

## Quality Thresholds (advisory)

| Threshold | Meaning |
|-----------|---------|
| 80 / 100  | Slide is ready to ship |
| 90 / 100  | Slide is ready to teach |
| 95 / 100  | Aspirational |

There is no automated `quality_score.py` for this repo (intentionally lean). Apply judgment.

---

## Live demo discipline

Per the talk plan (`quality_reports/plans/piped-frolicking-turing.md` in the parent repo):

- Every live demo has a **pre-recorded fallback** at `demos/<demo-id>/pre-recorded.mp4`.
- Every live demo has a **literal-commands script** at `demos/<demo-id>/README.md`.
- Every live demo has an **abort trigger** documented at a specific time-mark — if not reached, play the recording.
- Don't pull updates to `claude-code-my-workflow` during the week of the talk. Pin the version.

---

## Cross-references

- Parent repo: [`claude-code-my-workflow`](https://github.com/pedrohcgs/claude-code-my-workflow) — full template (30 skills / 14 agents / 24 rules / 6 hooks).
- Talk plan: `claude-code-academic-workflow/quality_reports/plans/piped-frolicking-turing.md`.
- Visual reference: [`Econ-730---Causal-Panel-Data`](https://github.com/pedrohcgs/Econ-730---Causal-Panel-Data) — source of `claude-mini.scss` derivation.
