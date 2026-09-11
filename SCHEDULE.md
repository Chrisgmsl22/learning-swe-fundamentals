# The weekly schedule

**This file is the single source of truth for the study week.** `dsa-tech-prep` points here
rather than keeping its own copy, so the two repos cannot drift.

Set 2026-09-04. Replaces the 2026-08-24 draft, which was paused for the SRE interview.

**Visual version:** `open site/schedule.html` — colour-coded by track, with today highlighted.

---

## The week

| Day | 17:00–18:00 | 18:00–19:00 | 19:00–20:00 | 20:00–20:40 |
| --- | --- | --- | --- | --- |
| **Mon** | 3 DSA reps | 1 new DSA problem | dinner | **System design — attempt** |
| **Tue** | 3 DSA reps | 1 new DSA problem | dinner | **LLD — study one pattern** |
| **Wed** | 3 DSA reps | 1 new DSA problem | dinner | **System design — check** |
| **Thu** | 3 DSA reps | — | dinner | **LLD — sketch Sunday's build** |
| **Fri** | 3 DSA reps | **System design — close one gap** | dinner | **free** |
| **Sat** | **OFF.** Family and friends. Not "off unless something comes up". Off. | | | |
| **Sun** | **LLD build, 1.5–2 hours** | | | |

**Roughly 9–10 hours a week.** The plan is deliberately under capacity. That margin is what keeps
it alive past six weeks — an 11-hour version was drafted once and rejected for that reason.

> **17:00–18:00 is a window, not a quota.**
> The work is **3 reps**, which takes 35–45 minutes. If you finish at 17:40, you stop.
> Do not fill the hour. Filling it is how ~9 hours becomes ~12 and the plan dies.

## The three levels of a day

Say this to yourself when you feel behind.

| Level | Time | What it is |
| --- | --- | --- |
| **Floor** | 35 min | 3 reps, nothing else. On a rough night this is a **win**. The streak survives. |
| **Standard** | ~75 min | 3 reps plus the evening block. |
| **Full** | ~2 h | Adds the new DSA problem. **3 times a week, Mon–Wed** — energy falls across the week, and a new problem is the most expensive task on the board. |

**The new DSA problem is optional by design.** A night at Floor is not a miss.

---

## The three tracks

**Three tracks, not four.** LLD and "organic projects" are the same activity: build the smallest
thing that forces one pattern, by hand, in Python.

| Track | Cadence | Why that slot |
| --- | --- | --- |
| **DSA** | 3 reps daily · 3 new problems a week | A schedule, not a subject. Skipping is what built the backlog. |
| **System design** | 1 design a week, across 3 sessions | Newest track, so the steepest return per hour |
| **LLD / organic projects** | 1 pattern a week · 1 full problem every ~4 weeks | Study Tue, sketch Thu, build Sun |

### System design — the weekly cycle

**One design a week is the usual pace.** Keep the three slots below.
Attempt, evaluation, and gap closure are stages, independent of the weekday.
Continue an unfinished stage in the next slot. Do not add hours or restart the current exercise.
Use [PROGRESS.md](PROGRESS.md) for the next action and [FRAMEWORK.md](system-design/FRAMEWORK.md) for the method.

| Usual slot | What you do | Artifact |
| --- | --- | --- |
| **Mon 20:00–20:40** | **Guided attempt.** Ask questions, state assumptions, and draw your own design. | `attempt.md` and sketch |
| **Wed 20:00–20:40** | **Guided evaluation.** Explain your intent, compare choices, and run the 3×3 sweep. | Questions in `gaps.md` |
| **Fri 18:00–19:00** | **Close one gap.** Apply one concept with numbers and your own diagram. | A concept note |

Short videos, explanations, and small examples can precede application.
Preserve your own attempt before the full reference solution.
Strict silent or timed simulation requires an explicit request. Ask about time only for an explicit timed session.

**Every third Friday**, replace gap closure with a revisit of a design at least three weeks old.
See [REVIEW-QUEUE.md](system-design/REVIEW-QUEUE.md). Keep the same slot and early finish.

### LLD — the weekly cycle

| Session | What you do |
| --- | --- |
| **Tue 20:00** | Study one pattern. What problem it solves, and **what it costs**. |
| **Thu 20:00** | Sketch Sunday's build — the class list and the interfaces, on paper. |
| **Sun** | Build it in Python, by hand, 1.5–2 hours. |

Every ~4 weeks, one full LLD problem that combines several patterns.

---

## The rules

1. **End each session with an artifact or an update.** Apply what an explanation or video taught you.
2. **Saturday is off, and Friday ends early.** Keep the existing rest periods.
3. **Do not add more.** Five Full nights exceed the plan.
4. **Use real questions to select concepts.** The gap list guides depth; the topic map records evidence.

## Repo split

| Repo | Owns |
| --- | --- |
| **`learning-swe-fundamentals`** (this one) | System design · cloud and DevOps fundamentals · the schedule |
| **`dsa-tech-prep`** | LeetCode · LLD · organic projects · the spaced-repetition tracker |
