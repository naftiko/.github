# Naftiko

**Naftiko turns your existing data & APIs into a governed capability fabric for context engineering and agent orchestration.**

You don't replace APIs. You don't rip-and-rebuild for AI. You take stock of what already exists, organize it, and make it usable by humans *and* machines across business domains in repeatable ways.

## The Problem

- APIs are everywhere, but not always being used
- Specs exist, but no shared meaning
- MCP servers popping up in ad hoc ways
- Copilots and agents lack the context they need
- Agent Skills seem like the solution, without fully knowing why
- Leadership mandates AI, teams are absorbing the risk

## What Naftiko Does

- APIs, data, and tools grouped as **capabilities** — the right-sized unit of reuse for spec-driven integration
- Capabilities are declared using YAML, configuring the Naftiko Engine provided as a Docker container
- Converts data formats like Protocol Buffer, XML, YAML, CSV, and Avro into JSON for better context engineering
- MCP servers and Agent Skills are standardized, discoverable, and governed
- Agents operate within policy, cost, and trust boundaries
- AI progress compounds instead of fragmenting

## Naftiko Framework

[Naftiko Framework](https://github.com/naftiko/framework) is the first open-source project for Spec-Driven Integration. Developers only need to know YAML, JSONPath, and Mustache templates to define capabilities — no Java or other code required unless extending the framework itself.

| Feature | Description |
|---|---|
| Spec-Driven | Declare capabilities entirely in **YAML** — no Java required |
| Multi-Protocol Servers | Expose capabilities via **MCP**, **SKILL**, or **REST** servers out of the box |
| Data Format Conversion | Transform **Protobuf**, **XML**, **YAML**, **CSV**, and **Avro** payloads into JSON |
| HTTP API Consumption | Connect to any HTTP-based API with built-in authentication support |
| Templating & Querying | Use **Mustache** templates and **JSONPath** expressions for flexible data mapping |
| AI Native | Designed for Context Engineering and Agent Orchestration |
| Docker Native | Ships as a ready-to-run **Docker** container |
| Extensible | Open-source core extensible with new protocols and adapters |

### Quick Start

```bash
docker pull ghcr.io/naftiko/framework:v0.5
docker run -p 8081:8081 -v /path/to/capability.yaml:/app/capability.yaml ghcr.io/naftiko/framework:v0.5 /app/capability.yaml
```

Follow the [Tutorial](https://github.com/naftiko/framework/wiki/Tutorial) to build your first capability.

- [Installation](https://github.com/naftiko/framework/wiki/Installation)
- [Specification](https://github.com/naftiko/framework/wiki/Specification)
- [Use Cases](https://github.com/naftiko/framework/wiki/Use-Cases)
- [Releases](https://github.com/naftiko/framework/wiki/Releases)
- [Roadmap](https://github.com/naftiko/framework/wiki/Roadmap)
- [FAQ](https://github.com/naftiko/framework/wiki/FAQ)

## Naftiko Fleet

[Naftiko Fleet](https://github.com/naftiko/fleet) is the leading product for Spec-Driven Integration, available as a Community Edition with upcoming Standard and Enterprise editions.

- **Naftiko Framework** — The core open-source technology to create and run capabilities
- **VS Code Extension** — A [Naftiko extension for VS Code](https://github.com/naftiko/fleet/wiki/VS-Code-usage) to help you edit Naftiko files
- **Backstage Templates** — [Backstage integrated templates](https://github.com/naftiko/fleet/wiki/Backstage-usage) via Docker for creating new projects, services, or resources from pre-defined templates

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
