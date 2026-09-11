# Attempt — <problem name>

Copy this file to `attempt.md` for a new exercise. Keep an existing attempt when you resume.
Use the guided method in `system-design/FRAMEWORK.md` from the repo root. Leave unknown parts open for discussion.
Short explanations and small examples can help. Save your own attempt before the full reference solution.
An incomplete artifact is valid. Do not let the template force the order of the conversation.

## 1 · Requirements and assumptions

- Users and required behavior: …
- Exclusions: …
- Quality targets, such as latency or availability: …
- Questions and assumed answers: …

## 2 · Estimates

State units and assumptions. Connect each estimate to a design choice.

| Quantity | Inputs and assumptions | Calculation | Result and design consequence |
| --- | --- | --- | --- |
| Writes per second | | | |
| Reads per second | | | |
| Peak rate | State the multiplier or traffic evidence | | |
| Storage | State bytes per record, retention, and overhead | | |

## 3 · API and data

| Operation | Request | Response or error | Data access |
| --- | --- | --- | --- |

- Stored fields and keys: …
- Lookup pattern and index: …
- Consistency or transaction needs: …
- Retention or expiry behavior: …

## 4 · Diagram and request trace

Draw the design in Excalidraw. Save the sketch as `attempt.png`.
Explain whether each box means a responsibility or a separate deployment.
Label what each arrow carries.

1. The caller sends …
2. The service does …
3. The data operation …
4. The caller receives …

## 5 · Constraints and bottleneck

**The constraint is …, because …**

**The evidence is …**

**My response to this constraint is …**

## 6 · Choices and tradeoffs

| Decision | Gain | Lose | Alternative and why I rejected it |
| --- | --- | --- | --- |

## 7 · Failures and operations

| Failure | What the caller sees | Recovery | Data guarantee or limit |
| --- | --- | --- | --- |

- Relevant security controls: …
- Main cost and its assumption: …
- Metrics that show user impact or resource pressure: …

Use the framework's 3×3 sweep to find omissions.

## 8 · Recommendation

**I would build …**

**I would change this choice if …**

## Open questions

Record questions as they arise. Use them to form `gaps.md` during evaluation.

- …
