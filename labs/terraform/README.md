# Terraform lab — a 2-AZ VPC

```
01-reference/   the correct stack, heavily commented. READ THIS FIRST.
02-broken/      the same stack with 9 bugs planted. FIND THEM.
ANSWERS.md      do not open until you have written your list.
```

## How to work it

```bash
cd labs/terraform/02-broken
terraform init         # already done — downloads the AWS provider
terraform validate     # syntax and type checking only
```

**No AWS credentials are needed.** Nothing is ever created. `validate` reads the files
and never calls AWS.

## The lesson that matters

`terraform validate` finds **2** of the 9 bugs. The other **7 pass validation cleanly**
and would build real, broken, insecure infrastructure.

Validation checks *syntax*. It has no idea what your network is supposed to do.
**The other 7 need your eyes.** That is the whole point of this lab, and it is the
skill the practical assessment is testing.
