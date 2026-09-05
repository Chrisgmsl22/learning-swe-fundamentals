# Kubernetes · CI/CD · Observability — the skim

Vocabulary level, on purpose. Enough to talk, not enough to be tested on.

---

## Kubernetes

**Problem:** many containers, many machines. Something must place them, restart them, replace them.
**How:** you declare the desired state; a **control loop** compares reality to it and corrects the
difference. Terraform's instinct, running continuously.

| Object | What it is |
| --- | --- |
| **Pod** | Smallest unit. 1+ containers sharing a network address. **Disposable** — replaced, never repaired. |
| **Deployment** | "I want 4 copies." Rolling updates and rollback. What you actually write. |
| **ReplicaSet** | Made by the Deployment. Keeps the count right. Rarely touched. |
| **Service** | A **stable** name/address in front of pods. Pods come and go; the Service does not. |
| **Ingress** | HTTP routing from outside into Services. The cluster's ALB. |
| **ConfigMap / Secret** | Config and credentials injected into pods. |
| **HPA** | Horizontal Pod Autoscaler — adds pods when a metric rises. |
| **Namespace** | Grouping and isolation inside one cluster. |

**Probes:** *readiness* = "send me traffic yet?" · *liveness* = "am I alive, or restart me?"
Wrong readiness settings send traffic to a pod that is not ready.

**Link to say out loud:** on a rolling update K8s sends `SIGTERM` and waits ~30 s. That is the
exec-form / PID 1 point from the Docker work. Naming the link shows joined-up knowledge.

---

## CI/CD

**CI** — every commit: build, test, lint, scan. **CD** — deploy the result automatically.

```
checkout → build → test → scan → package (image) → deploy
```

**Jenkins** runs it from a `Jenkinsfile` in the repo — `pipeline { stages { stage('Test'){...} } }`,
executed by **agents**. Same shape as GitHub Actions and GitLab CI.

### "How would you improve this pipeline?" — near-certain question

| Fix | Why |
| --- | --- |
| **Measure first** | Find the slow stage. Never optimise blind. |
| **Cache dependencies** | The Docker layer-order problem again: do not reinstall what did not change. |
| **Parallelise** | Split the test suite across agents. Lint, test and scan at once. |
| **Fail fast** | Cheap checks first. No 20-minute suite before a 5-second lint. |
| **Build once, promote** | One artifact through staging to production. **Rebuilding per environment means you never tested what you shipped.** |
| **Smaller images** | 1.74 GB vs 242 MB, pushed and pulled every deploy. |

"Measure first" and "build once, promote" are the two that mark you out.

---

## Observability

| Pillar | What | Cost |
| --- | --- | --- |
| **Metrics** | Numbers over time. Rate, error rate, latency. | Cheap. Aggregate only. |
| **Logs** | Discrete events with detail. | Expensive at volume. |
| **Traces** | **One request across every service.** Shows where the time went. | Medium. |

**Monitoring answers questions you knew to ask. Observability lets you ask new ones.**

### SLI · SLO · SLA

- **SLI** — the measurement. "99.2% of requests under 300 ms."
- **SLO** — your internal target. "99.5%."
- **SLA** — the customer contract. **Money attached.** Always looser than the SLO.

**Error budget = 100% − SLO.** 99.9% allows **43 minutes down per month**. Spend it on releases.
**Budget gone → stop shipping features, fix reliability.** It turns "how fast should we ship" into
arithmetic instead of an argument.

### Alerting

**Alert on symptoms, not causes.** "Checkout error rate above 2%" is a real reason to wake someone.
"CPU at 90%" is not.

### Incidents

**detect → mitigate → fix → learn**

> **Mitigate before you fix.** Roll back first, understand afterwards. Users do not care why.

Then a **blameless** postmortem: the question is what let a human error reach production, not who
typed it. Metrics people name: **MTTD** (time to detect), **MTTR** (time to recover).
