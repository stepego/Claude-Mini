# Expected Discrepancies (Answer Key)

This file documents the planted bug so future maintainers can verify the demo still
demonstrates correctly after any updates.

## The planted bug

`analyze.R` line ~18 includes `filter(year < 2020)` to drop COVID-era observations.
The manuscript's sample-construction paragraph and Table 2 column (3) reflect the
**superset** N (14,562 — without the COVID exclusion).

When the script is run as-is, it produces N = 14,489 (with COVID excluded).

## Expected audit output

3 PASS:
- C1 — ATT = 3.2 pp, SE = 0.083 (matches; pre-COVID years dominate the estimate so the point estimate barely shifts at 3 decimals)
- C3 — R² = 0.31 (matches at 2 decimals)
- C4 — first-stage F-stat > 25 (matches; F = 32.1)

1 FAIL:
- C2 — N: manuscript 14,562, script 14,489 (exact-match fail)

## What the agent should suggest

Two options to resolve:
- (a) Update the manuscript text + Table 2 N to 14,489 + add a sentence about excluding 2020+ county-years (COVID-related disruption to BFS data quality).
- (b) Remove the `year < 2020` exclusion in `analyze.R` line 18 and re-run; report robustness in the appendix.

The agent should NOT pick one. It should surface both options.
