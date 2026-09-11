# 03 · Async job service

**Use guided practice.** Follow the [framework](../../FRAMEWORK.md), with one question at a time.

## The prompt

Design a service that accepts work from an application, runs it in the background, and reports
the outcome. Example jobs: generate a PDF, send an email, call a slow third-party API.

## Constraints, given up front

- 500,000 jobs a day, **with unpredictable spikes**.
- Some jobs take 200 ms. Some take 4 minutes.
- **A job must never run twice** where running twice would be harmful.
- A job that fails must be retried, then eventually given up on.
- The caller wants to ask "is it done yet?"

## What to produce

1. `attempt.md` — your decisions, assumptions, and open questions.
2. `attempt.png` — your sketch.

Short explanations, videos, and small examples can help before application.
Keep your own attempt before the full reference solution for this exercise.
Use the [attempt template](../../ATTEMPT-TEMPLATE.md) as a guide. Resume existing artifacts instead of a forced restart.

## Do not skip

- **How do you stop a job running twice?** Name the mechanism.
- What happens to a job that fails 10 times?
- **How do you know the workers are keeping up?** Name the metric, not "monitoring".
- A 4-minute job and a 200 ms job share a queue. What goes wrong?

*Why this one: it is the closest to the questions you were actually asked, and it forces queues,
retries, idempotency and failure modes together.*
