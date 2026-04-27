# Sample Use Cases for the Part 3 Hands-On

Pick one of these, or use your own. Goal: 10 minutes to draft a skill sketch on the worksheet.

---

## 1. Finance — `jf-submission-formatter`

**Problem.** I produce regression tables in different ways across drafts. Each JF submission round, I spend 90 minutes reformatting tables to JF style.

**Trigger.** "format my regression tables for JF", "JF submission tables", "apply JF style to results".

**Workflow.**
1. Read the regression results from `results/*.rds`.
2. Apply JF style: clustered SE, three-decimal coefficients, sig stars at 0.10/0.05/0.01, R² and N at the bottom.
3. Write LaTeX tables to `tables/jf/` and link them in the manuscript.

**Verification.** Confirm every table has clustered SE annotation in the notes line; refuse to write if missing.

---

## 2. Accounting — `restatement-sample-memo`

**Problem.** Every accounting paper using Audit Analytics restatement data needs a sample-construction memo for the methods appendix. I write the same memo every time.

**Trigger.** "build sample memo from Audit Analytics", "restatement sample construction memo".

**Workflow.**
1. Read `data/audit_analytics_raw.rds`.
2. Apply our sample filters (US-listed, 2010-2022, non-financial); count exclusions step by step.
3. Write a numbered exclusion table + a 2-paragraph methods appendix block.

**Verification.** Refuse if any filter step drops > 50% in one cut without comment.

---

## 3. Econ — `referee-letter-parser`

**Problem.** Referee reports come in as one long PDF or email. I waste time turning them into a structured todo list.

**Trigger.** "parse this referee report", "structure the referee comments", "todo from referee".

**Workflow.**
1. Read the referee text.
2. Identify each numbered concern. Classify: methods / interpretation / writing / additional analyses / disagree.
3. For each: write `[Concern N] [Type] [Severity 1-3] [Specific ask] [Where to address it]`.

**Verification.** Refuse if no numbered concerns found (probably not a referee report).

---

## 4. Teaching — `grading-rubric-applier`

**Problem.** I apply the same 5-criterion rubric to ~40 student papers. Consistency drift across the stack is a pain.

**Trigger.** "grade with my rubric", "apply rubric to this submission", "score this student paper".

**Workflow.**
1. Read the submission + the rubric (`teaching/rubric_econ730.md`).
2. For each criterion: assign 1-5 + write a one-sentence justification.
3. Aggregate to a letter grade per the rubric weights. Append a 2-paragraph constructive comment.

**Verification.** Refuse to give an A if 2+ criteria are below 4.

---

## 5. Admin — `letter-of-support-draft`

**Problem.** Every March I write 4-6 letters of recommendation. Same structure every time, but I never have a template.

**Trigger.** "draft letter of support for [name]", "recommendation letter draft".

**Workflow.**
1. Read `students/<name>.md` (a per-student notes file).
2. Read the program description (target program / job / fellowship).
3. Generate a 1.5-page letter: opening (relationship), 2-3 specific evidence paragraphs (citing the notes file), closing (calibrated to program).

**Verification.** Refuse if `students/<name>.md` doesn't exist (no notes, no letter).

---

## 6. Your own

Use the worksheet to draft a skill for a task **you do at least 3 times a year**. Examples I've seen work well:

- Quarterly research-update memo to a co-author
- IRB protocol drafter (template + study-specific edits)
- Conference-proposal scaffolder
- Budget justification generator for grant applications
- Course-feedback summary memo (per semester)

Don't pick something you do once a year. Pick something you do *enough* that the leverage compounds.
