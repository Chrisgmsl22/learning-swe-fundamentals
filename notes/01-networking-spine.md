# Networking spine — VPC, subnets, route tables, security groups

Day 1 reference. Read the tables. Then draw it from memory — that is the real test.

---

## The one-line version of each box

| Box | One line |
| --- | --- |
| **CIDR** | A way to write down a set of IP addresses. Not a rule. |
| **VPC** | Your own private slice of the AWS network. Has a CIDR. |
| **Subnet** | A slice of the VPC range. Lives in exactly 1 AZ. |
| **Route table** | Attached to a subnet. Answers "which way out?" |
| **Internet gateway (IGW)** | The door between the VPC and the internet. 1 per VPC. |
| **NAT gateway** | Sits in a *public* subnet. Lets private subnets call out, but not be called. |
| **Security group** | Attached to a machine. Answers "may these 2 talk?" |
| **Network ACL** | Attached to a subnet. Stateless. Has deny rules. Rarely touched. |

---

## CIDR

An IP address is 32 bits, written as 4 numbers 0-255. `10.0.1.47`

`10.0.0.0/16` — the `/16` fixes the first 16 bits. The other 16 bits are free.

**A bigger number means a smaller range.**

| CIDR | Addresses |
| --- | --- |
| /16 | 65536 |
| /20 | 4096 |
| /24 | 256 |
| /28 | 16 |

`0.0.0.0/0` fixes 0 bits. It matches **every address in the world**. It is the default route,
the catch-all, the `else` branch.

### The trap: the same CIDR does 3 different jobs

```
10.0.0.0/16                          <- a fact:      this VPC owns these addresses
10.0.0.0/16 -> local                 <- direction:   a route table rule
allow TCP 443 from 10.0.0.0/16       <- permission:  a security group rule
```

When you see a CIDR, ask which of the 3 you are looking at.

---

## Subnets

- A subnet has a CIDR and an AZ. Both matter.
- **A subnet lives in exactly 1 AZ.** This is why multi-AZ needs more subnets.
- Subnet ranges inside 1 VPC must not overlap.
- An **AZ** is 1 physically separate datacenter in a region. `us-east-1a`, `us-east-1b`.

```
VPC              10.0.0.0/16     65536 addresses
 |- public-a     10.0.1.0/24     256   us-east-1a
 |- public-b     10.0.2.0/24     256   us-east-1b
 |- private-a    10.0.11.0/24    256   us-east-1a
 |- private-b    10.0.12.0/24    256   us-east-1b
```

**There is no "public" checkbox.** See the next section.

---

## Route tables

> A route table answers 1 question: "I hold a packet. Its destination address is X.
> Where do I send it?"

It is a lookup on the **destination address**. Nothing else. It stores **rules**, not addresses.
It never knows where any specific server lives.

```
ROUTE TABLE rt-private
  10.0.0.0/16   ->  local
  0.0.0.0/0     ->  nat-abc
```

Read it as code:

```
if dest in 10.0.0.0/16:  send local     # my own VPC
else:                    send to NAT    # 0.0.0.0/0 is the "else"
```

**The most specific match wins.** `/24` beats `/16` beats `/0`.

### Facts

- **Every subnet has exactly 1 route table.** If you attach none, it uses the VPC's *main* one.
- Every route table starts with `10.0.0.0/16 -> local`. AWS adds it. You cannot remove it.
  **So all subnets in a VPC reach each other by default.**
- `local` does **not** mean "private subnet". It means "the destination is inside this VPC —
  deliver it directly, use no gateway." Public subnets have the same `local` line.

### The definition of public and private

> **A subnet is public if its route table has `0.0.0.0/0 -> igw-xxxx`. That is the whole
> definition.**

---

## NAT gateway

The problem: a server in a private subnet must call `https://api.stripe.com`. Nothing needs to
reach *in*.

You cannot add an IGW route — that would make the subnet public by definition.

**A NAT gateway lives in a PUBLIC subnet.** The private subnet only gets a *route* to it.
Put the NAT in the private subnet and nothing works, because the NAT itself has no way out.

```
ROUTE TABLE rt-private
  10.0.0.0/16   ->  local
  0.0.0.0/0     ->  nat-abc        # nat-abc sits at 10.0.1.50, in public-a
```

What happens:

1. The server sends the packet to the NAT gateway.
2. The NAT swaps the source address for its own public IP, and sends it out the IGW.
3. Stripe replies to the NAT gateway.
4. The NAT remembers who asked, and passes the reply back.

- **Gain:** the private server reaches the internet.
- **Lose:** nothing on the internet can *start* a connection inward. The NAT only returns
  replies to calls that started inside.

That asymmetry is the entire point of a private subnet.

**Cost:** ~$0.045/hour + $0.045/GB, about **$32/month each**, and you want 1 per AZ for real
resilience. This is a classic cost-tradeoff answer.

---

## What a packet is

Bytes on a wire. Your JSON is only the innermost part. Each layer adds a header in front.

```
+- Ethernet header ---------------------------------+
| +- IP header -----------------------------------+ |
| |  src 10.0.11.20   dst 34.120.55.10            | |
| | +- TCP header ------------------------------+ | |
| | |  src port 51234   dst port 443            | | |
| | | +- HTTP ---------------------------------+| | |
| | | |  POST /v1/charges                      || | |
| | | |  {"amount": 500}   <- your JSON        || | |
| | | +----------------------------------------+| | |
| | +-------------------------------------------+ | |
| +-----------------------------------------------+ |
+---------------------------------------------------+
```

**Each box reads a different layer.** This explains most of the practical test.

| Box | Which layer it reads | What it decides |
| --- | --- | --- |
| Route table | IP only — the destination IP | Which way out |
| Security group | IP + TCP — IP and port | Who may talk at all |
| Load balancer | up to HTTP — path, host, headers | Which server gets it |

A route table cannot see your JSON. It cannot even see the port. That is why a route table is
never the thing that blocks port 443.

A packet holds about **1500 bytes**. A 50 KB response is ~35 packets. TCP reassembles them.

### Protocols

| Protocol | Layer | Port | What it gives you |
| --- | --- | --- | --- |
| IP | 3 | — | Addresses. No guarantee of delivery. |
| TCP | 4 | — | A connection. Ordered, retried, guaranteed. Slow to start. |
| UDP | 4 | — | Fire and forget. No order, no retry. Fast. |
| HTTP | 7 | 80 | Requests over TCP. HyperText **Transfer** Protocol. |
| HTTPS | 7 | 443 | HTTP inside TLS encryption. |
| SSH | 7 | 22 | An encrypted shell, over TCP. |
| DNS | 7 | 53 | Name to IP. Uses **UDP** normally. |

**Why DNS uses UDP:** 1 small question, 1 small answer. A TCP connection needs 3 packets before
any data moves. For 1 tiny question the handshake costs more than a retry. Video calls choose UDP
for the same reason — a late frame is worthless, so do not retry it.

---

## Security groups

**A security group is a firewall attached to a RESOURCE, not to a subnet.** You attach it to an
EC2 instance, a load balancer, or an RDS database.

```
INBOUND   TCP   port 443    from  0.0.0.0/0
INBOUND   TCP   port 22     from  10.0.1.0/24
OUTBOUND  TCP   port 5432   to    sg-database
```

### The 4 facts

1. **The default is deny all inbound, allow all outbound.** A new instance can call out.
   Nothing reaches in.
2. **Allow rules only.** There is no deny rule. You cannot write "block this 1 IP" in a security
   group. For that you need a **network ACL** — stateless, attached to the subnet, has deny rules.
3. **A source can be another security group.** `from sg-alb` means "from anything carrying the
   load balancer's security group". This beats hardcoded IPs, because instances come and go.
4. **A security group is stateful.**

### Stateful

A browser hits your server on 443. The reply leaves *from* port 443, *to* the browser's random
port 51234. **You need no outbound rule for that reply.** The group remembers the connection it
allowed and lets the reply back automatically.

So you only write rules for **who starts the conversation**.

### Route table vs security group

| | Route table | Security group |
| --- | --- | --- |
| Attached to | a **subnet** | a **resource** |
| Reads | destination IP | IP + port + protocol |
| Answers | "which way out?" | "may these 2 talk at all?" |
| Rule types | routes only | **allow** only |
| Direction | one lookup | separate inbound and outbound |
| Remembers connections | n/a | **yes — stateful** |

**Both must pass.** A correct route with a closed group is dropped. An open group with no route
never leaves. **When something cannot connect in AWS, check this pair first.**

### The pattern to memorise

```
sg-alb        IN:  TCP 443   from 0.0.0.0/0
              OUT: TCP 8080  to sg-app

sg-app        IN:  TCP 8080  from sg-alb
              OUT: (default allow all)

sg-database   IN:  TCP 5432  from sg-app
              OUT: (nothing needed)
```

The internet reaches only the load balancer. The load balancer reaches only the app. The app
reaches only the database. **Nothing on the internet can reach the database, even by mistake,
because no rule names it.**

---

## Still owed

- Linux commands, file and group permissions, `chmod 600 key.pem`
- The full 2-AZ drawing, from memory
