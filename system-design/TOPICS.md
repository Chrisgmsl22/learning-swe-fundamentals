# System design topic map

This is the only topic map. Use it to record evidence, not to set prerequisites or a mastery score.
The first five groups retain the original 30 topics. The last group adds design and operations topics.

## Evidence states

| State | Required evidence |
| --- | --- |
| Introduced | The learner explains the concept's purpose. Cite the explanation. |
| Applied | The learner uses the concept and explains a tradeoff: what the choice gains and loses. Cite both. |
| Revisited | The learner applies the concept again later without help. Cite the later artifact and date. |
| Not assessed | Evidence is pending. The available record does not confirm a learner demonstration at these thresholds. |

The states describe evidence, not mastery. Applied does not mean correct in all cases.
A term in a document does not prove application. A reference solution is mentor work, not learner evidence.
The old framework used broad coverage labels. Those labels support prior exposure only, where noted below.
Keep prior exposure and assisted attempts in the evidence notes; they do not grant a stronger state.
Not assessed does not mean the learner lacks the skill. It means the record lacks the required demonstration.
The current evidence does not confirm these thresholds for any assigned topic state yet.
Preserve all previous work. Do not restart exercises or require a separate assessment for every topic.
Record demonstrations as they arise in normal guided practice.

## The original 30 topics

| Group | Topic | State | Evidence and limits |
| --- | --- | --- | --- |
| Request path | Client-server | Not assessed | Legacy request-path coverage claim; current attempt asks about frontend and backend roles. See [attempt](problems/01-url-shortener/attempt.md). |
| Request path | IP | Not assessed | [Cloud session log](../PROGRESS.md) records network practice; current independent use is not assessed. |
| Request path | DNS | Not assessed | Legacy request-path coverage claim; [network notes](../notes/01-networking-spine.md) provide the prior reference. |
| Request path | Proxy / reverse proxy | Not assessed | Legacy request-path coverage claim; application needs assessment. |
| Request path | Latency | Not assessed | [Attempt](problems/01-url-shortener/attempt.md) asks about latency targets; no derived target yet. |
| Request path | HTTP/HTTPS | Not assessed | [Cloud session log](../PROGRESS.md) and [network notes](../notes/01-networking-spine.md); redirect semantics need evaluation. |
| APIs | APIs | Not assessed | A prompt or component name does not establish an API contract. |
| APIs | REST | Not assessed | No learner contract supports an assessment yet. |
| APIs | GraphQL | Not assessed | No learner evidence located. |
| APIs | WebSockets | Not assessed | No learner evidence located. |
| APIs | Webhooks | Not assessed | No learner evidence located. |
| APIs | API gateway | Not assessed | [Historical evaluation log](../PROGRESS.md) discusses this choice; guided evaluation remains incomplete. |
| APIs | Rate limiting | Not assessed | Legacy coverage claim; [attempt](problems/01-url-shortener/attempt.md) names abuse protection without a mechanism. |
| APIs | Idempotency | Not assessed | Legacy coverage claim; independent application needs assessment. |
| Data | Databases | Not assessed | [Historical evaluation log](../PROGRESS.md) records a relational choice; confirm the learner's reason. |
| Data | SQL vs NoSQL | Not assessed | Current guided evaluation must establish the comparison and tradeoff. |
| Data | Indexing | Not assessed | Lookup details remain part of the current walkthrough. |
| Data | Denormalisation | Not assessed | No learner evidence located. |
| Data | Blob storage | Not assessed | No learner evidence located. |
| Scale | Vertical scaling | Not assessed | Legacy scale coverage claim; independent application needs assessment. |
| Scale | Horizontal scaling | Not assessed | Legacy scale coverage claim; current [attempt](problems/01-url-shortener/attempt.md) asks what extra servers represent. |
| Scale | Load balancers | Not assessed | Legacy scale coverage claim; [network notes](../notes/01-networking-spine.md) include the prior reference. |
| Scale | Caching | Not assessed | [Historical evaluation log](../PROGRESS.md) describes cache-aside; confirm the learner's request trace. |
| Scale | CDN | Not assessed | Legacy scale coverage claim; independent application needs assessment. |
| Scale | Message queues | Not assessed | Legacy scale coverage claim; no assessed learner application yet. |
| Distribution | Replication | Not assessed | Legacy coverage claim and [historical evaluation log](../PROGRESS.md); the reason for use remains open. |
| Distribution | Sharding | Not assessed | Reference discussion alone does not establish learner application. |
| Distribution | Vertical partitioning | Not assessed | No learner evidence located. |
| Distribution | CAP | Not assessed | Legacy framework said “touched”; no assessed learner explanation yet. |
| Distribution | Microservices | Not assessed | Confirm responsibilities versus deployments before assessment. |

## Additional topics

| Topic | State | Evidence and limits |
| --- | --- | --- |
| Requirements and scope | Not assessed | [Attempt, section 1](problems/01-url-shortener/attempt.md) identifies access patterns, expiry, and latency questions. An explained tradeoff and purpose demonstration remain unconfirmed. |
| Estimates and assumptions | Not assessed | [Attempt, section 2](problems/01-url-shortener/attempt.md) uses a yearly rate and a 1 kB assumption. Arithmetic errors remain unresolved. Purpose and tradeoff evidence remain unconfirmed. |
| Transactions | Not assessed | No learner evidence located. |
| Failure behavior and recovery | Not assessed | [Historical evaluation log](../PROGRESS.md) records a failure question; the response needs a guided check. |
| Operations: metrics, logs, and alerts | Not assessed | [Cloud session log](../PROGRESS.md) records vocabulary exposure; [attempt notes](problems/01-url-shortener/attempt.md) name metrics. Application remains unconfirmed. |
| Security and abuse | Not assessed | [Attempt](problems/01-url-shortener/attempt.md) identifies phishing risk; the proposed controls need evaluation. |
| Cost and capacity | Not assessed | No complete learner cost or capacity argument yet. |

Update a row with an artifact and date when new evidence supports it.
Use [PROGRESS.md](../PROGRESS.md) for the current stage and next action.
