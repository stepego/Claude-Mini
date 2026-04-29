---
name: pedagogy-review
description: Run holistic pedagogical review on lecture slides. Checks narrative arc, PhD student prerequisites, worked examples, notation clarity, and deck pacing.
disable-model-invocation: true
argument-hint: "[QMD or TEX filename]"
---

# Pedagogical Review of Lecture Slides

Perform a comprehensive pedagogical review using the PhD econometrics student lens.

## Steps

1. **Identify the file** specified in `$ARGUMENTS`
   - If no argument, ask user which lecture to review
   - If just a name (e.g., `Lecture4_StaggeredRollout.qmd`), look in `Quarto/`
   - If `.tex` file, look in `Slides/`

2. **Launch the pedagogy-reviewer agent** with the full file path
   - The agent reads the entire file
   - Checks 12 pedagogical patterns distilled from completed lectures
   - Performs deck-level analysis (narrative arc, pacing, visual rhythm, notation consistency)
   - Considers PhD student perspective (prerequisites, potential objections)

3. **The agent produces a report** saved to:
   `quality_reports/[FILENAME_WITHOUT_EXT]_pedagogy_report.md`

4. **Present summary to user:**
   - Patterns followed vs violated (out of 12)
   - Deck-level assessments (narrative arc, pacing, notation)
   - Critical recommendations (top 3-5)

## Important Notes

- This is a **read-only review** — no files are edited
- The agent uses a **PhD student lens** — assumes advanced econometrics background but checks that cutting-edge panel methods are introduced properly
- Focuses on **pedagogy** not visual layout (use `/visual-audit` for that)
- For a combined review of everything, use `/slide-excellence` instead
