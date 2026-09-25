# Background thumbnail service

**Use guided practice.** Follow the [framework](../../FRAMEWORK.md), with one question at a time.

## The prompt

Accept a job that creates a thumbnail from an existing photo. Let the caller check its status and retrieve the result.
Reuse the photo-upload scenario without a requirement to implement it first.
Explain queues, workers, and retries before the learner applies them.

## Constraints, given up front

- Start with one API server, one worker, and modest traffic.
- The original photo already exists. Requests contain a verified owner ID.
- The caller receives a job ID without a wait for the finished thumbnail.
- The caller can ask whether the job is queued, active, complete, or failed.
- The caller can retrieve the thumbnail after success.
- Exclude multiple regions, priority queues, and large-scale capacity calculations from the first pass.

## What to produce

1. `attempt.md` — your decisions, assumptions, and open questions.
2. `attempt.png` — your sketch.

Short explanations, videos, and small examples can help before application.
Keep your own attempt before the full reference solution for this exercise.
Use the [attempt template](../../ATTEMPT-TEMPLATE.md) as a guide. Resume existing artifacts instead of a forced restart.

## First-pass discussion

- What happens between the API response and completion of the job?
- Where does the client get the job status and result?
- Explain two choices with tradeoffs and one client-visible failure.

## One complication

A worker creates the thumbnail, then fails before it records completion.
Explain duplicate delivery and idempotency if unfamiliar. Ask how the learner would retry without an unwanted duplicate effect.
Do not promise that a job can never execute twice. Define which effects must remain safe after a retry.

## Optional later revisit

The earlier prompt assumed 500,000 jobs per day, bursts, and job durations from 200 ms to four minutes.
Retain those scenarios for later capacity work, queue separation, retry limits, and operational signals.
They are not first-pass requirements. This folder keeps its existing name; follow the [index](../../EXERCISES.md) for exercise order.
