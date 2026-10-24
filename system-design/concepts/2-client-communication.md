# NOTES.

What is an API, API is application programming interface, it serves as the communication bridge between a client and a server, most common protocol used is REST API (Representational State Transfer), which defines a set of rules and best practices to make this effective.

The ones I remember were:

- Statefulness: Server should not store state
- HTTP methods: GET, POST, PUT, PATCH, DELETE
- Define routes properly ...

```
API is a contract between software components
```

Architectural API patterns

## REST

REST is the architecture style for how these APIs communicate with the software components.

- Resources have identifiers
- Each request contains the context that the server needs

What is a resource interface??

## GraphQL

Is an API query language, different than RestAPI, for graphQL we define only 1 endpoint and the client is making sure it is making the necessary requests

---

## WEB SOCKETS

own words: A web socket a communication protocol that allows 2 clients to be connected in a persistent constant connection.

A websocket is a communication happening between a client and a server, whats important about these ones is that connection remains open so it can exchange messages constantly

- 2 way connection: full-duplex
- Communication happens over a TCP connection

## WEB HOOKS

own words: A web hook is a piece of code/logic that a client sends over to the client to be executed?

Correction: A webhook is a URL that a server registers and that receives a message whenever an event is completed.

- Its the opposite of a normal HTTP request, where the client sends a request to the server.
- In a web hook, the server sends a message to the client via the URL that it got registered.
- Example: Food delivery app, once the order is completed, the app sends a message to the URL registered (this is the web hook) to indicate that an event occured (order started, delivery on the way, delivered)

---

## API Gateway.

An API gateway is a form of proxy server. It is a server that sits in front of the backend to receive requests and redirect them over to the inner part of the server.

- Common entry point for requests
- Open world only knows the API GW's IP address.
- It may add latency
- it adds rate limiting
- monitoring
- routing: sends requests to the right service
- Not related to a load balancer, often work alongside

## Rate limiting.

It is the process of setting a limit to the amount of requests that a server receives, mostly for security purposes

## Idempotency.

It is a mathematical property where one result is returned no matter how many times the request happens.
