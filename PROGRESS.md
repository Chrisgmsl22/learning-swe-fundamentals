# Progress

State of the week. **Every session updates this at the end.** Read it first.

Assessment: **Thu 2026-09-03.** Format confirmed by the official guide — see
`notes/00-assessment-format.md`. **4 rounds of 60 minutes**, all in CodeSignal: behavioral (STAR),
an architectural case, hands-on IaC, and a concept-focused Q&A.

## Time budget — what is actually left

| Slot | Hours |
| --- | --- |
| Sun 30 evening | 5 |
| Mon 31 evening (LeetCode paused) | 3+ |
| Tue 1 evening | ~3 |
| Wed 2 — **taper, do not fill** | ~2 |
| Micro-slots: commute, before work, lunch | ~4 in 15-30 min pieces |

**Nothing is cut. Depth is capped instead.** The caps:

- Terraform: **read and modify**, do not author from scratch. The brief says "do not overcomplicate".
- Kubernetes: vocabulary and the 6 objects. No cluster work.
- Linux: ~12 commands and permissions. Not a shell course.
- Multi-region and observability: the vocabulary plus 1 tradeoff sentence each, inside a design.

## The plan

### Sun 30 — 5h — close Part 1, open IaC

| Min | Block | Artifact |
| --- | --- | --- |
| 30 | ~~VPC diagram from memory~~ **DONE** | `site/day-01-network-spine.html` |
| 20 | ~~Mark it, second pass~~ **DONE** — 6 corrections | in the site page |
| 90 | **Terraform** — read a real VPC stack, find planted bugs, modify, `validate` | `labs/terraform/` |
| 45 | **CloudFormation** — the same stack in YAML, spot the differences | `labs/cloudformation/` |
| 30 | Linux + file/group permissions + `chmod 600` | `notes/03-linux.md` |
| 45 | **Broken-config lab** — networking + SG + Linux together | a written diagnosis |

### Mon 31 — 3h — the concept round

| Min | Block | Artifact |
| --- | --- | --- |
| 15 | CloudFormation — the same VPC in YAML (owed from Sun) | `labs/cloudformation/` |
| 20 | **Ansible** vs Terraform vs CloudFormation | the IaC trio table |
| 25 | Docker: images, layers, build time, cache order, vulnerabilities | an optimised Dockerfile |
| 15 | Kubernetes vocabulary — the 6 objects | one page |
| 30 | CI/CD + **Jenkins**: stages, caching, parallelisation, artifacts | a pipeline design |
| 20 | Linux permissions + **Python / boto3** scripting | one page |
| 45 | **Mock #1** — architectural case, timed | a one-page design |

### Tue 1 — 3h — case + behavioral

| Min | Block | Artifact |
| --- | --- | --- |
| 30 | Observability: metrics, logs, traces, SLI/SLO, alerting, incidents | one page |
| 30 | Capacity, cost, multi-region, tradeoffs | the tradeoff table |
| 45 | **Mock #2** — payment spike, in the real 3-part case format | `designs/payment-spike/` |
| 45 | **Behavioral** — 8 stories written in STAR | `behavioral/` |
| 30 | **Concept rapid-fire** — asked out loud | updated shaky list |

### Wed 2 — taper — DO NOT FILL

- The 8 stories, out loud, once. The behavioral round is a full 60 minutes.
- Re-read the `site/` pages. No new material.
- Open codesignal.com once. Logistics, not study.
- Early night. **Cramming Wednesday costs more Thursday than it adds.**

### Micro-slots

Behavioral rehearsal and concept flashcards. No screen needed for either.

## Setup

- [x] `terraform` v1.16.0 at `/opt/homebrew/bin/terraform` — verified Sun 30
- [x] `aws` cli, `docker` (running), `kubectl` present
- [ ] AWS credentials — **not** configured, and not required; labs use `validate` / `plan`

## Things that are shaky and need a second pass

_(the honest list — this is what Wednesday's taper reviews)_

- **BEHAVIORAL — nothing done. A full 60-minute round. This is now the biggest gap by far.**
- **CIDR arithmetic** — the recipe is known, the speed is not. Live errors: "octet" said for
  "bit"; `last = first + size` instead of `− 1`; splitting by dividing the bits.
- **Terraform: 4 of 9 lab bugs still unfixed** — the ORed `cidr_blocks` on sg-db, `gateway_id`
  for a NAT, SSH 22 open, and the CIDR overlap fixed on the wrong side.
- Kubernetes vocabulary. Not started.
- CI/CD + Jenkins. Not started.
- Observability, capacity, cost, multi-region. Not started.
- Python / boto3. Not started — but this is his strongest area.
- No mock case done yet.

**Done and solid:** networking spine · CIDR mechanics · Terraform reading · CloudFormation ·
Ansible · file permissions · Docker.

## Session log

**Thu 3 – Fri 4.** Three rounds done. Reported questions across them: monitoring, scaling, AZ and
cross-region replication, cost, slow APIs, alerts, metrics. **Case round is the last one.**
Built `site/case-round-cheatsheet.html` — a one-screen glance sheet, adding the four things the
playbook lacked: the slow-API diagnostic ladder, multi-AZ vs multi-region with RPO/RTO, the
migration options (lift-and-shift / replatform / refactor), and cost levers in order.


**Wed 2 — taper.** No new labs. Wrote the 8 STAR stories (`behavioral/stories.md`) from his own
material, plus a question bank for the interviewers (`behavioral/questions-to-ask.md`). Closed with
a deliberately light skim of Kubernetes, CI/CD and observability
(`notes/04-k8s-cicd-observability.md`) — vocabulary level only, by design.

Strongest stories: the tool that was not ready (influencing), optimising for quality when the team
needed speed (self-awareness), the AI harness (initiative), the one-client feature (judgment).
Delivery notes: he says "we" instead of "I", his situations run long, and 2 stories still lack a
result.


**Mon 31 – Tue 1, evening.** Covered CloudFormation (`labs/cloudformation/vpc.yaml`, the same VPC
in YAML), the `DependsOn` rule, route table vs route vs association, Ansible (`labs/ansible/`,
agentless over SSH, idempotent modules, handlers), file permissions including the special bits,
and Docker end to end — layer cache order, multi-stage, `.dockerignore`, non-root, PID 1 and
`SIGTERM`. **Bad image 1.74 GB -> fixed image 242 MB, running as `appuser`.**

Artifact: **`site/day-02-iac-and-containers.html`**.

**Decision — Docker stopped early, deliberately.** The hands-on round is Terraform/CloudFormation;
Docker appears only in the concept round, where he already has a strong answer. Remaining time
goes to behavioral, which is a full 60-minute round with zero preparation.


**Mon 31.** Official interview guide arrived. Plan restructured: behavioral promoted from
micro-slots to a real 45-minute block (it is a full 60-minute round), and **Ansible**, **Jenkins**
and **Python/boto3** added — none were in the original brief. Kubernetes and CloudFormation depth
cut to pay for it. Format recorded in `notes/00-assessment-format.md`.

**Sun 30, block 2 — Terraform.** First Terraform ever. Read `labs/terraform/01-reference/`, then
debugged `02-broken/`. **Found 5 of 9 planted bugs.** Missed: `cidr_blocks` left beside
`security_groups` on sg-db (rules are ORed, so the database stayed open to the internet);
`gateway_id` used for a NAT instead of `nat_gateway_id` (validate passes, apply fails); SSH 22
diagnosed in a comment but not fixed; the CIDR overlap fixed on the wrong side, creating the
illegal block `10.0.63.0/18`. Both of his `#` comments landed on real bugs — the radar is good,
the follow-through is what needs work.


**Sun 30, block 1 — DONE.** The 2-AZ VPC diagram, drawn in Excalidraw. CIDR split maths correct,
both route tables correct, all 3 security groups correct including `from sg-alb`. Six corrections:
NAT comment inverted (said inbound), ALB in one AZ only, no RDS standby, single NAT tradeoff
unnamed, count confused with stride, request path left blank.

Artifact: **`site/day-01-network-spine.html`** — open it in a browser. Holds every Day 1 concept,
the corrected reference design, his live errors side by side, and a recall check for Wednesday.


**Thu 27 (ran into Fri 00:xx).** Covered: CIDR and the /16 /24 table, `0.0.0.0/0` as the `else`
branch, VPC, subnets, AZs, route tables and most-specific-match, `local`, IGW, the real definition
of a public subnet, NAT gateway and the outbound-only asymmetry, packet layers and which box reads
which layer, TCP/UDP/HTTP/HTTPS/SSH/DNS ports, security groups and statefulness, the
sg-alb → sg-app → sg-db chain.
Artifact: `notes/01-networking-spine.md`.

**Sun 30.** Root-caused the real gap: not terminology, but binary and CIDR mechanics, plus 3
colliding meanings of "private" (`0.0.0.0/0` = all addresses · RFC 1918 ranges · a subnet with no
IGW route). Taught the 4-step range recipe, the split rule (`2ⁿ parts → +n to the prefix`), the 5
AWS-reserved addresses per subnet, and the 4 conditions for internet reachability. ~1h spent.
Then re-planned the week against a real time budget.
