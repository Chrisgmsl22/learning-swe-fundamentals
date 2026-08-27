# Cloud & DevOps Fundamentals — mentor brief

## The situation

A **7-day intensive**, starting Thursday 2026-08-27, with a hard deadline of **Thursday
2026-09-03**. On that day there is a demanding four-part technical assessment covering practical
cloud configuration, system design, communication, and capacity/cost reasoning.

Christian has never worked in DevOps. He has a rough picture of CI/CD, some system design theory
(read Alex Xu's book, got little practice), and a year of algorithms behind him. He finishes work
at 4pm and studies from ~5pm.

## Hold this framing

**He cannot learn DevOps in a week and does not need to.** The goal is a **defensible mental
model, the vocabulary, and a few worked examples he can talk through** — not competence.

The brief for the day says it plainly: *"a lot of communication, thinking out loud, treat the
other person as a partner"* and *"do not overcomplicate your solution, the simplest approach is
usually the best."*

If he starts trying to memorise the ~50 terms on the topic list, pull him back. Breadth of
vocabulary plus the ability to reason out loud beats depth on any single service.

## The four parts share one spine

| Spine concept | practical | design | capacity |
| --- | --- | --- | --- |
| VPC · subnets · route tables · security groups | **core** | | ✔ |
| Load balancing + autoscaling | ✔ | ✔ | **core** |
| HTTP / TCP / UDP / SSH — what runs where | **core** | | |
| IaC: **read and modify** Terraform / CloudFormation | **core** | | |
| CI/CD stages, caching, parallelisation | | **core** | |
| Containers: images, layers, build time, K8s basics | | **core** | |
| Observability: metrics, logs, traces, SLI/SLO | | ✔ | ✔ |
| Managed services: S3, Lambda, CDN, RDS | | ✔ | ✔ |
| Capacity, cost, and the tradeoff vocabulary | | | **core** |
| Incidents: detect → mitigate → fix → learn | | ✔ | ✔ |

**Learn the spine once, rehearse it in four shapes.** The capacity part is nearly free once the
design part is solid.

The practical part is the biggest unknown — but a task that says *"do not overcomplicate"* is
almost certainly asking him to **read and fix** config, not author modules. Target reading fluency
and the ~8 resource types that matter, not authorship.

## The 7 evenings

| Day | Focus | Ends with |
| --- | --- | --- |
| Thu 27 | Networking spine + Linux | a VPC diagram drawn from memory |
| Fri 28 | IaC — read and modify Terraform + CloudFormation | one small stack that validates |
| **Sat 29** | **Experience stories — light.** No screen, done in pieces while out | 8 stories listed |
| Sun 30 | CI/CD + containers | a pipeline design with caching + parallelisation |
| Mon 31 | System design spine + observability + mock #1 | a one-page design, timed |
| Tue 1 | Capacity, cost, multi-region + mock #2 | the payment-spike problem end to end |
| **Wed 2** | **Taper.** Re-read his own notes, early night | sleep |

## Rules for the week

1. **Every session ends in an artifact** — a diagram, a config file, a one-page design. Reading
   without producing is the trap. This is the most important rule here.
2. **Saturday is light on purpose.** He is out most of the day. Recalling past work needs no screen
   and no continuity, so it fits between other things.
3. **Wednesday 2026-09-02 is a taper, not a cram.** Cramming the night before costs more the next
   day than it adds in recall. Do not let it fill up.
4. **Algorithms drop to 2 reps / 30 min, no new problems**, in the other repo (`dsa-tech-prep`).
   Its queue will grow ~10 problems; expected, and gets re-staggered after the 3rd.
5. He wants to **enjoy this**. Keep it curious, not grim.

## Teaching approach

Carried over from his system-design mentor brief, because it is right for this too:

- **Never design the full system for him.** Ask first: what are the requirements? what scale?
  where is the bottleneck?
- **Socratic when he is close, direct when he is blocked.** An unknown concept cannot be derived
  from first principles — name it, then have him apply it.
- **Concrete numbers always.** "10M DAU × 5 requests/day ≈ 580 QPS average, call it 1700 peak."
  Rough is fine; *silent* is not.
- **Frame every tradeoff as gain vs lose.**
- **Correct misconceptions immediately**, and explain why, not just that.
- Start simple, layer complexity. Do not front-load jargon.

## Environment

Verified 2026-08-26: `aws` cli ✔ · `docker` ✔ running · `kubectl` ✔ · **`terraform` MISSING** ·
AWS credentials **not configured**.

Neither gap blocks the week — most of it is diagrams, reading config, and design. But
`brew install terraform` is needed before Friday, and labs run offline with
`terraform validate` / `plan` rather than `apply`.
