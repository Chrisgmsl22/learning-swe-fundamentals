# Case round playbook

Their format: **framing → drivers → recommendation.** Their worked example: *a payment system has
unexpected spikes.* Collaborative — **changing your recommendation as data arrives is expected.**

---

## The order to walk

| Step | Do | Time |
| --- | --- | --- |
| 1 · Clarify | 3-4 questions before drawing. Who uses it? Read or write heavy? What must never break? | 5 min |
| 2 · **Numbers** | Estimate out loud. **Rough is fine; silent is not.** | 5 min |
| 3 · Boxes and arrows | Simplest thing that works. **No technology names yet.** | 10 min |
| 4 · Find the bottleneck | Name it, then go deep *there* only | 20 min |
| 5 · Tradeoffs | Every choice: gain vs lose | throughout |
| 6 · Recommend | State it, and say what would change your mind | 5 min |

**Most common failure: designing for scale you never estimated.** Do step 2.

## Anchors

| Anchor | Value |
| --- | --- |
| 1M requests/day | **≈ 12/s** |
| 100M requests/day | ≈ 1,200/s |
| Peak vs average | 2-5x |
| Memory read | ~100 ns |
| SSD read | ~100 µs |
| Network same region | ~0.5 ms |
| **Network cross-region** | **~50-150 ms** — kills synchronous multi-region |
| One SQL database | ~5-10k simple reads/s, far fewer writes |
| Cache hit rate | 80-95% |
| NAT gateway | ~$32/mo + $0.045/GB |
| **Data out of AWS** | **~$0.09/GB** — the surprise line on the bill |

## Scaling

| Pattern | Use when | Costs |
| --- | --- | --- |
| **Stateless app tier** | **Always. First.** | Session state moves to Redis or a token |
| Horizontal scaling | Load grows | Needs statelessness + a load balancer |
| Vertical scaling | Quick fix, or a database | A ceiling, and downtime to resize |
| **Cache** | Reads repeat | Staleness; invalidation is hard |
| CDN | Static assets, global users | Cost, purging |
| **Read replicas** | Read-heavy | **Replication lag** — stale reads |
| **Queue** | Write spikes, slow work | Eventual consistency, new failure modes |
| Sharding | One DB genuinely full | Cross-shard queries, rebalancing |

## Resilience

| Pattern | What it stops |
| --- | --- |
| **Timeouts** | Most forgotten. No timeout = one slow dependency hangs everything. |
| **Retry + backoff + jitter** | Without jitter every client retries at the same instant |
| **Circuit breaker** | Calling a dependency that is already failing |
| **Idempotency keys** | **Double-charging.** Say this unprompted on a payments case. |
| Graceful degradation | Recommendations off, checkout still works |
| Bulkhead | One slow tenant exhausting a shared pool |
| Multi-AZ | One datacenter failing |
| Canary / blue-green | A bad deploy reaching everyone |

## The payment-spike arc

1. **Is the spike predictable?** Payday and Black Friday are schedulable; viral is not. Different answers.
2. **Numbers.** Baseline vs peak, and how long the peak lasts. 10x for 5 minutes != 2x for 6 hours.
3. **Decouple accepting from processing.** Accept the request, write to a **queue**, return
   "accepted". Workers drain it at their own rate. **The spike hits the queue, not the database.**
   A queue is a shock absorber — the strongest single thing to say.
4. **Idempotency keys**, so a retry never charges twice.
5. **Autoscaling warms up in minutes, not seconds.** Predictable -> scale on a schedule, ahead of
   it. Unpredictable -> keep headroom and scale on **queue depth**, not CPU.
6. **Protect the database** — it cannot scale in seconds. Connection pooling, read replicas,
   queue absorbing writes.
7. **Shed load deliberately.** Rate limit and return a clear "try again". **A degraded service
   beats a dead one.**
8. **Cost:** reserved capacity for the baseline, on-demand for the spike. Do not pay peak prices
   all month.

## Tradeoff vocabulary

| Pair | Distinction |
| --- | --- |
| **Scalability vs elasticity** | Scalability = *can* it grow. **Elasticity = grows AND shrinks, automatically, fast.** |
| Cost vs resilience | 1 NAT $32, 1 per AZ $64. Name the number. |
| Consistency vs availability | During a partition you pick one. Payments pick consistency. |
| Latency vs throughput | Batching raises both. |
| Managed vs self-hosted | RDS costs more per hour, less per engineer. |
| Multi-region | Real resilience, real cost, and cross-region latency makes synchronous writes impractical. |

## Sentences that carry weight

- "Let me put rough numbers on this first."
- "The bottleneck here is the database, so that is where I would spend the design."
- "I would accept and queue, so the spike hits the queue rather than the database."
- "Idempotency keys, so a retry during a spike never double-charges."
- "That is the simplest thing that works — I would add X only when the numbers justify it."
- "I would change this recommendation if the spike turned out to be predictable."
