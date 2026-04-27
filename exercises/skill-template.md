# Sketch Your Skill — 1-Page Worksheet

Pick a use case. Don't try to make it run. Just sketch.

---

## 1. Name (kebab-case, 2-4 words)

```
.claude/skills/____________________/SKILL.md
```

---

## 2. Description (1 sentence + trigger phrases)

What does it do? When should it trigger?

```
description: ___________________________________________________________

Use when user says "____________", "____________", "____________".
```

---

## 3. Inputs

What does it need to start? (file path, free-text description, both?)

```
argument-hint: "_____________________________________________________"
```

---

## 4. Three-step body

### Phase 1 — _____________________________________________________

What does the agent read / collect / verify?

> ___________________________________________________________

### Phase 2 — _____________________________________________________

What's the main action?

> ___________________________________________________________

### Phase 3 — _____________________________________________________

What's the verification + output?

> ___________________________________________________________

---

## 5. Output

Where does the result go? What format?

```
quality_reports/___________/_____________________________.____
```

---

## 6. Refusal conditions (optional but recommended)

When should the skill refuse to run?

- ___________________________________________________________
- ___________________________________________________________

---

## After the talk

If your sketch is good, the next step is `~30 minutes` to turn it into a real `SKILL.md`. The template at
[`templates/skill-template.md`](https://github.com/pedrohcgs/claude-code-my-workflow/blob/main/templates/skill-template.md)
in `claude-code-my-workflow` walks you through it.
