# Naftiko

**Naftiko turns your existing data and APIs into a governed capability Fleet you can command for context engineering and agent orchestration.**

You don't replace your APIs. You don't rip-and-rebuild for AI. You take stock of what already exists, organize it into capabilities, and make it usable by humans *and* machines across every domain in your business.

## Start Here — Land in the Shipyard

[**Naftiko Shipyard**](https://shipyard.naftiko.io) is the documentation hub and public front door for the entire Naftiko Fleet. It lands new readers on the **Spec-Driven Integration (SDI)** thesis, walks you through the six components of the Fleet, and routes you into the right tutorial track depending on the pain that brought you in.

## The Problem

- APIs are everywhere, but not always being used
- Specs exist, but no shared meaning
- MCP servers popping up in ad hoc ways
- Copilots and agents lack the context they need
- Agent Skills seem like the solution, without fully knowing why
- Leadership mandates AI, teams are absorbing the risk

## The Naftiko Fleet — Six Components, All at v1.0.0-alpha3

| Component | Purpose | License |
|---|---|---|
| **[Shipyard](https://github.com/naftiko/shipyard)** | Documentation hub — soon a hosted Playground and AI-assisted Ask Navi search across the whole corpus | OSS docs |
| **[Ikanos](https://github.com/naftiko/ikanos)** | The OSS capability engine — runs a Naftiko spec as a multi-protocol server | **Apache 2.0** |
| **[Polychro](https://github.com/naftiko/polychro)** | The OSS deterministic AI-era linter for YAML, JSON, and Markdown specs | **Apache 2.0** |
| **[Crafter](https://shipyard.naftiko.io/docs/1.0.0-alpha3/fleet/crafter/)** | The capability builder for VS Code and most AI IDEs — visual + spec-driven authoring (the new Spectral for SDI) | Fleet edition |
| **[Warden](https://shipyard.naftiko.io/docs/1.0.0-alpha3/fleet/warden/)** | Capability governance and policy enforcement for Backstage | Fleet edition |
| **[Skipper](https://shipyard.naftiko.io/docs/1.0.0-alpha3/fleet/skipper/)** | Fleet-wide orchestration for Kubernetes — teams, regions, compliance domains | Fleet edition |

**Ikanos and Polychro are committed to staying 100% Apache 2.0 in every edition of the Fleet.**

## Spec-Driven Integration (SDI)

SDI is the methodology that ties Ikanos, Polychro, Crafter, Warden, and Skipper together. Every integration is a declarative specification first — authored once in YAML, validated by a deterministic linter, executed by a deterministic engine, governed by deterministic policy, and orchestrated across the Fleet. One spec, six tools, every protocol surface (REST + MCP + Skill) from the same definition.

Developers only need to know **YAML**, **JSONPath**, and **Mustache** templates to define capabilities — no Java required unless extending the engine itself.

| Feature | Description |
|---|---|
| Spec-Driven | Declare capabilities entirely in **YAML** |
| Multi-Protocol Servers | Expose capabilities via **MCP**, **Skill**, and **REST** from the same spec |
| Data Format Conversion | Transform **Protobuf**, **XML**, **YAML**, **CSV**, and **Avro** payloads into JSON |
| HTTP API Consumption | Connect to any HTTP-based API with built-in authentication support |
| Templating & Querying | **Mustache** templates and **JSONPath** expressions for flexible data mapping |
| AI Native | Built for context engineering and agent orchestration from the ground up |
| Docker Native | Ships as ready-to-run **Docker** containers |
| Extensible | Open-source core extensible with new protocols and adapters |

## Four Tutorial Tracks Mapped to Four Buyer Pains

Shipyard organizes its tutorials around the four pains the Fleet exists to solve:

- **Track 1 — Context Engineering** *(published)* — Design for MCP, then wire the APIs.
- **Track 2 — API Reusability** *(next)* — Turn old API investment into new experiences.
- **Track 3 — Agent Orchestration** *(scoped)* — Deterministic flows over non-deterministic models.
- **Track 4 — Platform Operations** *(scoped)* — Running the Fleet across teams and regions.

Each track answers one of the four pains: **API sprawl**, **AI agents drifting / hallucinating / breaking contracts**, **context fragmentation for AI tasks**, and **integration boilerplate**.

## Three Layered Editions

- **Community** — Free forever for personal and internal business use; ships every component; Ikanos and Polychro fully Apache 2.0.
- **Standard** *(planned)* — Team-grade premium features for Shipyard, Crafter, Warden, and Skipper, under the Naftiko Commercial License.
- **Enterprise** *(planned)* — Governance and scale features for regulated environments.

The editions are **layered, not exclusive** — anything authored in Community runs unchanged in Standard or Enterprise. Capability YAML, rulesets, and policies are forward-compatible.

## Naftiko Signals — The Intelligence Layer

[**Naftiko Signals**](https://signals.naftiko.io) is the open intelligence platform that reads the public footprint of every enterprise — public job postings, press releases, newsroom content, and open-source activity — into a structured signal corpus that maps how the Fortune 1000 is investing across AI, APIs, cloud, integration, governance, and operations.

## Roadmap

- **Alpha 4 (mid-June 2026)** — MCP trust propagation, API-gateway integration (CORS, OpenTelemetry context propagation, mTLS, HTTP cache-control), first A2A server adapter with native Langchain4j integration.
- **Beta 1 (end of June 2026)** — Stable MVP across the Fleet: interactive MCP Apps, server-side code-mode for MCP, client-SDK generation across TypeScript / Python / Java / Go, authorization via Open Policy Agent. Shipyard Playground and Ask Navi search land on the same train.
- **General Availability (September 2026)** — Production-ready v1.0 across the Fleet; JSON Schema published to JSON Schema Store.

The full plan is public: [Framework Roadmap](https://github.com/naftiko/framework/wiki/Roadmap) · [Fleet Roadmap](https://github.com/naftiko/fleet/wiki/Roadmap) — both updated weekly, cross-linked from Shipyard.

## Why Naftiko

- **Maximize Existing Investments** — Your data and APIs are not technical debt, they are your strategic inventory.
- **Capabilities, Not Just Endpoints** — AI doesn't need endpoints, it needs capabilities that are spec-driven.
- **Governed AI Integration at Scale** — AI integration without governance does not scale and does not survive.
- **Meet Teams Where They Are** — Reusability shows up in the IDE; governance is seamless guidance.
- **Open by Default** — Ikanos and Polychro are Apache 2.0 in every edition. Signals is open data, versioned in Git.

## Get Involved

- **Website** — [naftiko.io](https://naftiko.io/)
- **Blog** — [naftiko.io/blog](https://naftiko.io/blog/)
- **Discussions** — [github.com/orgs/naftiko/discussions](https://github.com/orgs/naftiko/discussions)
- **Newsletter** — [naftiko.io/newsletter](https://naftiko.io/newsletter)
- **LinkedIn** — [linkedin.com/company/naftiko](https://www.linkedin.com/company/naftiko/)
- **YouTube** — [youtube.com/@Naftiko](https://www.youtube.com/@Naftiko)
- **Contact** — [naftiko.io/contact-us](https://naftiko.io/contact-us)

Naftiko operates from Paris and New York City.
