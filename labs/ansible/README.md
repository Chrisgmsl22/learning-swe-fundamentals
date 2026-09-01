# Ansible lab

```
inventory.ini            which machines, and how to reach them (SSH)
site.yml                 the playbook — tasks, run top to bottom
templates/nginx.conf.j2  a Jinja2 template, filled in per host
```

Run it (needs real machines, so not this week):

```bash
ansible-playbook -i inventory.ini site.yml --check   # dry run, changes nothing
ansible-playbook -i inventory.ini site.yml           # for real
```

## The 6 words to know

| Word | Meaning |
| --- | --- |
| **Inventory** | The list of target machines, in groups. |
| **Playbook** | A YAML file of plays. Each play maps a host group to a list of tasks. |
| **Task** | One step. It calls a module. |
| **Module** | The unit that does the work — `package`, `service`, `file`, `template`. **Modules are what make Ansible idempotent.** |
| **Handler** | A task that runs at the end, once, and only if something notified it. |
| **Role** | A reusable folder of tasks, templates and variables. Ansible's version of a module in Terraform. |

## Idempotent, in one line

Every module checks the machine before it acts. Run the playbook 10 times and the machine
ends in the same condition — runs 2 to 10 report `ok` rather than `changed`.

## The answer if they ask "Terraform or Ansible?"

> Not a choice — they do different jobs. **Terraform provisions the infrastructure; Ansible
> configures what runs inside it.** Terraform builds the VPC, the subnets and the instances.
> Ansible then installs nginx on those instances and writes their config.
>
> Ansible *can* create cloud resources with the `amazon.aws` collection, but it has no state
> file, no `plan`, and no `destroy` — so for provisioning, Terraform is the better tool.

## Where it overlaps with the rest of the topic list

- **SSH / port 22** — Ansible is agentless and connects over SSH. Close port 22 and it fails.
- **File permissions** — `mode: "0644"` is the same octal as `chmod 644`.
- **CI/CD** — a Jenkins pipeline often calls `terraform apply`, then `ansible-playbook`.
