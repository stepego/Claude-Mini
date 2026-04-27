# Expected Editorial Decision (Answer Key)

This file documents the expected output of `/review-paper --peer AER` on the
sanitized `manuscript-snippet.tex`. Used by future maintainers to verify the
demo still produces a teaching-clear flow.

## Expected disposition selection

The AER profile (shipped in v1.8.0) weights:
- CREDIBILITY: 0.30 (high — AER is methods-skeptical, post-Angrist-Pischke)
- POLICY: 0.25 (high — AER cares about practical/external relevance)
- STRUCTURAL: 0.15
- MEASUREMENT: 0.15
- THEORY: 0.05
- SKEPTIC: 0.10

Most-likely pair: **CREDIBILITY + POLICY**. Backup: **CREDIBILITY + SKEPTIC**.

## Expected major concerns

Per the planted weaknesses in `manuscript-snippet.tex` (a staggered-DiD
application on Medicaid expansion and small-business formation):

**Domain (CREDIBILITY) referee should flag:**
1. Pre-trends figure mentioned but not shown in the snippet — *what would change my mind: a 5-year pre-trends figure with confidence bands using Callaway-Sant'Anna ATT(g,t) by event-time.*
2. Sample restriction (counties with ≥ 5 years of pre-treatment data) without justification — *what would change my mind: robustness check including counties with shorter pre-periods, or a sentence justifying the restriction.*

**Methods (POLICY) referee should flag:**
1. Effect magnitude (3.2% increase in small-business formation rate) is hard to interpret in absolute terms — *what would change my mind: back-of-envelope conversion to absolute number of new businesses formed nationwide.*
2. External validity to non-Medicaid contexts not addressed — *what would change my mind: one paragraph on whether the result extends to other public-health-insurance expansions or only to ACA-style Medicaid.*

## Expected editorial classification

- **FATAL:** none expected (the paper is well-constructed; needs revision)
- **ADDRESSABLE:** all 4 major concerns above — clear revision plan
- **TASTE:** likely 1-2 minor concerns about framing or related-work positioning

## Expected decision

**Major Revision** with a revision plan that maps each ADDRESSABLE concern
to a specific test or explanation.

If the demo produces "Reject" — something is wrong with the snippet calibration.
If it produces "Minor Revision" — the planted concerns may be too subtle.
