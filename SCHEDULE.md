# The weekly schedule

**This file is the single source of truth for the study week.** `dsa-tech-prep` points here
rather than keeping its own copy, so the two repos cannot drift.

Updated 2026-10-26. System design durations were set 2026-09-21.

**Visual version:** `open site/schedule.html` — colour-coded by track, with today highlighted.

## The week

| Day | 17:00–18:00 | 18:00–19:00 | 19:00–20:00 | 20:00 evening block |
| --- | --- | --- | --- | --- |
| **Mon** | 3 DSA reps | Job applications | dinner | **System design — attempt · 45 min** |
| **Tue** | 3 DSA reps | 1 new DSA problem, optional | dinner | **LLD — study one pattern · 40 min** |
| **Wed** | 3 DSA reps | Job applications | dinner | **System design — check · 45 min** |
| **Thu** | 3 DSA reps | 1 new DSA problem, optional | dinner | **LLD — sketch Sunday's build · 40 min** |
| **Fri** | 3 DSA reps | **Optional system design — 18:00–18:45** | dinner | **Fast Expense Tracker personal project, around 21:00; duration not set** |
| **Sat** | **OFF.** Family and friends. Not "off unless something comes up". Off. | | | |
| **Sun** | **Small hand-written Python LLD build, 60–90 min** | | | |

The schedule does not set a weekly hour total. The Friday session is optional, and the Friday
personal project has no set duration. The weekday DSA slot is a window, not an hour-long quota.

> **17:00–18:00 is a window, not a quota.**
> The work is **3 reps**, which takes 35–45 minutes. If you finish at 17:40, you stop.
> Do not fill the hour.

## The evening slots

| Slot | Work |
| --- | --- |
| **Mon and Wed, 18:00–19:00** | Job applications |
| **Tue and Thu, 18:00–19:00** | Optional new DSA problem. Two problems a week if both slots are used. |
| **Mon 20:00–20:45** | System design attempt or resume the current stage |
| **Tue 20:00–20:40** | Study one LLD pattern |
| **Wed 20:00–20:45** | System design check or resume the current stage |
| **Thu 20:00–20:40** | Sketch one finishable behavior for Sunday's build |
| **Fri 18:00–18:45** | Optional system design gap closure or, every third Friday when attending, revisit an older design in this same slot |
| **Fri around 21:00** | Fast Expense Tracker personal project. Duration is not set. AI integration is a learning direction, not a required feature. |
| **Sun** | Small Python LLD build, by hand, 60–90 minutes |

Dinner stays 19:00–20:00. Saturday stays off. AI practice during work hours adds no evening quota.

## The tracks

**LLD and organic projects are one learning track.** Sunday's small Python build gives one pattern a
hand-written application. Every ~4 weeks, it can be a full problem that combines several patterns.
Friday's Fast Expense Tracker is a separate personal project, not another study track.

| Track | Cadence | Why that slot |
| --- | --- | --- |
| **DSA** | 3 reps in the weekday 17:00–18:00 window; up to 2 optional new problems weekly | Stop after the 3 reps. New problems fit Tue and Thu. |
| **System design** | 1 design a week, usually across Mon and Wed; optional Friday practice | The exercise stages can cross slots. Friday may close one gap or revisit an older design. |
| **LLD / organic projects** | 1 pattern a week; small Sunday build, with a full problem about every 4 weeks | Study Tue, bound one behavior Thu, build Sun. |

## System design cycle

Normal system design sessions last **45 minutes**. Attempt, evaluation, and gap closure are stages,
independent of the weekday. Monday and Wednesday are the usual sessions. Friday is optional.

| Usual slot | What you do | Artifact |
| --- | --- | --- |
| **Mon 20:00–20:45** | Guided attempt. State assumptions and draw your design. | `attempt.md` and sketch |
| **Wed 20:00–20:45** | Guided evaluation. Explain your intent, compare choices, and run the 3×3 sweep. | Questions in `gaps.md` |
| **Fri 18:00–18:45, optional** | Close one gap. Every third Friday, if attending, revisit a design instead. | A concept note or revisit record |

Resume unfinished work without adding hours. See the [exercise index](system-design/EXERCISES.md),
[PROGRESS.md](PROGRESS.md), and [FRAMEWORK.md](system-design/FRAMEWORK.md).

## LLD cycle

| Session | What you do |
| --- | --- |
| **Tue 20:00–20:40** | Study one pattern, its purpose, and its cost. |
| **Thu 20:00–20:40** | Sketch one finishable behavior for Sunday's build. |
| **Sun** | Build a small Python LLD problem by hand, 60–90 minutes. |

Do not claim a Sunday build is complete until the learner records it.

## The rules

1. End each session with an artifact or an update.
2. Saturday is off. Dinner stays 19:00–20:00.
3. Do not add work to compensate for an unfinished stage.
4. Use real questions to select concepts. The gap list guides depth; the topic map records evidence.
5. Every third Friday's revisit replaces gap closure within the same optional slot.

## Repo split

| Repo | Owns |
| --- | --- |
| **`learning-swe-fundamentals`** (this one) | System design · cloud and DevOps fundamentals · the schedule |
| **`dsa-tech-prep`** | LeetCode · LLD · organic projects · the spaced-repetition tracker |
