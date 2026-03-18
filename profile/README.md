# Naftiko

**Naftiko turns your existing data & APIs into a governed capability fabric for context engineering and agent orchestration.**

You don't replace APIs. You don't rip-and-rebuild for AI. You take stock of what already exists, organize it, and make it usable by humans *and* machines across business domains in repeatable ways.

## The Problem

- APIs are everywhere, but not always being used
- Specs exist, but no shared meaning
- MCP servers popping up in ad hoc ways
- Copilots and agents lack the context they need
- Leadership mandates AI, teams are absorbing the risk

## What Naftiko Does

- APIs, data, and tools grouped as **capabilities** — the right-sized unit of reuse for spec-driven integration
- Capabilities are declared using YAML, configuring the Naftiko Engine provided as a Docker container
- Converts data formats like Protocol Buffer, XML, YAML, CSV, and Avro into JSON for better context engineering
- MCP servers and Agent Skills are standardized, discoverable, and governed
- Agents operate within policy, cost, and trust boundaries

## Naftiko Framework

[Naftiko Framework](https://github.com/naftiko/framework) is the first open-source project for Spec-Driven Integration. Developers only need to know YAML, JSONPath, and Mustache templates to define capabilities — no Java or other code required unless extending the framework itself.

- [Specification](https://github.com/naftiko/framework/wiki/Specification)
- [Roadmap](https://github.com/naftiko/framework/wiki/Roadmap)

### Quick Start

```bash
docker pull ghcr.io/naftiko/framework:v0.5
docker run -p 8081:8081 -v /path/to/capability.yaml:/app/capability.yaml ghcr.io/naftiko/framework:v0.5 /app/capability.yaml
```

Follow the [Tutorial](https://github.com/naftiko/framework/wiki/Tutorial) to build your first capability.

## Why Naftiko

- **Maximize Existing Investments** — Your data and APIs are not technical debt, they are your strategic inventory
- **Capabilities, Not Just Endpoints** — AI doesn't need endpoints, it needs capabilities that are spec-driven
- **Governed AI Integration at Scale** — AI integration without governance doesn't scale and doesn't survive
- **Meet Teams Where They Are** — Reusability shows up in IDEs, governance is seamless as guidance

## Get Involved

- [Website](https://naftiko.io/)
- [Blog](https://naftiko.io/resources)
- [LinkedIn](https://www.linkedin.com/company/naftiko/)
- [YouTube](https://www.youtube.com/@Naftiko)
- [Bluesky](https://bsky.app/profile/naftiko.bsky.social)
- [Discussions](https://github.com/orgs/naftiko/discussions)
- [Newsletter](https://naftiko.io/newsletter)
- [Contact Us](https://naftiko.io/contact-us)
