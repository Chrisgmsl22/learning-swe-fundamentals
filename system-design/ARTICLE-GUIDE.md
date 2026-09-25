# System design concept articles

## Purpose and location

The archive introduces tools that the learner can then apply to a design.
Its entrance is `site/system-design-concetps/index.html`. Preserve the folder name the learner requested.
Use separate folders for future cloud, SRE, and DevOps archives when the learner requests those topics.
Keep all pages local and standalone. Both Codex and Claude use this guide.

## Study pace

Normal system design sessions last 45 minutes. The 20-minute session on 2026-09-21 was an exception.
The learner plans to read one new chapter per day. This is a pace, not a catch-up obligation.
Select one idea to apply. A new chapter does not add new completion requirements to the current exercise.
Use articles within the existing study time. Preserve rest days and the current workload limits.
An article can precede practice. Do not require the learner to invent an unfamiliar concept before an explanation.
Keep the learner's own design attempt before the full solution to that exercise.

## Archive contents

Use the topics in TOPICS.md as the coverage source. Organize the index around these questions:

| Group | Question | Examples |
| --- | --- | --- |
| Request flow | How does a request reach the right code? | Client-server, IP, DNS, HTTP, proxies, latency |
| APIs | How do clients and services communicate? | REST, GraphQL, WebSockets, webhooks, gateways, rate limits, idempotency |
| Data | How does the system store and find information? | Databases, SQL/NoSQL, indexes, transactions, denormalisation, blob storage |
| Performance and capacity | How does the system handle demand? | Caches, load balancers, vertical/horizontal scale, CDN, queues |
| Distribution and failures | How do copies and separate services behave? | Replication, sharding, partitioning, CAP, microservices, failure recovery |
| Design and operations | How do we justify and operate the design? | Requirements, estimates, security, observability, cost |

Give each of the six groups its own page. Give each of the 37 subtopics a section with a basic Mermaid design.
Use the index as the entrance, with numbered category links and direct links to subtopic sections.
Each subtopic section needs a short definition, an example diagram, a caption, and a gain or limit.
The learner can read one subtopic at a time. A category page is not a daily quota.
Link a topic only after its page exists. Keep future additions clearly marked until they exist.
Example availability is separate from learner progress. TOPICS.md remains the only evidence record.
Database indexes also have a separate, deeper article, because the current exercise needs lookup by short code.
Explain indexes and replication as separate mechanisms. Do not classify indexes as replication.

## Article contents

Target about five to eight minutes for one deeper article. Category pages collect shorter sections that the learner can read separately.

1. State the problem and define the concept in plain language.
2. Explain the mechanism with one small example.
3. Add one basic system design diagram for each subtopic. Show where the concept acts within a concrete example.
4. Connect the concept to a design decision, with concrete assumptions where useful.
5. State the gain, loss, and cases where the concept does not help.
6. Correct one common misconception.
7. End with one application question and links to authoritative sources.

Define prerequisite terms where they first appear. Link an earlier article when more depth is necessary.
Keep advanced variants in separate follow-up articles.
Use the URL shortener when it provides a natural example. Do not force every topic into it.
An explanation or completed page does not prove that the learner can apply the concept.

## Diagram format

Show a few components, their boundaries, and labelled arrows that explain the request or data flow.
Explain the diagram in a short caption. State which details the example omits.
Keep database internals inside the database boundary. Do not imply that each box requires a separate server.
Author each diagram in Mermaid. Use simple boxes and labelled arrows, like the learner's URL shortener sketch.
Match the learner's visual references: compact boxes, monospace labels, thin borders, quiet fills, and clear group boundaries.
Use curved or clean right-angle connectors. Use dashed paths and accent colours only when their meaning is explicit.
Keep the light theme. Preserve enough space between nodes and labels for a clear request trace.
Keep Mermaid sources in the archive's `diagrams/` folder. Embed their rendered SVGs so the pages also work offline.
Use the shared [Mermaid configuration](../site/system-design-concetps/diagrams/mermaid-config.json) for the diagram style.
Give the rendered SVG an accessible title and text description. Keep labels readable on narrow screens.
Use vertical space and compact layouts. Do not require horizontal scroll to read a diagram.
These small examples teach one concept. They do not replace the learner's own exercise diagram.

## Page format

Use standalone light-theme HTML with readable text and responsive layout.
Use `request-flow.html`, `apis.html`, `data.html`, `performance.html`, `distribution.html`, and `operations.html` for the category pages.
Use stable section anchors for direct links to each subtopic.
Optional deeper articles, such as `database-indexes.html`, sit beside the category pages.
Add a return link to `index.html` on each page.
Use relative links. Do not require an account, build step, or web server.
Use the existing artifact style where it supports this small reference archive.
