# cloud-fundamentals

Learning the cloud and DevOps stack properly, in a 7-day intensive. Deadline: **2026-09-03**.

```
notes/        how things work, in my own words, with a diagram or worked example
labs/         actual code — terraform, cloudformation, docker, scripts
designs/      system design write-ups, one folder per problem
behavioral/   experience stories, structured
site/         standalone HTML reference pages — open them in a browser
```

## The plan

| Day | Focus |
| --- | --- |
| Thu 27 | Networking spine + Linux |
| Fri 28 | IaC — Terraform + CloudFormation |
| Sat 29 | Experience stories (light — no screen needed) |
| Sun 30 | CI/CD + containers |
| Mon 31 | System design + observability + mock #1 |
| Tue 1 | Capacity, cost, multi-region + mock #2 |
| Wed 2 | Taper — review and an early night |

**One rule: every session ends in an artifact.** A diagram, a config file, a design. Notes that
are only a list of terms do not count.

**The test for any note:** could I redraw or rewrite this from memory tomorrow? If not, it is
notes *about* the thing rather than understanding *of* it.

## Visual reference — `site/`

One standalone HTML page per day. No build step, no server, no account:

```bash
open site/day-01-network-spine.html
```

Each page holds the diagrams, the corrected reference designs, and a recall check for
Wednesday's taper. **The repo is the only home for this.** Everything is committed here.

| Page | Covers |
| --- | --- |
| `day-01-network-spine.html` | CIDR, subnets, route tables, NAT, security groups, the 2-AZ VPC |

## Setup

```bash
brew install terraform      # needed Friday — not installed yet
```

`aws` cli, `docker`, and `kubectl` are already here. No AWS credentials configured, which is fine —
labs use `terraform validate` and `plan`, not `apply`.

## Design write-up order

1. Requirements — functional, then non-functional
2. Scale estimate — rough is fine, silent is not
3. High-level design — boxes and arrows before technology names
4. Technology choices, each with a reason and the alternative rejected
5. Each phase in detail — what happens, what fails, what you monitor
6. Tradeoffs — cost, resilience, performance, security, scalability, elasticity

Time it. A design you cannot get through in 45 minutes is one you cannot finish under pressure.
