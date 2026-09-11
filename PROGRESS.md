# Progress

**Read this first. Update it at the end of every session.**

Current phase: the **long-term three-track plan**, started 2026-09-07.
The week is in `SCHEDULE.md`. The system design loop is in `system-design/FRAMEWORK.md`.

## Current state — guided mentor agreement, 2026-09-10

- **Exercise:** URL shortener. Reuse the existing `attempt.md` and `attempt.png`.
- **Stage:** Evaluation in progress. The learner has not completed the guided walkthrough.
- **Next action:** Ask the learner to trace one request through the existing sketch, with one question at a time.
- Ask what each box represents before you judge separate services or deployments.
- Continue through request flow, estimates, lookup, code generation, redirects, and expiry as questions arise.
- Do not require another arithmetic quiz before the walkthrough.
- Use the learner's **1 kB per link** assumption when relevant. The historical reference used **500 bytes**.
- `gaps.md` does not exist yet. The earlier log proposed seven gaps; it did not record seven completed learner entries.
- `reference.md` exists, but its existence does not prove a completed evaluation.
- The attempt contains later notes about abuse and metrics. These notes do not establish concept closure.
- No new concepts are closed by this mentor update.

### Agreements for later sessions

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
