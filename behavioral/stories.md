# The 8 stories

**Do not memorise these.** Learn the shape and the numbers. You speak them, you do not recite them.

Rules that carry most of the marks:

1. **Say "I", not "we".** In your voice notes you said "we" constantly. They are grading you.
2. **Action is ~60% of the answer.** Situation ~20%, Result ~20%.
3. **End with a number and a lesson.** "It worked" scores nothing.
4. **Pausing to think is explicitly allowed.** Take the 5 seconds.

`[?]` marks a number only you can fill. Estimates are fine — "roughly", "about".

---

## 1 · The tool that was not ready ★ strongest

**Skills:** influencing · judgment · communication
**Also answers:** "used persuasion" · "used good judgment and logic" · "disagreed with a decision" · "anticipated a problem"

**SITUATION**
The team built customer applications in a low-code workflow tool with **no version control** —
5 engineers editing the same thing with no history of who changed what. The wider organisation
told us to move to a new version of that tool, and told us to work out the problems ourselves.

**ACTION**
- I was one of the first to use it, so **I tested its real capabilities and limits before adopting it**.
- I found the core functionality was affected — publishing applications, extending them, error checking.
- Rather than complain in a meeting, **I wrote a research spike documenting every limitation**, one by one.
- **I took that document to my engineering manager and the team's manager** as evidence, not as an opinion.

**RESULT**
Both managers realigned and **we did not adopt the tool**. The team later moved to a different one.
The deciding argument was **delivery speed**, which was the thing that team was measured on.
**I accepted the tradeoff openly: we kept no version control, but we kept our speed — and speed was
what the client needed.**

**LESSON** — A documented objection beats a stated one. And name the tradeoff you are accepting;
do not pretend your option has no cost.

---

## 2 · Optimising for the wrong thing ★ strongest failure

**Skills:** self-awareness · communication · adapting
**Also answers:** "a mistake you made" · "changed your approach" · "feedback that changed you" · "joined a new team"

**SITUATION**
I moved to a new team on loan. Different roles, different way of working, and **I did not know what
they valued**. I was shipping roughly **1 ticket every 1–2 days**; others were shipping noticeably more.

**ACTION**
- I assumed my slower pace was fine because my tickets were harder and higher quality. **That assumption was the mistake.**
- **I asked the manager for regular 1-1s** — for context, feedback and tips. Nobody offered; I asked.
- He told me directly the team needed **more delivery speed**.
- **I then went and looked at how the others actually worked** — how much they tested, how long they spent, where they stopped.
- **I asked the team directly what they expected and what they valued most.**

**RESULT**
I changed both how I worked and how I communicated. The team's pace came from real constraints —
tight deadlines, changing requirements, a demanding client — and **quantity was what the client needed.**
`[?] roughly what did your throughput become?`

**LESSON** — "Good work" is defined by the team's context, not by me. When I join something new,
**find out what is valued before optimising for it.**

---

## 3 · The AI harness ★ most distinctive

**Skills:** drove something start to finish · anticipated a problem · initiative
**Also answers:** "above and beyond" · "improved a process" · "preventive measure" · "worked without being asked"

**SITUATION**
The company adopted AI-assisted development fast — at one point **5 different AI coding tools**, no
framework, no guardrails, free experimentation. My team then decided to drive **close to 100% of
development** through AI: coding, code review, and recently automated testing.

**ACTION**
- I saw the failure mode: **handed a ticket with no context, the AI invents its own conventions** — patterns, code style, and what to test.
- **I designed an AI harness** to supply that missing context as explicit rules.
- **The hard constraint was that we own 5 microservices, not a monolith**, so rules could not live in one repo. I made it **portable across repos**, and **model-agnostic** rather than tied to one vendor.
- **I gave it a self-healing loop** — it checks for errors and repeated patterns and feeds corrections back.
- **I made it write specs into Confluence**, so other agents and other engineers could query the same context later.

**RESULT**
`[?] is anyone else using it? how many repos is it on now?`

**LESSON** — A new tool without guardrails does not save time, it moves the cost. **The scarce thing
was never the code — it was the context.**

---

## 4 · The feature only one client wanted ★ strongest judgment failure

**Skills:** judgment · customer impact · learning from a mistake
**Also answers:** "a mistake you made" · "unintended consequences" · "what you learned" · "adapting to a new team"

**SITUATION**
A front-end change: a new screen capturing a few extra fields. **One client asked for it. None of the
others wanted it.** I shipped it to everyone.

**ACTION**
- In beta, **another client asked the product manager to turn it off**, and asked who had built it.
- **I traced it to my change and owned it.**
- **I found the real cause, which was not carelessness.** In my previous team the model was
  **one engineer per customer**, and every change was bespoke by design. **I carried that mindset into a
  team serving many customers.**
- **I moved to a config-based approach** for new features.

**RESULT**
`[?] how many clients saw the unwanted screen?` The config-based approach is **what the team uses now.**

**LESSON** — In a multi-tenant product, the first question is **"how many customers is this for?"**,
before any code. The habit that served me before was the thing that broke here.

---

## 5 · The archival cron job ★ delivery story

**Skills:** drove it start to finish · handled ambiguity · cross-team
**Also answers:** "drove a project" · "not enough information" · "took over someone's work" · "a complex problem"

**SITUATION**
A client wanted idle applications archived — anything left untouched for **an hour** — plus an
"abandoned workflow" process. A teammate started it, then **moved teams and left it stalled**. I picked
it up with **neither the business context nor an understanding of how the system worked**.

**ACTION**
- **First thing I did: I wrote down three lists — what I knew, what I had asked about, and what I did not understand at all.**
- **I researched the gaps myself** — other repos, existing examples, articles — rather than waiting to be told.
- **I wrote a spec**, then used AI-assisted coding to build against it.
- The requirements grew over time, and **it needed the integrations team to change their application**, so I coordinated that work with them.
- **I built it config-based from the start**, because it applies to one client — the lesson from story 4, applied.
- After deploy, I kept iterating on it.

**RESULT**
The client submits **~1,000 applications a day**, of which **~300 are abandoned**. Those 300 are now
archived automatically, with the **adverse action notice attached**. The job queries the application
database continuously to decide what qualifies.

**LESSON** — When you inherit something with no context, **write down what you do not know first.**
The list itself becomes the plan.

---

## 6 · Unblocking work another team owned

**Skills:** collaboration · communication · influencing without authority
**Also answers:** "worked across teams" · "someone did not report to you" · "you were blocked" · "conflicting priorities"

> Use the **integrations team** moment inside the cron job. One event, not the general pattern.

**SITUATION**
The archival work needed a change in an application **owned by the integrations team**. They had their
own sprint and their own priorities. I had no authority over their queue.

**ACTION**
- **I made the blocker precise** — exactly what I needed, and what was not blocked — instead of asking generally.
- **I documented it where others could see it**, so anyone could chime in and the engineering manager had visibility.
- **I set up a call** rather than letting it live in Slack.
- `[?] what did you agree in the end? did you write the change yourself and have them review it, or did they do it?`

**RESULT** — `[?]`

**LESSON** — Another team's silence is usually capacity, not indifference. **Make the ask precise and
visible, and it stops competing with everything else in their inbox.**

---

## 7 · Saying yes to everything

**Skills:** prioritisation · communication · setting boundaries
**Also answers:** "too many things to do" · "had to prioritise" · "said no" · "managed expectations"

**SITUATION**
As a junior I said yes to everything and took on many tickets at once. The customer kept adding
requests, and the work piled up faster than it cleared.

**ACTION**
- I learned to define a **professional hard stop** rather than absorbing everything silently.
- **I sorted requests into what was genuinely necessary now and what could be deferred to a later phase.**
- **I communicated the deferral explicitly** instead of letting things go quiet.

**RESULT** — `[?] a concrete instance — which project, what did you defer, what happened?`

**LESSON** — Saying yes to everything is not helpfulness. **An unspoken queue is worse for the
customer than an honest "not this phase".**

---

## 8 · Switching teams to learn new technology

**Skills:** drive · growth · initiative
**Also answers:** "above and beyond" · "outside your comfort zone" · "took on something unfamiliar"

> **Do not fake enthusiasm for overtime.** Your honest position — you work extra only when it is
> genuinely necessary, for a close deadline or a blocked team — is a fine answer. **Give that in one
> sentence, then redirect to "beyond":**

**SITUATION**
An opportunity opened to move to a different team working with technologies I had not used.

**ACTION**
- **I put myself forward for it**, on the basis that it would grow a skill and still serve the team.
- `[?] what did you have to learn? how did you get up to speed?`

**RESULT** — `[?]`

**LESSON** — I go beyond scope when it builds a skill that helps the team. **I do not treat hours as
the measure of commitment.**

---

## The arc — say this if they ask what you have learned recently

Stories 2, 4 and 5 connect, and pointing that out is stronger than any single story:

> **I learned the team's definition of "good" (2). I learned to ask how many customers a change is
> for (4). Then I applied both on the cron job — config-based from the start, and shipped at the
> pace the team needed (5).**

## Coverage check

| Named skill | Stories |
| --- | --- |
| Communication | 1, 2, 6, 7 |
| Influencing others | 1, 6 |
| Collaboration | 5, 6 |
| Driving start to finish | 3, 5 |
| A failure, with the lesson | 2, 4 |

## The 5 sample questions, routed

| They ask | You use |
| --- | --- |
| Used persuasion to convince someone | **1** — the tool |
| Used good judgment and logic | **1** or **4** |
| Went above and beyond | **3** — the AI harness |
| Too many things, had to prioritise | **7**, or **5** for the requirement growth |
| Anticipated a problem, built a preventive measure | **3** — the harness |
