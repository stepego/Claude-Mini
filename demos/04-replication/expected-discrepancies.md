# Expected Discrepancies (Answer Key)

This file documents the planted bug so future maintainers can verify the demo still
demonstrates correctly after any updates.

## The planted bug

`analyze.R` line ~18 includes `& industry != "financial"` in the sample-construction
filter. The manuscript's sample-construction paragraph and Table 2 column (3) reflect
the **superset** N (14,562 — without the financial exclusion).

When the script is run as-is, it produces N = 14,489 (with the financial exclusion).

## Expected audit output

3 PASS:
- C1 — ATT = -0.247, SE = 0.083 (matches; financial firms are ~0.5% of sample, doesn't materially shift the point estimate at 3 decimals)
- C3 — R² = 0.31 (matches at 2 decimals)
- C4 — first-stage F-stat > 25 (matches; F = 32.1)

1 FAIL:
- C2 — N: manuscript 14,562, script 14,489 (exact-match fail)

## What the agent should suggest

Two options to resolve:
- (a) Update the manuscript text + Table 2 N to 14,489 + add a sentence about excluding financial firms.
- (b) Remove the financial exclusion in `analyze.R` line 18 and re-run.

The agent should NOT pick one. It should surface both options.
