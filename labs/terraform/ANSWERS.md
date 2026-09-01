# Answers — 9 planted bugs

**Write your own list first.** Reading this before you try wastes the exercise.

## Caught by `terraform validate` (2)

| # | File | Bug | Fix |
| --- | --- | --- | --- |
| 1 | `main.tf` sg-alb ingress | `cidr_block` — the argument is plural | `cidr_blocks = ["0.0.0.0/0"]` |
| 2 | `main.tf` `alb_to_app` | `aws_security_group.loadbalancer` does not exist | `aws_security_group.alb.id` |

Note that `validate` stops at the **first** error. Fix one, run it again, find the next.

## Passes validation — would build broken infrastructure (7)

| # | Bug | Why it is wrong | Fix |
| --- | --- | --- | --- |
| 3 | NAT gateway placed in `aws_subnet.private[0]` | A NAT needs the IGW route itself. In a private subnet it has no way out, so nothing works. | `aws_subnet.public[0].id` |
| 4 | `rt-private` routes `0.0.0.0/0` to the **internet gateway** | This *is* the definition of a public subnet. Both tiers become public and the NAT is orphaned. | `nat_gateway_id = aws_nat_gateway.main.id` |
| 5 | `private` route table association points at `aws_route_table.public` | `rt-private` is built and attached to nothing. Dead resource, and the private tier is public. | `aws_route_table.private.id` |
| 6 | `sg-db` allows 5432 from `0.0.0.0/0` | The database is open to the whole internet. The worst bug on the page. | `security_groups = [aws_security_group.app.id]` |
| 7 | `sg-app` allows SSH 22 from `0.0.0.0/0` | Every app server accepts login attempts from anywhere. | Restrict to a bastion SG, or delete the rule. |
| 8 | `azs = ["us-east-1a", "us-east-1a"]` | Both "AZs" are the same building. Four subnets, zero resilience — and the design still *looks* multi-AZ. | `["us-east-1a", "us-east-1b"]` |
| 9 | `private_subnet_cidrs` starts `10.0.64.0/18` | It overlaps `public_subnet_cidrs[1]` exactly. AWS rejects this at apply time, not at validate time. | `["10.0.128.0/18", "10.0.192.0/18"]` |

## The order to say them out loud

Security first (6, 7), then "it will not work" (3, 4, 9), then "it works but is a lie" (5, 8),
then syntax (1, 2). Leading with the open database shows judgement, not just eyesight.
