# Rate-limited API

**Use guided practice.** Follow the [framework](../../FRAMEWORK.md), with one question at a time.

## The prompt

Protect one API endpoint from excessive requests by an identified user.
Start with one application server. Explain unfamiliar limit and counter concepts before the learner chooses a design.

## Constraints, given up front

- Each request already has a verified user ID. Authentication is outside this exercise.
- Allow up to 100 requests per user in each fixed calendar-minute window.
- Excess requests receive a clear error and information about when the user can retry.
- Treat the fixed-window rule as an initial simplification. Record its boundary behavior as a tradeoff.
- Keep one server, one endpoint, and one common limit in the first attempt.

## What to produce

1. `attempt.md` — your decisions, assumptions, and open questions.
2. `attempt.png` — your sketch.

Short explanations, videos, and small examples can help before application.
Keep your own attempt before the full reference solution for this exercise.
Use the [attempt template](../../ATTEMPT-TEMPLATE.md) as a guide. Resume existing artifacts instead of a forced restart.

## First-pass discussion

- Where does the limit check occur, and where does its state live?
- How does the design distinguish users and time windows?
- What does the client receive after it exceeds the limit?
- Explain two choices with tradeoffs and one failure case. The shared framework defines the stopping rule.

## One complication

Add a second application server. Both servers must enforce the same user allowance.
Ask the learner what changes before you suggest a shared store or another solution.

## Optional later revisit

The earlier prompt assumed 1,000 API servers, different limits per API key, and less than 5 ms of added latency.
Save those constraints, algorithm comparisons, and a counter-store outage policy for a later revisit.
They are not requirements for this first pass. Follow the [exercise index](../../EXERCISES.md) before you expand the scope.
