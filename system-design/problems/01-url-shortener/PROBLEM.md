# 01 · URL shortener

**Attempt this blind. Do not read anything first — that is the whole point.**

## The prompt

Design a service that turns a long URL into a short one, and redirects a visitor who follows the
short link back to the original.

## Constraints, given up front

- 100 million new links a year.
- **Reads outnumber writes by roughly 100 to 1.**
- A link, once created, never changes.
- Redirects must feel instant.
- Links do not expire unless the creator sets an expiry.

## What to produce

1. `attempt.md` — your reasoning, written **before** you look at anything.
2. `attempt.png` — your sketch.

## Do not skip

- **Numbers first.** What is the write rate? The read rate? How much storage after 5 years?
- Say what the short code actually is, and how you generate it.
- Name the bottleneck before you optimise anything.

*Why this one is first: it is the canonical starter, and it forces layer 3 — database choice,
indexing, and read-heavy caching — which is your largest gap.*
