# Manuscript Claims to Audit

This is a stripped-down version of the relevant section of a working paper.
The 4 numerical claims are extracted below for the auditor.

---

## Sample construction (manuscript, section 3.2)

> "Our analysis sample consists of US-listed firms in Compustat from 2010 to 2022,
> with at least three years of consecutive observations. The final sample contains
> **14,562 firm-years**."

## Main result (manuscript, Table 2 col 3)

> "Column (3) reports our preferred specification with firm + year fixed effects
> and clustered standard errors at the firm level."

| Statistic | Value |
|-----------|-------|
| Treatment effect (ATT) | **-0.247** |
| Standard error (SE)    | **0.083** |
| N (observations)        | **14,562** |
| R²                      | **0.31** |

## First stage (manuscript, section 4.2)

> "The first-stage F-statistic exceeds 25, well above conventional weak-instrument
> thresholds (Stock and Yogo 2005)."

---

## Claims for audit

| ID | Claim | Source location | Tolerance |
|----|-------|-----------------|-----------|
| C1 | ATT = -0.247 (SE 0.083) | Table 2 col (3) | 4 decimals |
| C2 | N = 14,562 | Table 2 col (3) | exact |
| C3 | R² = 0.31 | Table 2 col (3) | 2 decimals |
| C4 | First-stage F > 25 | Section 4.2 | numeric > 25 |
