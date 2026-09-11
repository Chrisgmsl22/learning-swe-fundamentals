# Reference — URL shortener

Written 2026-09-10, **after** the attempt, so it answers what was actually drawn.

---

## 1 · The numbers

**100M links a year.**

```
100,000,000 / 365 days        =  273,973 per day
            / 24 hours        =   11,416 per hour
            / 3600 seconds    =      3.2 WRITES PER SECOND
```

Reads are 100× writes:

```
3.2 x 100                     =   ~320 READS PER SECOND
peak at 3x                    =  ~1,000 reads per second
```

**Storage.** One row is a short code (7 bytes), a long URL (~100 bytes typical), and metadata —
created_at, expiry, owner, click count. Call it **500 bytes with index overhead**.

```
100M/year x 5 years           =  500M rows
500M x 500 bytes              =  250 GB
```

### What those numbers decide

> **3 writes a second and 320 reads a second is a small system.**
> **250 GB fits on one machine.**

So the design rejects, on evidence:

| Rejected | Because |
| --- | --- |
| Sharding | 250 GB fits on one database. Revisit at ~2 TB. |
| A message queue on the write path | 3 writes a second needs no shock absorber. |
| Multi-region for throughput | 1,000 reads a second is one modest server. |

**Saying no with arithmetic is the senior move.** Multi-region may still be justified later — by
*latency* for global users — but never by this throughput.

---

## 2 · The short code — the core decision

The prompt asked for this explicitly and the attempt did not answer it. **This is the algorithmic
heart of the problem.**

The code is **base62**: `a-z A-Z 0-9`, 62 characters.

```
62^6 =  56,800,000,000   (56 billion)
62^7 = 3,520,000,000,000 (3.5 trillion)
```

500M links in 5 years, so **7 characters gives enormous headroom**. 6 would also work.

### Three ways to generate it, and the tradeoffs

| Approach | How | Gain | Lose |
| --- | --- | --- | --- |
| **Random + check** | Generate 7 random base62 chars, check the DB, retry on collision | Simple. Codes are unguessable. | **A database read on every write.** Retries grow as the table fills. |
| **Counter + encode** | A global counter; base62-encode the integer | **No collisions, ever.** No read needed. | Codes are sequential, so they are **guessable and enumerable** — anyone can walk your whole dataset. |
| **Hash + truncate** | MD5 the long URL, take 7 chars | The same URL maps to the same code | Collisions still possible, so you still need the check |

**At 3 writes a second, "random + check" is fine** — the extra read costs nothing at this scale,
and unguessable codes are a real security property. **Say that tradeoff out loud.**

If you pick the counter, name the distributed problem it creates: **a single counter is a single
point of failure and a write bottleneck.** The fix is to hand each application server a *range*
of numbers (say 1,000 at a time), so servers only talk to the counter rarely.

---

## 3 · The redirect — 301 or 302?

**The classic question for this problem, and it was not addressed.**

| Status | Means | Effect |
| --- | --- | --- |
| **301** Moved Permanently | The browser **caches it** and never asks you again | Far fewer reads. Cheaper. **You lose all click analytics.** |
| **302** Found | The browser asks you **every time** | Every click reaches you — you can count clicks, but you carry the load |

The constraint says links never change, which argues for **301**. But most real shorteners choose
**302**, because click analytics is the product.

**There is no right answer. There is only naming the tradeoff.** Pick one and say what you lose.

---

## 4 · The design

```
                         WRITE PATH  (3/sec)
client -> API gateway -> shortener service -> generate code
                                           -> write to DB
                                           -> return short URL

                         READ PATH  (320/sec)
client -> API gateway -> redirect service  -> cache HIT?  -> 301/302
                                           -> cache MISS? -> DB -> fill cache -> 301/302

                         CLEANUP
daily cron -> delete rows where expiry < now
```

**Splitting the two paths is correct and the attempt did it.** They have completely different
characteristics — the read path is 100× busier and is the only one that needs a cache.

### The cache

**Cache-aside**, which the attempt described correctly: check the cache; on a miss, read the
database and store the result.

- **Key:** the short code. **Value:** the long URL.
- **Eviction: LRU.** Link popularity is extremely skewed — a few links take most of the traffic.
- **Size:** 10M hot entries × 500 bytes ≈ **5 GB**. One Redis node.
- **Expected hit rate: well above 95%**, because of that skew.

**What happens when the cache is down?** Every read falls through to the database. At 320 reads a
second that is survivable — so the honest answer is "we degrade, we do not fail". **Say this.**
It is a failure-mode answer, and nobody gives one unprompted.

### The database

**A relational database is the right call, and the attempt made it.** Justify it properly:

- The access pattern is a **single key lookup** — `SELECT long_url WHERE short_code = ?`.
- Both SQL and NoSQL do that well, so the tiebreaker is elsewhere: 250 GB is small, the schema is
  fixed, and one machine is enough. **Choose the simpler operational story.**
- **Index on `short_code`.** Without it every redirect is a full table scan. This is the single
  most important line in the schema.

```sql
CREATE TABLE links (
  short_code  VARCHAR(7)   PRIMARY KEY,   -- the index that matters
  long_url    TEXT         NOT NULL,
  created_at  TIMESTAMP    NOT NULL,
  expires_at  TIMESTAMP    NULL,          -- NULL = never
  owner_id    BIGINT       NULL
);
```

**Read replicas are not needed at 320 reads a second**, and the cache absorbs most of them anyway.
Name them as the next step if reads grow 10×.

### Expiry

The attempt's answer — an `expires_at` column plus a daily cron — **is correct**. One addition:
**also check expiry on read**, because between the expiry time and the next cron run a link is
expired but still in the table, and still in the cache. Lazy check on read, batch delete nightly.

---

## 5 · The 3x3 sweep

|  | **Security** | **Cost** | **Observability** |
| --- | --- | --- | --- |
| **Traffic** | TLS. **Rate limit link creation** — the attempt caught this. | CDN for the static frontend. Egress is tiny here. | Redirect rate, p99 latency, 404 rate |
| **Compute** | Auth for creating and deleting. **Who may delete a link?** | 3 writes/sec — the smallest instances. Do not over-provision. | CPU, and **cache hit rate** |
| **Data** | **Malicious URL scanning** — a shortener is a phishing tool by default | 250 GB. Cheap. Tier old rows. | Slow query log, DB connections, replication lag |

**The gap nobody fills: a URL shortener hides the destination.** That makes it attractive for
phishing and malware. A real one checks new URLs against a blocklist. **Raising this unprompted
is a strong signal.**

---

## 6 · Answers to the four questions from the attempt

**"I don't know how to represent the FE."**
Usually you do not draw it separately. **The client box is the frontend.** What the attempt drew
is actually right: static files in object storage, served through a CDN, loaded by the client.
Only the shape was odd — that should be a bucket, not a database cylinder.

**"When adding servers, are those backend servers?"**
**Yes.** An unlabelled "server" box in a system design is an application server — backend. The
frontend is static files delivered by a CDN, so it is not a server in this picture.

**"All arrows are bidirectional, right?"**
**No, and this costs you information.** An arrow shows **who starts the request**. The response
travels back implicitly and does not need its own arrowhead. Bidirectional arrows everywhere mean
a reader cannot tell which side initiates — and "who initiates" is exactly what a security group,
a NAT gateway, and a webhook all turn on.

**"Need to learn back of the envelope estimations."**
Correct, and it is the largest single gap. **This is Friday's concept.**

---

## 7 · The one-line recommendation

> A single relational database with an index on the short code, a Redis cache in front of the read
> path, and base62 random codes with a collision check. **At 3 writes and 320 reads a second,
> nothing more is justified.** I would add read replicas if reads grow 10×, and shard only past
> about 2 TB. I would revisit multi-region if the users turn out to be global — for latency, not
> for throughput.
