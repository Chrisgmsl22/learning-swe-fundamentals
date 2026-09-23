# Concept article diagrams — revision 7

Status: complete. Six category pages contain 37 Mermaid diagrams. The optional database indexes article has one additional diagram.
The independent content and visual review is approved. The reviewer verified the final corrections in the browser.

## Final review and corrections

The independent reviewer inspected all 37 category figures in the browser and all category text and Mermaid sources.
It found no material technical errors. It requested these visual corrections:

| Finding | Correction | Status |
| --- | --- | --- |
| Cache request and response labels overlap | Separate or simplify paths without a change to cache-aside ownership | Fixed and verified |
| Several diagrams shrink text too much on narrow pages | Use compact vertical stages and shorter labels; preserve readable text without horizontal scroll | Fixed and verified |
| The database query arrow crosses its group title | End the query arrow at the database boundary or route it clear of the title | Fixed and verified |

The reviewer rechecked 13 category figures and the deeper index diagram, with intended mobile padding in a 360-pixel wrapper.
Labels remained approximately 14.9–15 pixels, with no overlap, clipping, or horizontal scroll.
All local links, diagram counts, whitespace checks, and original exercise file checks passed.

## Latest user clarification

The archive must contain six category pages, with a basic Mermaid design for every subtopic: 37 diagrams in total.
This clarification replaces the first-article-only implementation scope below.
The index must link to the six pages. Each category page needs an ordered topic list and one section per existing subtopic.
Each section needs a short definition, a concrete example diagram, a caption, and a gain or limit.
Use simple boxes, database cylinders, and labelled arrows, like the learner's URL shortener sketch.
Keep Mermaid sources with each diagram. Prefer embedded rendered diagrams for offline access.
The existing database-indexes article can remain as an optional deeper reference.
Do not claim concept mastery. Keep all study-state records unchanged.

## Category pages

| File | Topics |
| --- | --- |
| request-flow.html | Client-server, IP, DNS, proxy/reverse proxy, latency, HTTP/HTTPS |
| apis.html | APIs, REST, GraphQL, WebSockets, webhooks, API gateway, rate limits, idempotency |
| data.html | Databases, SQL/NoSQL, indexes, transactions, denormalisation, blob storage |
| performance.html | Vertical scale, horizontal scale, load balancers, caches, CDN, queues |
| distribution.html | Replication, sharding, vertical partitioning, CAP, microservices, failure recovery |
| operations.html | Requirements/scope, estimates/assumptions, metrics/logs/alerts, security/abuse, cost/capacity |

## Current acceptance

- Six linked category pages with all 37 original subtopics and 37 Mermaid designs.
- Readable diagrams, labelled arrows, simple architecture examples, and accessible text descriptions.
- No horizontal scroll for diagrams. Use vertical space and compact layouts that fit the page width.
- Match the learner's component references: compact boxes, monospace labels, thin borders, quiet fills, clear groups, and distinct connector styles.
- Keep the light theme. Save the shared Mermaid style configuration for consistent future articles.
- Valid links and anchors, no page overflow, and browser inspection of all six pages.
- Preserve the 45-minute schedule and all learner evidence.
- Independent review of final content and navigation.
- After all pages and diagrams are complete, run a separate review of both content and visual design across all six pages.
- Fix confirmed issues and verify each correction before handoff.

## Earlier implementation scope (superseded by revision 3)

## Request and scope

The learner requests a basic design diagram for each concept article.
The index has 37 planned articles and no complete articles yet.
Require one diagram in ARTICLE-GUIDE.md and create the first example article on database indexes.
Keep all other articles planned. Do not record mastery or change the learner's exercise.

## Implementation

- Create `site/system-design-concetps/database-indexes.html` as a standalone, light-theme article.
- Reuse the index typography and colours. Use no external scripts or fonts.
- Define an index, explain one lookup, state gains and costs, correct the replication misconception, and end with one application question.
- Author a simple Mermaid diagram: browser → URL retriever → database boundary, with an index and table row inside it.
- Preserve the Mermaid source beside the article. Embed the rendered SVG for offline access, with an accessible description.
- Label arrows and explain the response in the caption. State that the example isolates lookup and omits cache and expiry rules.
- Include a minimal PostgreSQL table with `short_code TEXT PRIMARY KEY` and `long_url TEXT NOT NULL`.
- Explain that PostgreSQL creates the primary-key index automatically. Do not add a redundant index.
- Distinguish selective lookup from a query that returns many rows. Do not promise fixed latency or automatic index use.
- Cite official PostgreSQL documentation for index mechanics, unique indexes, query plans, and replication.
- Update the index to show one available article and 36 planned articles. Link the first article and require diagrams in its format list.
- Update ARTICLE-GUIDE.md to describe the first article as available after the file exists.

## Sources

- https://www.postgresql.org/docs/current/indexes-intro.html
- https://www.postgresql.org/docs/current/indexes.html
- https://www.postgresql.org/docs/current/indexes-unique.html
- https://www.postgresql.org/docs/current/using-explain.html
- https://www.postgresql.org/docs/current/high-availability.html

## Acceptance

- One meaningful, accessible diagram in the first article.
- Readable HTML and SVG labels, no page overflow, valid local links and anchors.
- Correct index-versus-replication explanation and automatic primary-key index behaviour.
- Independent content review, browser render inspection, and whitespace checks.
- No changes to learner evidence, attempts, reference designs, or unrelated files.
- No commit, push, or publish.

## Status

The draft article exists. Revision 2 adopts the learner's explicit Mermaid preference and simple URL shortener sketch style.
The existing checkout contains the current archive work and user changes; preserve both.
