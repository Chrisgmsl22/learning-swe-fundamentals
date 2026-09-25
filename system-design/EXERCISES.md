# System design exercise index

Use small, realistic problems to practice two or three concepts at a time.
This file owns the exercise sequence and scope. [PROGRESS.md](../PROGRESS.md) owns current status and the next action.
The [framework](FRAMEWORK.md) owns the completion rules. The [schedule](../SCHEDULE.md) owns the available study slots.

## Exercise sequence

| Order | Exercise | Main concepts | First scope | One later complication |
| --- | --- | --- | --- | --- |
| 1 | [URL shortener](problems/01-url-shortener/PROBLEM.md) | Request flow, redirects, cache fallback | Preserve the existing attempt; use the bounded final pass in PROGRESS.md | Save unresolved capacity and expiry questions for a revisit |
| 2 | [Rate-limited API](problems/02-rate-limiter/PROBLEM.md) | Request limits, HTTP responses, state | One endpoint, one server, 100 requests per minute per identified user | Add a second application server |
| 3 | [Photo upload service](problems/photo-upload/PROBLEM.md) | APIs, database metadata, blob storage | Upload one photo and retrieve it later | A file write succeeds but its metadata write fails |
| 4 | [Background thumbnail service](problems/03-async-job-service/PROBLEM.md) | Queues, job status, retries | Submit one photo job and check its result | A worker fails after it creates the output |

Follow this table order. Existing folder names remain stable; their numeric prefixes do not determine the new sequence.
These prompts are available. Availability does not mean that an exercise has started or that a concept is mastered.

## How to use an exercise

1. Read the brief and select the small initial scope.
2. Explain unfamiliar concepts before the learner attempts a design.
3. Let the learner sketch the design and trace one request.
4. Introduce one complication after the first design works under its stated assumptions.
5. Discuss the gain and loss of the learner's choice.
6. Save the result and defer other questions before the next exercise.

Use one to three normal 45-minute sessions. Three sessions are the default allowance, not a minimum.
After three sessions, summarize the evidence, save open questions, and move on by default.
Extend only when the learner explicitly chooses more practice on that problem, within an existing study slot.
An unfinished part does not require extra study hours or a restart.

## Enough for a first pass

- The learner explains the main request paths and how the system stores and retrieves data.
- The learner explains two important choices and what each choice gains and loses.
- The learner explains one failure case and what the client experiences.

These criteria guide the review; they do not override the time limit.
If the allowance ends first, record which parts remain unresolved and move on without a false completion claim.
Use the [review queue](REVIEW-QUEUE.md) for later practice. Do not make every chapter a new requirement for the current problem.

## Chapters and short exercises

The learner plans one new chapter per day within existing study time and rest rules. This is a pace, not a quota.
Choose one idea from that chapter for the current or next exercise.
Use a brief example when it helps a specific gap. It does not create another track or another required full design.

## Resume in another session

Open this repository as the session's workspace, then ask: "Resume my system design practice from PROGRESS.md."
The shared [mentor brief](../CLAUDE.md) directs both agents to the current notes and next action.

From another terminal directory, point Codex at this repository:

```sh
codex --cd /Users/christian-gonzalez/Dev/casual-personal/learning-swe-fundamentals "Resume my system design practice from PROGRESS.md."
```

Use the repository's actual path if it lives elsewhere.
An agent in an unrelated directory does not automatically discover this repository's instructions.
For an existing session elsewhere, explicitly provide the repository path and ask it to read CLAUDE.md and PROGRESS.md first.
On another computer, the agent needs a copy of these updated files. A new session does not inherit this conversation automatically.
See [Codex instruction discovery](https://learn.chatgpt.com/docs/agent-configuration/agents-md) for workspace-specific guidance.
