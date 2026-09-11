# The system design framework

Use guided practice by default. The goal is a design the learner can explain and defend.
This method supports broad SWE skill, with cloud and operations at fundamentals depth.

## Start or resume

1. Read [PROGRESS.md](../PROGRESS.md) for the current stage and next action.
2. Check [SCHEDULE.md](../SCHEDULE.md) for the time slots.
3. Read the exercise prompt and existing learner artifacts.
4. Resume the existing exercise with one question about the learner's intent.

Do not restart a design because its weekly slot passed.
Ask about time only for an explicit timed session.
Use the framework at any stage. It is a guide, not a test the learner must pass first.

## The three stages

| Stage | Mentor action | Learner artifact |
| --- | --- | --- |
| Attempt | Clarify the prompt. Explain unknown concepts. Ask one question at a time. | `attempt.md` and an Excalidraw sketch, saved as `attempt.png` |
| Evaluation | Understand the attempt, then compare choices and run the checklist. | Updates to the attempt and questions in `gaps.md` |
| Gap closure | Select one gap. Explain it with numbers, then ask for an application. | A concept note and a diagram the learner draws |

These are stages, not weekday gates. Monday, Wednesday, and Friday supply the usual slots.
Continue an unfinished stage within the next available slot. Do not add hours or require a new exercise.
Every third Friday replaces gap closure with a revisit from [REVIEW-QUEUE.md](REVIEW-QUEUE.md).

Short videos, explanations, and small worked examples can precede application.
The learner must produce an attempt before the full reference solution for that exercise.
The mentor can then write or use `reference.md` to address the actual attempt.
A reference presents one justified solution under stated assumptions.

During evaluation, identify correct decisions first. Pair each error with a corrected version and its consequence.
Ask what each ambiguous box or arrow means before you judge it.
A box can represent a responsibility without a separate deployment.
Explain unknown concepts directly. Do not turn every gap into a quiz or a resource list.
Use the learner's stated assumptions unless a constraint contradicts them.

## A typical design artifact

Use [ATTEMPT-TEMPLATE.md](ATTEMPT-TEMPLATE.md) as a guide. An incomplete artifact is valid.

| Part | What the learner records |
| --- | --- |
| Requirements | Users, required behavior, exclusions, and quality targets |
| Estimates | Inputs, units, assumptions, arithmetic, and consequences for the design |
| API and data | Example requests, responses, errors, stored fields, keys, and access patterns |
| Diagram and request trace | Responsibilities, deployment boundaries, arrow meanings, and one request from start to response |
| Constraints | The likely bottleneck and the evidence for it |
| Tradeoffs | What each choice gains and loses; alternatives and their costs |
| Failure behavior | What the caller sees when a dependency fails; recovery and data guarantees |
| Recommendation | The simplest justified design and the evidence that would change it |
| Open questions | What needs explanation, a check, or another attempt |

The mentor can guide these parts in the order that helps the current question.
Do not force another arithmetic exercise before a useful walkthrough of an existing sketch.
Connect a number to a choice when that choice needs evidence.

### Estimates and assumptions

| Check | Method |
| --- | --- |
| Average request rate | Divide requests per day by 86,400 seconds |
| Arithmetic anchor | 1 million requests/day is about 12 requests/second |
| Peak rate | State an assumed peak multiplier or use measured traffic |
| Storage | Multiply records by bytes per record and retention duration |
| Extra storage | Account separately for indexes, replicas, and other overhead |
| Capacity | Check the workload, query shape, hardware, and latency target |

A peak multiplier, cache hit rate, database capacity, network latency, or cloud price is an assumption to check.
Do not treat a generic anchor as guaranteed capacity or cost.
For the current URL shortener, retain the learner's 1 kB assumption when relevant.
The historical reference used 500 bytes. State the difference before a comparison.

## The design checklist

This repo uses a 3×3 grid for traffic, compute, and data through security, cost, and observability.
It is not an exact representation of the six AWS Well-Architected pillars.

| | Security | Cost | Observability |
| --- | --- | --- | --- |
| Traffic | TLS, abuse controls, access rules | Egress and request volume | Request rate, latency, error rate |
| Compute | Least privilege and service access | Capacity and utilization | CPU, saturation, request traces |
| Data | Access control and encryption | Storage, indexes, retention | Slow queries, queue depth, replication lag |

Use each cell as a question about this design. A blank cell can expose a gap.
Mark a cell as irrelevant only with a reason. Do not add components merely to fill the grid.

The grid does not replace these checks:

1. Confirm the requirements and estimates.
2. Trace an actual API request through the data operations.
3. Identify transaction boundaries and duplicate-request behavior where relevant.
4. Explain timeouts, retries, partial failures, and recovery where relevant.
5. State a recommendation with gain-versus-lose tradeoffs.

## Progress and later review

[TOPICS.md](TOPICS.md) is the only topic map. It records Introduced, Applied, and Revisited with evidence.
It is not a prerequisite checklist or a mastery score.
Select concepts from real questions and design needs. A brief explanation can help the learner identify the next question.

At the end of a session:

1. Save the learner's artifact or its update.
2. Record the current stage, open questions, and next action in [PROGRESS.md](../PROGRESS.md).
3. Update topic evidence only when the session supports it.
4. Record concept closure only after the learner produces the application and note.

An existing reference or old log entry does not prove that the learner completed evaluation.
Resolve contradictions with the actual artifacts and the learner's latest statement.

## Optional interview simulation

Strict silent or timed simulation requires an explicit user request.
Agree on the duration and feedback rules for that session.
Use the requested timer and checkpoints. Save an unfinished attempt when the time ends.
Do not silently carry simulation rules into the next guided session.
