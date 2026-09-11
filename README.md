# learning-swe-fundamentals

System design and cloud/DevOps fundamentals. One of two repos in a three-track study plan.

**Resume here: [PROGRESS.md](PROGRESS.md).** Use [SCHEDULE.md](SCHEDULE.md) for the weekly slots.

The broader goal is SWE skill across application design, code, infrastructure, and operation.
This repo supplies guided system design practice and cloud/operations at fundamentals depth.
Codex and Claude use one [mentor brief](CLAUDE.md); `AGENTS.md` links to `CLAUDE.md`.

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

| Usual slot | Stage | Artifact |
| --- | --- | --- |
| Mon | Guided attempt | `attempt.md` and a sketch |
| Wed | Guided evaluation and the 3×3 sweep | Questions in `gaps.md` |
| Fri | Close one gap | A concept note and a diagram |

Stages can continue across slots. Resume unfinished work instead of a forced restart.
Every third Friday replaces gap closure with a revisit from [REVIEW-QUEUE.md](system-design/REVIEW-QUEUE.md).

Use the [start guide](system-design/README.md), [method](system-design/FRAMEWORK.md), and [topic map](system-design/TOPICS.md).
Short explanations, videos, and small examples can precede application.
Keep your own attempt before the full reference solution. End each session with an artifact or an update.
Strict silent or timed simulation requires an explicit request.

## Visual reference — `site/`

Standalone HTML. No build step, no server, no account.

```bash
open site/schedule.html
```

| Page | Covers |
| --- | --- |
| **`schedule.html`** | **The week, colour-coded by track, with today highlighted** |
| `day-01-network-spine.html` | CIDR, subnets, route tables, NAT, security groups, the 2-AZ VPC |
| `day-02-iac-and-containers.html` | Terraform vs CloudFormation vs Ansible, file permissions, Docker layers and PID 1 |
| `case-round-cheatsheet.html` | The case arc, anchors, the spike arc, slow-API ladder, cost, migration |

## Labs

```bash
cd labs/terraform/02-broken && terraform validate   # 9 planted bugs; validate finds 2
```

`labs/terraform` · `labs/cloudformation` · `labs/ansible` · `labs/docker`.
No AWS credentials needed — nothing is ever created.
