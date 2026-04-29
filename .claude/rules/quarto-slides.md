---
paths:
  - "Quarto/**/*.qmd"
---

# Quarto RevealJS Slide Design Rules

These rules provide Quarto-specific design intelligence. Quarto/RevealJS has different capabilities and constraints than Beamer LaTeX — even though both use **16:9 aspect ratio** in this course (Beamer: `aspectratio=169`, Quarto: `1600×900`).

**Key principle:** Content parity with Beamer (every idea appears in both), but **presentation can diverge** to exploit each format's strengths.

---

## What Quarto Can Do That Beamer Can't

### 1. COLUMNS WITH FLEXIBLE SIZING
Beamer has rigid `\begin{columns}`. Quarto uses CSS flex:

```markdown
:::: {.columns}
::: {.column width="40%"}
Text explanation (narrower)
:::
::: {.column width="60%"}
Large diagram or figure (wider)
:::
::::
```

**Use when:** Text + large diagram, or two differently-sized content blocks.

### 2. TABSETS FOR RELATED CONTENT
Show multiple related views without separate slides:

```markdown
::: {.panel-tabset}
## Estimator 1
[Content for first estimator]

## Estimator 2
[Content for second estimator]
:::
```

**Use when:** 4+ related items that share context but would overflow vertically (e.g., multiple assumptions, multiple estimators, comparison of methods).

### 3. FRAGMENT EFFECTS
Quarto fragments are smoother than Beamer `\pause`:

```markdown
[This fades in]{.fragment .fade-in}
[This grows]{.fragment .grow}
[This highlights]{.fragment .highlight-blue}
```

**Use when:** Want to emphasize a specific term or draw attention beyond simple `. . .` reveal.

### 4. SPEAKER NOTES
```markdown
::: {.notes}
Remind students about Lecture 2 notation here.
Mention the paper's alternative specification in footnote 12.
:::
```

**Use when:** Instructor needs reminders or context that would clutter the slide. Keeps slides clean while preserving teaching notes.

### 5. INCREMENTAL LISTS
```markdown
::: {.incremental}
- First bullet appears on click
- Second bullet appears on click
- Third bullet appears on click
:::
```

**Use when:** Long bullet lists (4+ items) where revealing all at once would be overwhelming.
**Avoid when:** List is short (≤3 items) — too much clicking annoys the audience.

### 6. BACKGROUND COLORS/IMAGES PER SLIDE
```markdown
## Slide Title {background-color="#E8EDF5"}

## {background-image="../Figures/photo.jpg" background-size="cover"}
```

**Use for:** Transition slides (light blue `#E8EDF5`), section dividers, or full-image "wow" slides.

### 7. AUTO-ANIMATE FOR NOTATION BUILDING
```markdown
## Slide 1 {auto-animate=true}
$$Y_i(d)$$

## Slide 2 {auto-animate=true}
$$Y_{it}(\mathbf{d}_{i,1:T})$$
```

Smoothly morphs notation from simple to complex. **Use when:** Building notation across 2-3 slides.

### 8. SCROLLABLE APPENDICES
```markdown
## Appendix: Full Regression Table {.scrollable}
[Very long content]
```

**Use for:** Appendix content (full code, sensitivity tables) that needs to be available but not presentable.

---

## What Beamer Does Better

| Capability | Beamer Advantage | Quarto Implication |
|-----------|-----------------|-------------------|
| Math typesetting | `\underbrace{}`, precise alignment, spacing | Keep Quarto math simple; use TikZ→SVG for complex visual math |
| Precise positioning | `tikzpicture`, `minipage`, `\vspace{}` | Use CSS margins/flex, accept less pixel-perfect control |
| PDF output | Deterministic across machines | Always test HTML in browser — rendering varies |
| Page breaks | Exact content per page | RevealJS viewport may clip differently than expected |

---

## Quarto-Specific Overflow Strategy

**Different priority order than Beamer** — Quarto has more tools:

1. **Reduce vertical spacing** — negative margins on headings/boxes (same as Beamer)
2. **Use columns** — split content 50/50 or 40/60 horizontally (Quarto advantage)
3. **Consolidate lists** — remove blank lines between items (same as Beamer)
4. **Tabsets for alternatives** — convert 4+ stacked items to tabs (Quarto advantage)
5. **Move to speaker notes** — optional instructor context (Quarto advantage)
6. **Reduce image width** — `width="80%"` or `width="70%"` (same as Beamer)
7. **Font reduction** — last resort, never below 0.85em (same as Beamer)

**Example transformation (overflow → tabsets):**
```markdown
# BEFORE (overflows with 5 assumptions stacked vertically):
## Assumptions
**Assumption 1 (Random Assignment):** $D_i \perp \{Y_i(0), Y_i(1)\}$
**Assumption 2 (Overlap):** $0 < P(D_i=1) < 1$
**Assumption 3 (SUTVA):** No interference between units
**Assumption 4 (Non-anticipation):** Future treatment doesn't affect current outcomes
**Assumption 5 (Limited Carryover):** Only last $p$ periods matter

# AFTER (fits cleanly with tabsets):
## Assumptions
::: {.panel-tabset}
### Random Assignment
$D_i \perp \{Y_i(0), Y_i(1)\}$
Potential outcomes are independent of treatment assignment.

### Overlap
$0 < P(D_i=1) < 1$
Every unit has positive probability of each treatment.

### SUTVA
No interference between units — one unit's treatment doesn't affect another's outcome.

### Non-anticipation
Future treatment doesn't affect current outcomes.

### Limited Carryover
Only the last $p$ periods of treatment history matter for current outcomes.
:::
```

---

## Quarto Transition/Standout Slide Patterns

This course uses a local `.transition` CSS class (defined in `<style>` blocks within QMD files):

```markdown
## {.transition background-color="#E8EDF5"}

[How should we optimally estimate causal effects?]{style="font-size: 1.5em; color: #012169; max-width: 80%;"}

[Focus: Moving from identification to efficient estimation]{style="color: gray; font-size: 1.0em;"}
```

**Section dividers** use blue headers:
```markdown
# Section Name {.emoryblue}
```

---

## Quarto Rendering Verification

After every render:
1. **Open in browser** — check every slide with arrow keys
2. **Verify fragments** — `. . .` reveals work, tabsets switch correctly
3. **Check math** — MathJax rendered all equations (no raw LaTeX visible)
4. **Test images** — SVGs render crisply, no broken paths
5. **Check navigation** — menu, slide numbers, progress bar functional
6. **Verify bibliography** — References slide has all entries

---

## CRITICAL: Beamer Is the Floor, Not the Ceiling

**Quarto slides must look *at least* as good as Beamer, and ideally better.** The Beamer PDF is the quality baseline. Every idea, visual, and piece of content in Beamer must have an equal or superior Quarto counterpart.

### Quality Parity Checklist (Before Any QMD Commit)
```
[ ] Every Beamer frame has a corresponding Quarto slide (count them)
[ ] Every Beamer environment has a CSS equivalent (methodbox, keybox, eqbox, softbox, etc.)
[ ] Every TikZ diagram uses the LATEST SVGs extracted from the CURRENT Beamer source
[ ] Every R-generated plot uses interactive plotly (not static SVG)
[ ] Transition slides include gold rule visual (not just plain text)
[ ] Notation matches Beamer exactly (check subscripts, superscripts, function arguments)
[ ] Citations match Beamer (verify every @key exists in Bibliography_base.bib)
```

### Environment Parity (Beamer → Quarto CSS)
| Beamer Environment | Quarto CSS Class | Visual |
|-------------------|-----------------|--------|
| `methodbox` | `.methodbox` | Blue left-accent, 6% blue bg |
| `keybox` | `.keybox` | Gold left-accent, 12% gold bg |
| `highlightbox` | `.highlightbox` | Yellow left-accent, 8% yellow bg |
| `resultbox` | `.resultbox` | Gold border + shadow, 15% gold bg |
| `quotebox` | `.quotebox` | Gold left-border, italic, quote mark |
| `assumptionbox` | `.assumptionbox` | Gold border, 8% gold bg |
| `eqbox` | `.eqbox` | Borderless, 4% blue tint — for displayed equations |
| `softbox` | `.softbox` | Borderless, 6% gold tint, italic — for transitional remarks |

**Every Beamer environment MUST have a CSS equivalent.** If a new Beamer environment is added to the theme, a corresponding CSS class MUST be added to `emory-clean.scss` before translation.

### Transition Slide Pattern (Gold Rule)
Beamer transition slides use a gold rule separator. The Quarto equivalent:

```markdown
## {.transition background-color="#E8EDF5"}

[Context or summary line.]{style="font-size: 1.2em; color: #525252;"}

<hr style="border: none; border-top: 2px solid #B9975B; width: 80%; margin: 0.8em auto;">

::: {.keybox style="text-align: center; max-width: 85%; margin: 0 auto;"}
[**Forward-looking question or statement.**]{style="font-size: 1.3em; color: #012169;"}
:::
```

---

## Interactive Plotly Figures (Mandatory for R-Generated Plots)

R-generated figures in Quarto slides **MUST** use interactive plotly charts, not static SVG/PNG images. This provides hover tooltips, zoom, and pan — making lecture slides more engaging for students.

### When to Use Plotly
- **All R-generated plots** with data from RDS files (trends, coefficients, histograms, scatter plots)
- Plots where interactivity adds value: hover to see exact values, zoom into dense regions

### When to Keep Static SVG
- **TikZ diagrams** (LaTeX-generated, no R data)
- **Complex faceted grids** (8+ panels, e.g., `brazil_cov_densities` with 8 density panels)
- **Multi-panel density comparisons** (4+ overlapping densities per panel, e.g., DR/ML simulation DGPs)

### CRITICAL: RevealJS Height Override for Plotly
RevealJS auto-stretch compresses plotly widgets into tiny containers. **Every QMD with plotly charts MUST include this CSS in the YAML header:**

```css
.reveal .slide .plotly.html-widget {
  height: 650px !important;
}
```

Without this, plotly charts will be squished regardless of the `height` parameter in R code.

### Pattern: Emory Plotly Layout Helper
Define once in the setup chunk, reuse for all plots:

```r
emory_plotly_layout <- function(p, title = "", xtitle = "", ytitle = "",
                                 height = 650, showlegend = TRUE) {
  p %>% layout(
    title = list(text = paste0("<b>", title, "</b>"),
                 font = list(size = 18, color = emory_blue), x = 0.02, xanchor = "left"),
    xaxis = list(title = list(text = paste0("<b>", xtitle, "</b>"),
                              font = list(size = 13)),
                 tickfont = list(size = 11), gridcolor = "rgba(0,0,0,0.08)"),
    yaxis = list(title = list(text = paste0("<b>", ytitle, "</b>"),
                              font = list(size = 13)),
                 tickfont = list(size = 11), gridcolor = "rgba(0,0,0,0.08)"),
    legend = list(orientation = "h", x = 0.5, xanchor = "center",
                  y = -0.15, font = list(size = 11)),
    showlegend = showlegend,
    plot_bgcolor = "white", paper_bgcolor = "white",
    margin = list(b = 80, t = 50, l = 60, r = 20),
    height = height
  ) %>% config(displayModeBar = TRUE, displaylogo = FALSE)
}
```

### Data Source: RDS Files
- Load pre-computed RDS data in the setup chunk: `readRDS("../Figures/LectureN/data.rds")`
- Never hardcode data values in QMD — always read from RDS
- RDS files are the **source of truth** for plot data

### Chunk Options for Plotly
```r
#| echo: false
```
No `fig-width`/`fig-height` needed — plotly manages its own sizing via the `height` parameter.

### Plotly Gotchas (Lessons Learned)

| Gotcha | Symptom | Fix |
|--------|---------|-----|
| **Categorical Y axis + `add_segments()`** | Vertical/horizontal reference lines don't appear | Use `layout(shapes = list(...))` with `yref = "paper"` (paper coordinates 0–1 span full axis) |
| **Color mapping mismatch** | Traces don't render (blank plot) | `colors = c("name" = color)` requires EXACT string match with data column values — check with `unique(df$col)` |
| **RevealJS auto-stretch** | Plotly widget squished to ~200px tall | Add `.reveal .slide .plotly.html-widget { height: 650px !important; }` in YAML CSS |
| **Missing RDS data** | `Error: object 'x' not found` at render | Every R script must save ALL data frames needed for plotly to RDS — not just model objects |
| **Group name drift** | Plot shows wrong legend or missing traces | Create a `group_short` column with clean, short names before passing to `plot_ly(color = ~group_short)` |

### Love Plot Pattern (Horizontal Dot Plot with Reference Lines)
For balance/covariate love plots with categorical Y axis, reference lines at ±0.25 MUST use `layout(shapes = ...)`:

```r
plot_ly(balance_data,
        y = ~reorder(variable, abs(std_diff)), x = ~std_diff,
        type = "scatter", mode = "markers",
        marker = list(size = 12, color = emory_blue)) %>%
  emory_plotly_layout(title = "Covariate Balance", xtitle = "Standardized Difference") %>%
  layout(shapes = list(
    list(type = "line", x0 = -0.25, x1 = -0.25, y0 = 0, y1 = 1,
         yref = "paper", line = list(dash = "dash", color = gray_medium, width = 1)),
    list(type = "line", x0 = 0.25, x1 = 0.25, y0 = 0, y1 = 1,
         yref = "paper", line = list(dash = "dash", color = gray_medium, width = 1)),
    list(type = "line", x0 = 0, x1 = 0, y0 = 0, y1 = 1,
         yref = "paper", line = list(color = gray_medium, width = 0.5))
  ))
```

---

**Common Quarto-specific issues:**
- Fragment breaks layout: missing blank lines around `. . .`
- Tabset doesn't render: missing blank line before `:::`
- Math not rendering: unescaped `$` or `|` in table cells near math
- SVG path wrong after deployment: use `sync_to_docs.sh`, not manual copy
- **Inline math boundary error (`2$$2`):** In Beamer, `2$\times$2` works fine. In Quarto/Pandoc, the adjacent `$` delimiters merge into `$$` (display math), producing broken output. **Always use a single math span:** `$2 \times 2$`, not `2$\times$2`. This applies to ANY pattern where non-space characters are directly adjacent to both sides of a `$...$` span.
- **PDF figures are INVISIBLE in browsers:** Quarto renders `.pdf` image refs as `<embed data-src="...pdf">` which browsers cannot display inline. **Always convert PDFs to SVG first** (`pdf2svg input.pdf output.svg`) and reference only `.svg` files. This is the #1 cause of missing figures in Quarto slides.
- **Phantom CSS slides:** Never put CSS in a `` ```{=html} `` raw block in the QMD body — it creates a visible empty slide. Always use `include-in-header` in the YAML frontmatter to inject CSS into `<head>`.

---

## CRITICAL: Overflow Prevention (Mandatory)

**EVERY slide must fit within 1600×900 viewport with 5% margins.** This is non-negotiable.

### Before Creating/Modifying Any Slide

Count the vertical elements:
- Title (1 line = ~60px)
- Each bullet point (~40px with spacing)
- Each display equation `$$...$$` (~80-100px)
- Each box (methodbox/keybox/eqbox) (~100-150px minimum + content)
- Each SVG/image (~300-500px at 85% width)
- Each plotly chart (580px with current CSS)

**Total available: ~750px** (900px viewport minus title, margins, padding)

### Maximum Content Per Slide

| Content Type | Safe Maximum |
|--------------|--------------|
| Bullet points (no boxes) | 6-7 items |
| Bullet points + 1 box | 3-4 items + box |
| Display equations | 3 equations max |
| Box + equation below | 1 box + 1 equation + 2 bullets |
| Two-column layout | 4 bullets per column max |
| **Plotly chart** | **Chart ONLY — NO text below** |

### When a Slide Overflows: Priority Order

1. **Consolidate bullets** — combine 2-3 related points into 1
2. **Negative margins** — `style="margin-top: -0.3em;"` on boxes/equations
3. **Remove blank lines** — between list items
4. **Convert bullets to paragraph** — for explanatory text
5. **Reduce image width** — from 85% to 75% to 70%
6. **Split into two slides** — last resort, but effective

### NEVER:
- Use `font-size: 0.8em` or smaller to "fit" content
- Stack more than 2 boxes on one slide
- Have more than 3 display equations on one slide
- **Add ANY content below plotly charts** — move insights to the chart title instead
- **Shrink plotly chart height** — remove surrounding content instead

### Plotly Slides: NO Content Below Charts (CRITICAL)

**Plotly charts MUST be the ONLY content on their slides.** Do NOT add:
- Bullet points below the chart
- Gray annotation text below the chart
- Any explanatory paragraphs

**Why:** Plotly charts at 650px height fill the viewport. Any additional content causes scrolling, which is NEVER acceptable.

**Solution:** Move all annotations/insights into the plotly TITLE. Examples:
- Bad: `title = "ATT Estimates"` + bullets below
- Good: `title = "ATT Estimates — all negative, wide CIs reflect limited power"`

Every QMD with plotly charts MUST have this CSS in YAML:
```css
.reveal .slide .plotly.html-widget {
  height: 650px !important;
}
```

**NEVER shrink plotly charts to fit text.** Remove the text instead.
