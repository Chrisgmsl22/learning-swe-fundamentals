# Update the study schedule

Status: complete

## Problem and scope

Christian approved the revised schedule in this chat on 2026-10-26. Update SCHEDULE.md and site/schedule.html, then align current scheduling guidance in CLAUDE.md, PROGRESS.md, system-design/FRAMEWORK.md, and system-design/REVIEW-QUEUE.md. Preserve historical session records and AGENTS.md as a relative symlink to CLAUDE.md. Do not edit the sibling expense tracker or DSA repo.

## Planning gate

- Small content update with established layout. No design discussion needed.
- User authorized implementation after reviewing the preview and correcting Thursday and Friday.
- No effort estimate needed; browser verification and independent review follow implementation.

## Acceptance criteria

- Weekday 17:00 to 18:00 remains a window for 3 DSA reps; stop when done.
- Monday and Wednesday 18:00 to 19:00 become job application slots.
- Tuesday and Thursday 18:00 to 19:00 are new DSA problem slots. Preserve their existing optional nature; cadence is now 2 new problems weekly.
- Monday and Wednesday system design stay 20:00 to 20:45.
- Friday system design at 18:00 to 18:45 is optional. No catch-up requirement. Every-third-Friday revisit applies only when attending, with no extra slot.
- Friday personal project starts around 21:00. Duration is unspecified. It is Fast Expense Tracker, separate from Sunday LLD. AI integration is a learning direction, not a newly required feature or another track.
- Tuesday and Thursday LLD stay 20:00 for 40 minutes. Sunday is a small hand-written Python LLD build, 60 to 90 minutes, as in the approved preview. Thursday bounds one finishable behavior. Do not claim Sunday builds have been completed.
- Saturday stays off and dinner stays 19:00 to 20:00. Work-hours AI practice creates no added evening quota.
- Remove stale current claims of Friday evenings free, mandatory Friday attendance, 3 new DSA problems, and an unchanged 9 to 10 hour total. If providing a total, show assumptions and exclude unknown project duration and optional Friday. Do not inflate 3 reps into a whole-hour quota.
- HTML table, legend, explanatory cards, footer and day-specific summaries agree with the written schedule. Keep the light layout, with understandable styling for job applications and personal project.

## Approach and checks

- Checkout was clean before this task. Record HEAD in results. Task boundary is the 6 files above plus this brief.
- Inspect diff, search for contradictory current schedule claims, check HTML script syntax and day text.
- Use headless Playwright for desktop/mobile screenshots; inspect screenshots. Read browser-workflow.md and the playwright-cli skill before browser work. Avoid adding a test suite for static content.
- Existing malformed CSS around track color variables may be minimally corrected if needed to make the new schedule render properly.

## Study boundary

Scheduling maintenance only. Preserve learner evidence, current exercise, next action, and unsolved exercises. Do not invent concept closure or sessions.

## Results and review

- Scope clarification: README.md also repeats the cadence and Friday policy. Align only those schedule summaries with SCHEDULE.md; this is necessary to fulfill the approved update. Final boundary is 7 existing files plus this brief.

- Agent models: coordinator uses inherited runtime; implementer and reviewer gpt-6-luna, medium, per model policy for small changes. No escalation.
- Starting HEAD: `2dc2ac0`.
- Verification: `git diff --check` passed; stale schedule-claim search returned no matches in the seven scoped files, including README.md; `AGENTS.md` remains a relative symlink to `CLAUDE.md`. Headless Playwright loaded the page at 1280×900 and 390×844, confirmed 7 day rows and expected Monday, Friday, and Sunday content, and confirmed the mobile viewport has no page-level overflow while the table can scroll horizontally. Desktop and mobile full-page screenshots were inspected at `/private/tmp/schedule-desktop-final.png` and `/private/tmp/schedule-mobile-final.png`. Browser console reported only a missing favicon request (404).
- Independent review: no findings. Reviewer inspected all scoped changes and both screenshots; diff whitespace, inline script syntax, and AGENTS.md symlink checks passed. No accepted or rejected findings.
- Repair rounds: 0.
- User interventions: preview corrections incorporated above.
- Open limit: Friday personal project duration is not specified.
