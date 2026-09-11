# 01 · URL shortener

**Use guided practice.** Follow the [framework](../../FRAMEWORK.md), with one question at a time.

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

1. `attempt.md` — your decisions, assumptions, and open questions.
2. `attempt.png` — your sketch.

Short explanations, videos, and small examples can help before application.
Keep your own attempt before the full reference solution for this exercise.
Use the [attempt template](../../ATTEMPT-TEMPLATE.md) as a guide. Resume existing artifacts instead of a forced restart.

## Do not skip

- **Connect numbers to choices.** What are the write rate, read rate, and storage after five years?
- Say what the short code actually is, and how you generate it.
- Name the bottleneck before you optimise anything.

*Why this one is first: it is the canonical starter, and it forces layer 3 — database choice,
indexing, and read-heavy caching — which is your largest gap.*
