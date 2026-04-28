# Pre-Flight Checklist — Day-Of Notre Dame Watch-Along

Print this. Carry it. Run through every checkpoint.

---

## T-7 days

### Tech
- [ ] All slides rendered to HTML; tested in Safari + Chrome (some fonts differ)
- [ ] All 5 live demos rehearsed end-to-end on the **actual presentation laptop**, twice in a row, no manual intervention beyond choreographed commands
- [ ] All 5 demo bundles' `expected-*.md` files reviewed; verbal narration practiced (no video fallbacks — by design)
- [ ] Backup laptop fully configured (same Claude version, same `Claude-Mini` clone, same `claude-code-my-workflow` pin, same Quarto extension)
- [ ] `claude /status` confirms logged in on **both** laptops
- [ ] Anthropic plan tier still grants auto mode (test with `claude --permission-mode auto`)

### Content
- [ ] CHANGELOG of `claude-code-my-workflow` shows v1.8.0 (no v1.8.1 prerequisite for this talk; AER profile already ships)
- [ ] Deck final renders cleanly with `quarto render` — no warnings
- [ ] All 6 demo READMEs reflect actual choreography (post-rehearsal)
- [ ] Speaker-notes `full-script.md` written from what worked in dry-runs
- [ ] Handouts printed: `exercises/skill-template.md` (1 page) + sample-use-cases (2 pages) — N copies for expected attendees + 5 spare

### Logistics
- [ ] Notre Dame venue contact confirmed: room, time, projector type (HDMI vs USB-C), Wi-Fi credentials, mic setup
- [ ] Travel logistics: flight, ground transport from airport, hotel, walking time to venue
- [ ] Confirmation that talk WILL be recorded (and consent if so) OR will not (and adjust live-demo timing accordingly — recordings tighten the choreography)

---

## T-1 day

### Tech
- [ ] `git pull` on both laptops for `Claude-Mini` and `claude-code-my-workflow`
- [ ] **Don't pull anything new** — pin to known-good versions (yesterday's `git log` SHA noted below)
- [ ] Re-run `quarto render` on the deck. **Verify no rendering changes from last week's version.** If anything changed: investigate.
- [ ] Verify `claude /status` on both machines
- [ ] Charge both laptops to 100% overnight
- [ ] Test the actual presentation: open the deck, advance to Part 5, run `/audit-reproducibility` on the demo material — does it produce the planted-discrepancy output?
- [ ] Same test for Demo 5a (`/review-paper --peer AER`)
- [ ] All `expected-*.md` files (in `demos/<id>/`) accessible offline; verbal narration rehearsed for at least one demo (Demo 4 or 5).

### Pinned versions (record before bed)
- `claude-code-my-workflow` SHA: ____________________
- `Claude-Mini` SHA: ____________________
- `claude` CLI version: ____________________
- Quarto version: ____________________
- R version: ____________________

### Pack
- [ ] Both laptops + chargers (USB-C, MagSafe, whatever applies)
- [ ] HDMI adapter + USB-C adapter (Mendoza projectors are usually HDMI but pack both)
- [ ] Mouse (optional — speaker preference)
- [ ] Water bottle, small snack (4-hour talk)
- [ ] Printed handouts in a folder (count + 5 spare)
- [ ] Phone charger (cell-tower hotspot fallback if Wi-Fi dies)
- [ ] Printed copy of `timing-targets.md` (this directory)
- [ ] Printed copy of this checklist

---

## T-30 min on-site

- [ ] Arrive at venue. Locate AV person if available.
- [ ] Connect to projector. Test resolution (deck is 1600×900 — verify projector accepts).
- [ ] Test color profile — Emory blue + Anthropic orange should both render correctly.
- [ ] Connect to Wi-Fi. Run a speed test (target: > 10 Mbps for live demos).
- [ ] Open the deck in Safari (or Chrome — whichever rendered cleaner in dry-runs).
- [ ] Open `demos/05-peer-review/expected-decision.md` in a side-pane — **the most-likely-to-fail demo gets pre-staged verbal fallback**.
- [ ] Set up backup laptop next to main: mirrored deck, same demo materials, ready to swap if main fails.
- [ ] Quick mic test — voice level check.

---

## T-5 min

- [ ] Water bottle within reach.
- [ ] Phone on silent.
- [ ] Mental rehearsal of opening 5 minutes:
  - "I had a working paper rejected once because a single number..."
  - "Three things changed in the last 18 months..."
  - "What I'm not going to do..."
  - "What I am going to do..."
  - First slide on screen.
- [ ] Deep breath. **The first 5 minutes set the tone.**

---

## T-0

Ship it.

Open with the personal anecdote. Don't read slides — *talk to faculty*. Watch their faces; if they're disengaging, slow down on examples. If they're tracking, push pace.

You've rehearsed this twice end-to-end. Trust the rehearsal. The demos either work or you switch to recording — both outcomes are fine.

---

## Mid-talk failure modes (if-then)

| Failure | Action |
|---------|--------|
| Wi-Fi dies | Hotspot from phone (have credentials saved). All `expected-*.md` files are local — verbal fallback works offline. |
| Projector hiccup | Backup laptop is mirrored; swap. Continue from where you left off. |
| Demo stalls past abort point | Switch to the demo's `expected-*.md` file (already in a side-pane). Narrate verbally what the agent would have produced. Concrete + lower-risk than a video that might lose audio sync. |
| Audience confused | Pause. Ask: "show of hands — does the orchestrator-loop diagram make sense?" Re-explain if not. **Better to lose 2 min on clarity than 30 min on confusion.** |
| Audience hostile to a claim | Acknowledge, don't argue. "That's a legitimate concern — let me come back to it in Part 7's honesty section." Move on. |
| Running long at break point | Cut Part 7's optional Demo 6 (cross-tool). Cut Part 6's Demo 5b length (narrate). Keep the headlines. |
| Running short | Spend extra time in Q&A. **Don't add material.** Q&A builds adoption; new material confuses. |

---

## After

- [ ] Thank Notre Dame contact.
- [ ] Collect business cards / emails of interested faculty.
- [ ] Within 48 hours: send follow-up email with `Claude-Mini` repo link + a personal "happy to chat about adoption" line.
- [ ] Within 1 week: post-mortem note in `Claude-Mini/speaker-notes/post-mortem-2026-04-XX.md` (what worked, what didn't, what to change for the next venue).

---

## Final reminder

**You've spent ~3 weeks preparing this. The talk is ready.** The faculty are either going to want to adopt this or they're not — your job is to give them the clearest possible view of what the workflow does, not to convince them. Be honest about limits. Show, don't sell.

**The talk is the talk. You're prepared. Go give it.**
