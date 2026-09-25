# How does data go from one place to another

---

The most basic structure for a design is a client-server structure.

Client talk to server, server checks the DB, gets some data, and this response is sent back to the client

# What is an IP address:

IP stands for Internet Protocol, its main function is to define a unique identifier so we can route packets through the network.

A packet is the smallest unit of information possible, could be 1s and 0s.

The full path for how a user can access a web application:

1. User enters the website in a web browser
2. Browser talks to the DNS server to see if address is registered
3. If address is registered, it will return the website's IP address bacl to the client
4. If no address is registered, it will return a not found error
5. Once browser knows the IP address, it will make a request directly to that address
6. Address could be a server
7. An API gateway
8. A proxy
9. Server gets the request, process data
10. Sends it back to the client

# DNS

Domain Name System. It consist of a record of IP addresses that are registered, its main function is to translate human readable URLs into IP addresses for the browser to know where to talk to.

# Proxy.

A proxy is a server that sits between the client and an application server.

- Forward proxy sits in front of the client, and its useful to protect the client from accessing or making certain actions. For example a school could have a forward proxy to restrict certain websites.
- Reverse proxy sits in front of the application server. It helps protect the application from what clients send, could be rate limiting, protecting the app's direct IP address, load balancing the requests, etc.

Proxies provide a common point for access rules and traffic control.

# Latency.

Latency means the amount of time it takes from a client request to its response. Network travels, computation, queues, it all sums up.

# HTTPs <> HTTP.

HTTP is a protocol. A protocol is a series of practices that need to be followed in order to comply with something.

The internet works through different protocols. Each protocol acts on different layers of the OSI model for how information travels across the web.

HTTP does not use encryption, port 80

HTTPs does act a security layer by adding SSL/TLS encryption

# NOTES:

- How should you choose a cache timeout that respects both the redirect target and database capacity?
    - We need to inspect the overall redirect target, it contains several processes, not just the cache interaction
    - We should see what is the average performance for our cache and set a timeout that can also deal with a peak traffic (double the timeout for a usual cache request?)
