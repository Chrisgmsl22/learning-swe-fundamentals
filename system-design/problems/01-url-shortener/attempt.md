# Attempt — URL shortener

---

## 1 · Clarifying questions

_3-4 questions, and the answer you assumed if nobody was there to ask._

- Q: Is this going to be a web app, or can it also be a mobile app
- Read heavy (data access pattern)
- Links do not change, so they must stay consistent throughout time
- Redirects must feel instant ... what does this mean?, is there a certain wait time we would need?
- Is latency important to us?
- Where are our users going to be?, is this something that's global?
- Links only expire if set so, default they are pemanent.

## 2 · Numbers

_Rough is fine. Silent is not. Show the arithmetic._

_(100M / 12) / 30 / 24 / 60 / 60_

_83k a month_

_2700 a day_

_112 per hour_

_2 a minute_

_100 _ 10^6

_how much does a link weight?, given its simply strings, lets assume 1kb?_

| Quantity              | Working                                        | Result                     |
| --------------------- | ---------------------------------------------- | -------------------------- |
| Writes / second       |                                                |                            |
| Reads / second        | 100 reads per 1 write                          | We read more than we write |
| Peak (2-5×)           | 5 a minute                                     |                            |
| Storage after 5 years | Need to learn back of the envelope estimations |                            |

**The derived number that matters here:** …

## 3 · The design

_Still need to account for security. A URL with a short link could be used for phising purposes, we need to make sure the links we have do not point to important sites, like banking or governent sites. Could we maybe blacklist a group of addresses? We can also rate limit our app to prevent DDoS attacks._

## 4 · The bottleneck

**The constraint is …, because …**

_Then: what you did about it._

## 5 · Technology choices

| Choice | Why | What I rejected, and why |
| ------ | --- | ------------------------ |

## 6 · Tradeoffs

_Every choice: what you gain, what you lose._

| Decision | Gain | Lose |
| -------- | ---- | ---- |

## 7 · Recommendation

**I would build …**

**I would change this if … turned out to be true.**

---

## Where I got stuck

_Write this honestly. It becomes_ `gaps.md` _on Wednesday, and_ `gaps.md` _is the curriculum._

- I dont know how to represent the FE
- When adding servers, are those referencing to backend servers?
- All arrows are bidirectional, right?, information flows
- Need to learn back of the envelope estimations, just some rough math

### LESSONS:

Every feature is also an attach surface. Asks "who benefits fro this if they are malicious", once per design

OBSERVABILITY:

A metric is a number over time. It moves before things break.

- Symptom: Is it healthy now?: Redirect p99 latency, error rate
- Leading: Is it about to be unhealthy?, Cache hit rate failing, DB connections in use
