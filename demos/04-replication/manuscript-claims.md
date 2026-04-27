# Manuscript Claims to Audit

This is a stripped-down version of the relevant section of a working paper.
The 4 numerical claims are extracted below for the auditor.

The substrate is a staggered DiD application on Medicaid expansion and
small-business formation rates.

---

## Sample construction (manuscript, section 3.2)

> "Our analysis sample consists of US counties from 2009 to 2022, with at least
> five years of pre-period data and observable Census Business Formation Statistics
> (BFS) coverage. The final sample contains **14,562 county-year observations** across
> 2,891 counties."

## Main result (manuscript, Table 2 col 3)

> "Column (3) reports our preferred Callaway-Sant'Anna (2021) ATT(g,t) specification
> aggregated to a five-year-horizon average treatment effect, with state-level
> clustered standard errors."

| Statistic | Value |
|-----------|-------|
| Treatment effect (ATT, percentage points) | **3.2** |
| Standard error (SE)    | **0.083** |
| N (county-year observations) | **14,562** |
| R²                      | **0.31** |

## Robustness (manuscript, section 4.2)

> "We also report a placebo IV specification in the robustness section; the
> first-stage F-statistic exceeds 25, well above conventional weak-instrument
> thresholds (Stock and Yogo 2005)."

---

## Claims for audit

| ID | Claim | Source location | Tolerance |
|----|-------|-----------------|-----------|
| C1 | ATT = 3.2 pp (SE 0.083) | Table 2 col (3) | 4 decimals |
| C2 | N = 14,562 | Table 2 col (3) | exact |
| C3 | R² = 0.31 | Table 2 col (3) | 2 decimals |
| C4 | First-stage F > 25 (placebo IV) | Section 4.2 | numeric > 25 |
