# Progress

**Read this first. Update it at the end of every session.**

Current phase: the **long-term three-track plan**, started 2026-09-07.
The week is in `SCHEDULE.md`. The system design loop is in `system-design/FRAMEWORK.md`.

## Current state — guided evaluation, 2026-09-21

- **Exercise:** URL shortener. Reuse the existing `attempt.md` and `attempt.png`.
- **Stage:** Evaluation in progress. The learner has not completed the guided walkthrough.
- **Next action:** Resume cache timeout budgets. Use a concrete redirect target and ask about the gain and loss of a shorter timeout.
- **Latest session:** [2026-09-21 mentor notes](system-design/problems/01-url-shortener/session-2026-09-21.md). The learner explained cache-aside and distinguished a cache failure from a miss.
- The session addressed redirect responses, destination ownership, and database fallback. Timeout tradeoffs still need learner application.
- The learner shared an updated sketch in chat. The repository's `attempt.png` remains the original image.
- Ask what each box represents before you judge separate services or deployments.
- Continue through request flow, estimates, lookup, code generation, redirects, and expiry as questions arise.
- Do not require another arithmetic quiz before the walkthrough.
- Use the learner's **1 kB per link** assumption when relevant. The historical reference used **500 bytes**.
- `gaps.md` does not exist yet. The earlier log proposed seven gaps; it did not record seven completed learner entries.
- `reference.md` exists, but its existence does not prove a completed evaluation.
- The attempt contains later notes about abuse and metrics. These notes do not establish concept closure.
- No new concepts are closed. The current cache evidence supports Introduced, not Applied or Revisited.

### Agreements for later sessions

- Normal system design sessions last **45 minutes**. The 2026-09-21 session was a 20-minute exception.
- Article preference: one short article per day, with explanation before application, within existing study time and rest rules. No catch-up quota.
- Use the local [concept archive](site/system-design-concetps/index.html) and shared [article guide](system-design/ARTICLE-GUIDE.md).
- Archive format: six category pages, with one simple Mermaid design per subtopic. Use vertical space and no horizontal scroll.
- Diagram style: compact boxes, monospace labels, thin borders, clear groups, and a light theme. The archive has 37 examples, not new mastery evidence.

- Guided practice is the default. Explain unknown concepts directly, then ask for application.
- Permit short videos, explanations, and small examples before application.
- Preserve the learner's own attempt before the full reference solution for that exercise.
- Understand intent before judgment. Connect each correction to a concrete consequence.
- Treat attempt, evaluation, and gap closure as stages, independent of the weekday.
- Use strict silent or timed simulation only on explicit request.
- Ask about time only for an explicit timed session.
- Keep the three tracks, weekly slots, Saturday rest, early Friday finish, and total workload.
- Use the [shared brief](CLAUDE.md), [framework](system-design/FRAMEWORK.md), and [topic map](system-design/TOPICS.md) across agents.
- Resolve conflicts in old records with current artifacts and the learner's latest statement.

---

## System design — the log

| # | Design | Attempted | Checked | Gaps closed | Next re-draw |
| --- | --- | --- | --- | --- | --- |
| 01 | URL shortener | **2026-09-07** (37 min) | Started 2026-09-10; incomplete | — | ~2026-10-01, provisional |
| 02 | Rate limiter | — | — | — | — |
| 03 | Async job service | — | — | — | — |

## Concepts closed

_(one line per note in `system-design/concepts/`. This list is the honest coverage record.)_

## Still shaky — historical observations

- **Back-of-envelope estimation.** 100x slip on design 01. The single largest gap — it is what
  lets him reject complexity with evidence instead of reaching for it.
- **Metrics vs states.** Names booleans ("DB is up") when asked for metrics.
- **Layer 3 — data.** SQL vs NoSQL, indexing, denormalisation, blob storage. Nothing covered.
- **CIDR arithmetic** — the recipe is known, the speed is not. Live errors seen: "octet" said for
  "bit"; `last = first + size` instead of `− 1`; splitting a range by dividing the bits.
- **Terraform: 4 of 9 lab bugs never fixed** — the ORed `cidr_blocks` on sg-db, `gateway_id` used
  for a NAT, SSH 22 left open, and the CIDR overlap fixed on the wrong side.
- Kubernetes, CI/CD, observability — vocabulary only.

## Session log

Historical entries remain below. The current state above supersedes any conflicting completion or next-step claim.

_(newest first)_

### 2026-09-21 · design 01 — guided evaluation, 20 minutes

- The learner explained cache lookup, database fallback after a miss, and 404 for an unknown code.
- He added a status-code and Location-header response to his sketch in chat.
- We discussed the browser's separate destination request and the destination's ownership of its errors.
- He distinguished cache failure from a miss and proposed temporary database fallback plus multiple cache nodes.
- The mentor corrected fallback ownership: the URL retriever handles it, not the API gateway.
- His proposed timeout was a couple of seconds. Latency budgets and timeout tradeoffs are the next application.
- Capacity, regional outages, and the limits of advance alerts received brief explanations.
- [Session notes](system-design/problems/01-url-shortener/session-2026-09-21.md) separate learner evidence from mentor explanations.
- Evaluation remains incomplete. No concept closure or new independent recall is recorded.

### 2026-09-10 · design 01 — check (ran Thursday; Wednesday was lost)

`reference.md` written after the attempt. Marked side by side.

**Right:** split the write and read paths; cache-aside described correctly and only on the read
path; expiry via DB field + daily cron; API gateway justified; relational DB with a reason.

**The big error: a 100x arithmetic slip at the first step** (100M/12 written as 83k, is 8.33M),
so writes/sec, reads/sec and storage were never derived. The real numbers — **3.2 writes/s,
~320 reads/s, ~250 GB in 5 years** — reject sharding, queues and multi-region on evidence. He
reached for replication anyway in the failure question, which is the same gap from the other side.

**Missing:** what the short code is and how it is generated (the prompt asked); 301 vs 302; the
bottleneck section blank. Sweep: no security, cost or observability on the page — normal for a
first attempt. He had the phishing insight and framed it as a feature. Named states ("DB is up")
where metrics were asked; cache hit rate was the one real metric he gave.

**Friday's concept: back-of-envelope estimation.** Seven gaps total in `gaps.md` (his to write).

### 2026-09-07 · design 01 — attempt

URL shortener, 37 of 40 minutes, first design of the new loop. Artifacts:
`system-design/problems/01-url-shortener/attempt.md` + `attempt.png`.

He worked the whole slot and produced a real design, not a term list. The reasoning lives mostly
in annotations on the drawing rather than in `attempt.md` sections 3-7, which stayed as template.
**Not marked — Wednesday is the check.**

Self-identified gap, written during the attempt: *"Need to learn back of the envelope
estimations."*

### 2026-09-07 · phase change

The 7-day cloud intensive ended with the SRE interview on 2026-09-03. This repo was renamed from
`cloud-fundamentals` to `learning-swe-fundamentals` and restructured for the long term:
`SCHEDULE.md`, `system-design/`, and a rewritten `CLAUDE.md`. The old day-by-day interview budget
was removed from this file.

### 2026-08-27 to 09-03 · the cloud intensive

Covered, with artifacts in `notes/`, `labs/`, `site/` and `behavioral/`:

- **Networking spine** — CIDR mechanics, VPC, subnets, AZs, route tables, `local`, IGW, NAT
  outbound-only, the 4 reachability conditions, packet layers, ports, security groups and
  statefulness. Drew a 2-AZ VPC and corrected 6 errors in it.
- **Terraform** — read a real 2-AZ stack, then debugged a broken copy. Found 5 of 9 planted bugs.
- **CloudFormation** — the same VPC in YAML. `DependsOn`, route vs route table vs association.
- **Ansible** — agentless over SSH, idempotent modules, handlers, and why it is not a provisioner.
- **Docker** — layer cache order, multi-stage, `.dockerignore`, non-root, PID 1 and `SIGTERM`.
  Took an image from **1.74 GB to 242 MB**.
- **Behavioral** — 8 STAR stories in `behavioral/stories.md`.
- **Case round** — `designs/00-case-playbook.md` and `site/case-round-cheatsheet.html`.
