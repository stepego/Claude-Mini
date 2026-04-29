---
name: visual-audit
description: Perform adversarial visual audit of Quarto or Beamer slides checking for overflow, font consistency, box fatigue, and layout issues.
disable-model-invocation: true
argument-hint: "[QMD or TEX filename]"
---

# Visual Audit of Slide Deck

Perform a thorough visual layout audit of a slide deck, checking for overflow, font consistency, box fatigue, and spacing issues.

## Steps

1. **Read the slide file** specified in `$ARGUMENTS`

2. **For Quarto (.qmd) files:**
   - Render with `quarto render Quarto/$ARGUMENTS`
   - Open in browser to inspect each slide

3. **For Beamer (.tex) files:**
   - Compile and check for overfull hbox warnings

4. **Audit every slide for:**

   **OVERFLOW:**
   - Content exceeding slide boundaries
   - Text running off the bottom of the slide
   - Overfull hbox warnings (LaTeX)

   **FONT CONSISTENCY:**
   - Inline font-size overrides below 0.85em
   - Inconsistent font sizes across similar slides
   - Blanket font reduction via `.smaller` when spacing would suffice

   **BOX FATIGUE:**
   - 2+ colored boxes on a single slide (dilutes visual emphasis)
   - Transitional remarks in boxes that should be plain italic
   - `.quotebox` used for non-quotations

   **SPACING:**
   - Missing negative margins on section headings
   - Missing `fig-align: center` on plots
   - Blank lines between bullet items that could be consolidated

   **LAYOUT:**
   - Missing fragment reveals (`. . .`) for problem→solution moments
   - Missing standout slides at major conceptual pivots
   - Missing framing sentences before formal definitions
   - `.positive`/`.negative` semantic colors not used on binary contrasts

5. **Produce a report** organized by slide:
   - Slide title/number
   - Issue description
   - Severity (high/medium/low)
   - Recommended fix (spacing-first approach)

6. **Follow the spacing-first principle:**
   Priority order for fixes:
   1. Reduce vertical spacing with negative margins
   2. Consolidate lists (remove blank lines)
   3. Move displayed equations inline
   4. Reduce image/SVG size
   5. Last resort: font size reduction (never below 0.85em)
