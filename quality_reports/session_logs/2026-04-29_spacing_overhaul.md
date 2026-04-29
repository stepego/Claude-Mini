# Spacing overhaul + bullet conversion sweep — 2026-04-29

User reported visible overflow on slides 6, 12, 14 plus wanted (a) more even bullet spacing, (b) bullets favored over long paragraphs, (c) zero overflow.

## SCSS changes (`Quarto/claude-mini.scss`)

| Selector | Before | After |
|---|---|---|
| `.reveal ul li` margin-bottom | `0.35em` | **`0.95em`** (2.7× more) |
| `.reveal ol li` margin-bottom | `0.35em` | **`0.95em`** |
| `.reveal ul/ol` outer margins | `0.5em` | `0.9em` |
| `.reveal ul li` line-height | `1.4` | `1.55` |
| `.reveal ul ul li` margin-bottom | `0.25em` | `0.55em` |
| `.compact ul li` margin-bottom | `0.25em` | `0.7em` (2.8× more) |
| `.compact p` margins | `0.4em` | `0.6em` |
| `.smaller ul li` margin-bottom | `0.25em` | `0.7em` |
| `.smaller` line-heights | `1.35` | `1.5` |
| `.reveal .slides section` overflow | (visible) | **`hidden`** safety net |

## QMD structural fixes

**Phantom slide / audit fixes from earlier round:** L1186 `##` → `#`, wide-table wrap (L181), `.compact` adds (L285/L323/L920), `auto-animate` (L1451), `.smaller` on tall-diagram slides (L1546/L1874).

**`.compact` → `.smaller` (gives 17% more vertical room + breathing):**
- "How you get better at this" (L86)
- "Hooks: deterministic enforcement" (L521)
- "/deep-audit — multi-agent orchestration" (L1190)
- "Why this works for me" (L1223)
- "What the rule enforces" (L1382)
- "If you want to try this" (L1496)
- "A small story from this week" (L2010)

**Trimmed ASCII flow diagrams:**
- "The shape of what's coming" (L1548) — 25 lines → 17 lines
- "How they connect" (L1874) — 19 lines → 12 lines

**Long closing paragraphs converted to bullets (16 conversions):**
- "How you get better at this" — 4-sentence closing → 2 bullets
- "What we're going to do today" — 3-bullet conversion
- "Where I think this might land" / "What I'll be doing" — Andrews-quote paragraph → 3 bullets
- "What this talk uses" — Cursor/Aider/continue.dev → 3 bullets
- "Length budget" — Gloaguen evidence paragraph (530 chars) → 4 bullets
- "Why this works for me" — closing paragraph → 2 bullets
- "If you want to try this" — closing → 2 bullets
- "A small story from this week" — closing → 2 bullets
- "Effective trigger descriptions" — `/preregister` story → 3 bullets
- "Skills vs MCPs" — closing (250 chars) → 3 bullets
- "Where everything fits" — mental-shortcut sentence → 4 parallel bullets
- "Cumulative leverage" — closing 235+130 char paragraphs → 4 bullets
- "Pattern 3: fresh-context verification (CoVe)" — 295-char anecdote → 3 bullets

## Final overflow analysis

Pixel-budget Python estimator on 167 content slides under new generous spacing:

- **0 RISKY (≥700px)**
- **2 TIGHT (600-700px):** "The shape of what's coming" (635px), "Where everything fits" (625px) — both still safely under viewport
- **165 OK (<600px)**

Started this session with user reporting visible overflow + 10 estimator-flagged slides. Ended with 0 RISKY, 2 TIGHT, none over 650px.

## Notes for future me

- The `overflow: hidden` rule on `.reveal .slides section` is a hard belt-and-suspenders — even if a future edit adds too much content, audience will never see text past the slide border (it'll be clipped instead).
- `.smaller` is now the right class for dense slides (was `.compact` before; `.compact` is for moderate density now).
- User strongly prefers generous bullet spacing. Don't dial it back below 0.7em (compact) or 0.9em (default).
- When converting paragraphs to bullets: only do it when paragraph has 2+ distinct ideas. Short rhetorical hammers should stay as paragraphs.
