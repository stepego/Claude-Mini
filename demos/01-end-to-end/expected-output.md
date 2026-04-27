# Expected Output (Demo 1 Answer Key)

After the live demo runs `/improve-manuscript-section` (or analogous prompt) on
`manuscript-section.tex`, the multi-agent review fanout should produce these findings:

## proofreader agent

- **Sentence 2 of paragraph 2** (line ~24): "We use the staggered timing of state minimum-wage increases ... exploiting variation across counties along the borders of states with differing minimum-wage trajectories."
  - **Issue:** sentence is too long; mixes design (DiD) with mechanism (border-county variation).
  - **Suggested fix:** split into two sentences. "We use the staggered timing of state minimum-wage increases between 2014 and 2022 to estimate the effect on small-business formation. Identification comes from variation in minimum wages across counties straddling state borders."

## domain-reviewer agent (causal-inference lens)

- **Paragraph 3** (controls list): no mention of **state-level economic cycles** as a control.
  - **Issue:** staggered DiD on state-level treatment without state-cycle controls is biased if treated states adopt minimum-wage increases counter-cyclically (which they do, per Cengiz et al. 2019).
  - **Suggested fix:** add state-level unemployment trends + state-year fixed effects. Or acknowledge the limitation explicitly.

## claim-verifier agent (Chain-of-Verification)

- **Citation in paragraph 1**: "Card1994" → "minimum wage increases reduce employment and entrepreneurship."
  - **Issue:** Card & Krueger (1994, AER) found NO employment-reducing effect of minimum wage in their NJ–PA study. The cited interpretation is the classical THEORETICAL prediction (textbook), not what Card & Krueger empirically found.
  - **Verdict:** FAIL — claim contradicts source.
  - **Suggested fix:** Either change the citation (to a textbook reference for the theoretical prediction) or change the claim attribution ("Card & Krueger (1994) famously found no such effect, contrary to the textbook prediction").

## Quality score (target)

- After fixes applied: ≥ 88 / 100. Target ≥ 85 to clear the demo.

## What audience should see

The agent identifies all 3 planted issues. The verifier flags the misattribution **without
having seen the original prompt** (fresh-context CoVe pattern). All three findings come
from different agents — illustrating the multi-agent value proposition.
