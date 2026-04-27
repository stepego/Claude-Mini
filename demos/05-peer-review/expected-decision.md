# Expected Editorial Decision (Answer Key)

This file documents the expected output of `/review-paper --peer JF` on the
sanitized `manuscript-snippet.tex`. Used by future maintainers to verify the
demo still produces a teaching-clear flow.

## Expected disposition selection

The JF profile (added v1.8.1) weights:
- CREDIBILITY: 0.25 (high — JF is methods-skeptical)
- POLICY: 0.20 (high — JF cares about practical relevance)
- STRUCTURAL: 0.15
- MEASUREMENT: 0.15
- THEORY: 0.15
- SKEPTIC: 0.10

Most-likely pair: **CREDIBILITY + POLICY**. Backup: **CREDIBILITY + SKEPTIC**.

## Expected major concerns

Per the planted weaknesses in `manuscript-snippet.tex`:

**Domain (CREDIBILITY) referee should flag:**
1. Identification strategy uses a quasi-experimental shock; pre-trends figure not shown — *what would change my mind: pre-trends figure for the 5 years before treatment*
2. Sample restriction excludes financial firms with no justification — *what would change my mind: robustness check including financials, or a sentence on why excluded*

**Methods (POLICY) referee should flag:**
1. Effect magnitude (-0.247 in standardized units) is hard to interpret in dollar terms — *what would change my mind: a back-of-envelope conversion to USD billions of market impact*
2. External validity to non-US firms not addressed — *what would change my mind: one paragraph on why US firms are representative or what would change cross-country*

## Expected editorial classification

- **FATAL:** none expected (the paper is well-constructed, just needs revision)
- **ADDRESSABLE:** all 4 major concerns above — clear revision plan
- **TASTE:** likely 1-2 minor concerns about framing or related-work positioning

## Expected decision

**Major Revision** with a revision plan that maps each ADDRESSABLE concern
to a specific test or explanation.

If the demo produces "Reject" — something is wrong with the snippet calibration.
If it produces "Minor Revision" — the planted concerns may be too subtle.
