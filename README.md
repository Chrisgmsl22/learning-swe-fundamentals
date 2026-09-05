# learning-swe-fundamentals

System design and cloud/DevOps fundamentals. One of two repos in a three-track study plan.

**Start here: [`SCHEDULE.md`](SCHEDULE.md).**

```
SCHEDULE.md      the week — the single source of truth
system-design/   the weekly design loop: framework, problems, concepts, review queue
site/            standalone HTML reference pages — open them in a browser
notes/           written references
labs/            terraform · cloudformation · ansible · docker
behavioral/      STAR stories and questions to ask
designs/         the case-round playbook
PROGRESS.md      session log
```

## The three tracks

| Track | Repo | Cadence |
| --- | --- | --- |
| DSA | `dsa-tech-prep` | 3 reps daily · 3 new problems a week |
| **System design** | **here** | 1 design a week, across 3 sessions |
| LLD / organic projects | `dsa-tech-prep` | 1 pattern a week · 1 full problem every ~4 weeks |

## The system design loop

| Day | Session | Artifact |
| --- | --- | --- |
| **Mon** | Attempt a design, timed and blind | `attempt.md` + sketch |
| **Wed** | Check against the reference, run the 3×3 sweep | `gaps.md` |
| **Fri** | Close one gap properly, with a diagram | a note in `concepts/` |

Every third Friday, re-draw an old design blind instead. See `system-design/REVIEW-QUEUE.md`.

**One rule above all: practice means producing an artifact.** Reading an article is not practice.
A bad one-page design beats a well-understood article.

## Visual reference — `site/`

Standalone HTML. No build step, no server, no account.

```bash
open site/day-01-network-spine.html
```

| Page | Covers |
| --- | --- |
| `day-01-network-spine.html` | CIDR, subnets, route tables, NAT, security groups, the 2-AZ VPC |
| `day-02-iac-and-containers.html` | Terraform vs CloudFormation vs Ansible, file permissions, Docker layers and PID 1 |
| `case-round-cheatsheet.html` | The case arc, anchors, the spike arc, slow-API ladder, cost, migration |

## Labs

```bash
cd labs/terraform/02-broken && terraform validate   # 9 planted bugs; validate finds 2
```

`labs/terraform` · `labs/cloudformation` · `labs/ansible` · `labs/docker`.
No AWS credentials needed — nothing is ever created.
