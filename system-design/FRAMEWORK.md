# The framework

Two different tools. Keep them apart.

| | Tells you | Use it |
| --- | --- | --- |
| **A method** | what order to think in | to move forward |
| **A checklist** | what you have not covered | to catch what you forgot |

---

## The method — Monday

Follow this order out loud. **Draw while you talk.** A silent screen is the failure mode.

| Step | Do | Time |
| --- | --- | --- |
| 1 · **Clarify** | 3-4 questions before drawing. Who uses it? Read or write heavy? What must never break? | 5 min |
| 2 · **Numbers** | Estimate out loud. *"Let me put rough numbers on this first."* **Rough is fine; silent is not.** | 5 min |
| 3 · **Boxes and arrows** | The simplest thing that works. **No product names yet.** | 10 min |
| 4 · **Name the bottleneck** | *"The constraint here is X, so that is where I spend the design."* | 15 min |
| 5 · **Tradeoffs** | Every choice: what you gain, what you lose | throughout |
| 6 · **Recommend** | State it, and say **what would change your mind** | 5 min |

**The most common failure is designing for scale you never estimated.** Do step 2.

### Anchors

| Anchor | Value |
| --- | --- |
| 1M requests/day | **≈ 12/s** |
| 100M requests/day | ≈ 1,200/s |
| Peak vs average | 2-5x |
| Memory read | ~100 ns |
| SSD read | ~100 µs |
| Network, same region | ~0.5 ms |
| **Network, cross-region** | **~50-150 ms** — kills synchronous multi-region |
| One SQL database | ~5-10k simple reads/s, far fewer writes |
| Cache hit rate | 80-95% |
| **Data out of AWS** | **~$0.09/GB** — the line nobody predicts |

**The number that matters is usually derived** — the fan-out, the write rate, the yearly growth,
not the number you were handed.

---

## The checklist — Wednesday

The 6 pillars are the **AWS Well-Architected Framework** in plainer words. But a list of 6 hides
its own shape: **traffic, compute and data are layers. Security, cost and observability are
lenses over all three.**

|  | **Security** | **Cost** | **Observability** |
| --- | --- | --- | --- |
| **Traffic** | TLS · WAF · DDoS | egress fees · CDN offload | request rate · latency · error rate |
| **Compute** | IAM · least privilege | right-sizing · spot vs reserved | CPU · saturation · traces |
| **Data** | encryption at rest · access control | storage tiers · retention | queue depth · replication lag · slow queries |

**9 cells, and each cell is a question.** A blank cell is visible: *"I have said nothing about
cost at the data layer"* is a thought you can actually have.

### What the 6 pillars miss

They start at traffic, which assumes you already know what you are building.

1. **Requirements** — functional and non-functional. Comes first. **Interviewers grade the
   clarifying questions.**
2. **Numbers** — not a pillar at all, but the thing that *chooses* between options inside every
   pillar.
3. **The interface** — what are the actual endpoints and contracts?
4. **Failure modes** — observability tells you something broke. It does not cover timeouts,
   retries, circuit breakers, or graceful degradation.

So the real sequence is:

```
requirements -> numbers -> design -> sweep the 3x3 -> failure modes -> recommend
                                     ^ the pillars live here
```

### When the sweep earns its keep

- **When you go blank.** The grid always gives you a legitimate next question.
- **When you think you are finished.** The real one. Almost everyone stops at "it works and it
  scales" and never mentions cost or security. **Running the sweep out loud is a senior signal.**

---

## Coverage map — the 30 concepts in 5 layers

Not a reading order. **A map to mark up as problems teach you things.**

| Layer | Concepts | State |
| --- | --- | --- |
| **1 · How a request travels** | client-server · IP · DNS · proxy / reverse proxy · latency · HTTP/HTTPS | **mostly covered** (Aug 2026) |
| **2 · APIs** | APIs · REST · GraphQL · WebSockets · webhooks · API gateway · rate limiting · idempotency | idempotency, rate limiting covered |
| **3 · Data** | databases · SQL vs NoSQL · indexing · denormalisation · blob storage | **the real gap — nothing covered** |
| **4 · Scale** | vertical · horizontal · load balancers · caching · CDN · message queues | **mostly covered** |
| **5 · Distribution** | replication · sharding · vertical partitioning · CAP · microservices | replication, CAP touched |

Roughly 13 of 30 are already covered. **Layer 3 is where the next designs should bite.**

---

## The loop

| Session | Produces | Which is checked by | Which comes back as |
| --- | --- | --- | --- |
| **Mon — attempt** | `attempt.md` + sketch | Wednesday's reference + sweep | a blind re-draw, 3+ weeks later |
| **Wed — check** | `gaps.md` | — | Friday's concept |
| **Fri — close a gap** | a note in `concepts/` | the next design that needs it | — |

**You never study a concept you have not already needed.** The gap list is the curriculum, it is
ordered by real need, and it cannot overwhelm you, because it only holds what you actually hit.
