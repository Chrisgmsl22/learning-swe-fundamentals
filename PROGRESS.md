# Progress

**Read this first. Update it at the end of every session.**

Current phase: the **long-term three-track plan**, started 2026-09-07.
The week is in `SCHEDULE.md`. The system design loop is in `system-design/FRAMEWORK.md`.

---

## System design — the log

| # | Design | Attempted | Checked | Gaps closed | Next re-draw |
| --- | --- | --- | --- | --- | --- |
| 01 | URL shortener | **2026-09-07** (37 min) | **2026-09-10** | — | ~2026-10-01 |
| 02 | Rate limiter | — | — | — | — |
| 03 | Async job service | — | — | — | — |

## Concepts closed

_(one line per note in `system-design/concepts/`. This list is the honest coverage record.)_

## Still shaky

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
