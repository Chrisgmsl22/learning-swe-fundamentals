# 02 · Rate limiter

**Attempt this blind.**

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

1. `attempt.md` — your reasoning, written **before** you look at anything.
2. `attempt.png` — your sketch.

## Do not skip

- **Where does the counter live?** 1,000 servers cannot each keep their own.
- Name at least 2 algorithms and say which you pick, and why.
- **What happens when the counter store is down?** Fail open or fail closed? Defend it.

*Why this one: bounded and small, so it can be designed fully in 40 minutes. It also overlaps LLD
and LeetCode, so the work pays three times.*
