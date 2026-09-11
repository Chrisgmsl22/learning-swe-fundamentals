# 02 · Rate limiter

**Use guided practice.** Follow the [framework](../../FRAMEWORK.md), with one question at a time.

## The prompt

Design a rate limiter that sits in front of a public API and rejects a client that exceeds its
allowance.

## Constraints, given up front

- 1,000 API servers, behind a load balancer.
- The limit is **per API key**, not per IP.
- Different keys have different limits.
- The limiter must add **under 5 ms** to a request.
- A client that is rejected must be told when to retry.

## What to produce

1. `attempt.md` — your decisions, assumptions, and open questions.
2. `attempt.png` — your sketch.

Short explanations, videos, and small examples can help before application.
Keep your own attempt before the full reference solution for this exercise.
Use the [attempt template](../../ATTEMPT-TEMPLATE.md) as a guide. Resume existing artifacts instead of a forced restart.

## Do not skip

- **Where does the counter live?** 1,000 servers cannot each keep their own.
- Name at least 2 algorithms and say which you pick, and why.
- **What happens when the counter store is down?** Fail open or fail closed? Defend it.

*This exercise connects system design, LLD, and algorithm choices. Continue across slots if you need more time.*
