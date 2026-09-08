# Progress

**Read this first. Update it at the end of every session.**

Current phase: the **long-term three-track plan**, started 2026-09-07.
The week is in `SCHEDULE.md`. The system design loop is in `system-design/FRAMEWORK.md`.

---

## System design — the log

| # | Design | Attempted | Checked | Gaps closed | Next re-draw |
| --- | --- | --- | --- | --- | --- |
| 01 | URL shortener | — | — | — | — |
| 02 | Rate limiter | — | — | — | — |
| 03 | Async job service | — | — | — | — |

## Concepts closed

_(one line per note in `system-design/concepts/`. This list is the honest coverage record.)_

## Still shaky

- **Layer 3 — data.** SQL vs NoSQL, indexing, denormalisation, blob storage. Nothing covered.
- **CIDR arithmetic** — the recipe is known, the speed is not. Live errors seen: "octet" said for
  "bit"; `last = first + size` instead of `− 1`; splitting a range by dividing the bits.
- **Terraform: 4 of 9 lab bugs never fixed** — the ORed `cidr_blocks` on sg-db, `gateway_id` used
  for a NAT, SSH 22 left open, and the CIDR overlap fixed on the wrong side.
- Kubernetes, CI/CD, observability — vocabulary only.

## Session log

_(newest first)_

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
