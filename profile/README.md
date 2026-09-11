<div align="center">

# ⚓ Naftiko

### The Agentic Integration Platform

**Declare your Agent Capability**. Stop hand-writing MCP servers and API integration glue. Give security a YAML spec to review *before* credentials are attached, and operations a Docker container to run.

[**Documentation**](https://shipyard.naftiko.io) · [**Playground**](https://shipyard.naftiko.io/playground) · [**Website**](https://naftiko.io)

</div>

---

## 🧭 What Naftiko does

Naftiko integrates data and APIs you already use into agent capabilities you can trust.

You don't replace your APIs. You don't rip-and-rebuild for AI. You take stock of what already exists, organize it into **capabilities**, and serve those capabilities as **MCP**, **Agent Skills**, and **REST** — from one declarative spec.

A capability is not an endpoint mirror. It is a coarse-grained, task-shaped piece of a domain: it `consumes` the HTTP APIs you have, and `exposes` them on the surfaces agents actually use.

## 🚧 What blocks agents from production

Demos are easy. The gap between a working prototype and an agent allowed near a system of record is where most agentic programs stall — and it is rarely the model's fault.

- 🛡️ **The security review** — nobody can say what an agent is able to reach *before* the credential is attached. So the review becomes weeks of argument instead of a read-through.
- 💸 **Cost** — trust gets the headlines, but cost is what stops agentic programs reaching production. Every turn re-sends a tool catalog nobody curated.
- 🕳️ **Over-broad credentials** — a token that can write to production hands the agent far more blast radius than the task needs.
- 👻 **Shadow MCP** — servers stood up per team, per vendor, outside any review, widening the surface faster than anyone maps it.
- 🌫️ **No shared meaning** — APIs and specs are everywhere, but nothing says which operations belong to a business capability, or who owns it.
- 🧭 **No shape for the context** — copilots and agents either lack what they need or drown in a 200-tool catalog. Agent Skills look like the answer, without anyone being sure why.
- ⚖️ **Misplaced risk** — leadership mandates AI; the teams absorb the consequences.

**Governance is emerging as an enabler, not a blocker.** Teams with review frameworks and risk tiering move from pilot to production *faster*, because leadership has something to say yes to.

## 🔐 Reaching business-critical systems safely

A capability is the artifact that makes the review possible. It is reviewable *before* it runs, and before a credential is bound to it.

- **Only what is declared can happen.** Undeclared fields cannot leak because they never project. The engine cannot improvise a call the spec does not contain.
- **The agent never holds the upstream credential.** `binds` keeps secrets on the engine side of the boundary — the credential that can write to production is never accessible to the model reasoning about what to do.
- **Least privilege is written down.** The reachable operations, the returned fields, and the scope authorizing exactly those sit in one file, in Git, versioned and diffable.
- **You approve what *could* happen.** Any approach lets you audit what already did. A declaration is the only one you can sign off in advance.
- **Telemetry when it runs.** OpenTelemetry traces and per-capability Prometheus metrics, attributable per operation.

> Identity propagation — token forwarding, identity context, and policy evaluation on the original caller — is on the roadmap, not shipped today.

## 🔀 The shift

| | The usual approach | With Naftiko |
|---|---|---|
| **Integration glue** | Hand-write auth, pagination, retries | Declare a capability in YAML |
| **MCP servers** | Hand-write one (FastMCP, Spring AI) | Emit MCP from the same spec |
| **Endpoint mirrors** | Generate a 1:1 200-tool dump | Shape one domain capability |
| **Composition** | One generic server per provider, bolted together | Compose source capabilities into an applied one |
| **Approval** | Nobody can say what the agent can reach | The reachable operations, returned fields, and credential scope are in a file security can read first |

> **Everyone else shrinks the context. We make most of it unnecessary.**

Imperative approaches decide at runtime — in an optimizer, a retrieval index, a generated program — and leave no artifact behind. A declaration decides once, in a file: the tools the agent sees, the fields that come back, and the credential authorizing exactly those. The agent may well have drafted that file. What matters is that a human saw it in between.

## 📜 Spec-Driven Integration

**SDI** is the method the platform runs on. One declarative YAML spec, authored once, validated deterministically, executed deterministically, and carried onto the surfaces your teams already use.

Developers need **YAML**, **JSONPath**, and **Mustache** — no Java required unless you're extending the engine itself. Sandboxed JavaScript, Python, and Groovy are there when a mapping needs more than a template.

```yaml
ikanos: "1.0.0-beta5"

info:
  display: Hello Shipyard
  description: A minimal MCP capability that greets you back.

capability:
  exposes:
    - type: mcp
      port: 3001
      namespace: hello-tools
      tools:
        greet:
          description: "Greet a user by name"
          inputParameters:
            who:
              type: string
              required: true
          outputParameters:
            - name: message
              type: string
              value: "Hello, {{who}}! Welcome to the Shipyard."
```

### ⚡ From API to agent context in three steps

```bash
ikanos import openapi petstore.yaml   # skeleton capability from an API you already own
polychro lint capability.yml          # deterministic validation, sub-100 ms, in-process
ikanos run capability.yml             # MCP + Skill + REST from the same spec
```

## 🚢 Two open source engines, one platform, one spec

Two Apache 2.0 engines do the work. Three components carry the same reviewed spec, with its governance intact, onto the IDE, the portal, and the cluster.

| Repository | What it is | Availability |
|---|---|---|
| [**ikanos**](https://github.com/naftiko/ikanos) | **Capability Engine** — serves a Naftiko spec as MCP, Skill, and REST from a single deployment, plus a Control port for ops. | **Apache 2.0** |
| [**polychro**](https://github.com/naftiko/polychro) | **Capability Linter** — deterministic AI-era validation for capability YAML and for YAML, JSON, XML, Markdown, and HTML specs. The new Spectral for SDI. | **Apache 2.0** |
| [**fleet**](https://github.com/naftiko/fleet) | The three components that carry a reviewed spec onto the IDE, the portal, and the cluster. | Freeware EULA · Commercial |

The Fleet is three independently usable components, not one binary. Adopt any of them on its own; none requires the others, and all three rely on the two Apache 2.0 engines underneath.

- **VS Code Extension** — schema-driven completion for capability YAML and live linting as you type, in VS Code, Cursor, Windsurf, and Zed. *Crafter · free in every edition.*
- **Backstage Integration** — scaffold a capability from a software template, register it and its provided API in the catalog, and keep that API in sync from Git. *Warden · Enterprise.*
- **Kubernetes Integration** — a `Capability` CRD reconciled into a running workload, with SHA-256 spec-drift detection, stop/restart, and Prometheus wiring. *Skipper · Enterprise.*

> **Shipyard** is the Naftiko developer center — the documentation hub plus the hosted Playground, where you can run the tutorials in the browser with nothing installed. It backs every edition.

### ✨ Four properties every capability gets

- **Discoverable** — humans and agents can find what exists before rebuilding it.
- **Policy-driven** — blocking and advisory rules at validation, in CI, and at Kubernetes admission.
- **Composable** — right-sized units with clearer contracts, assembled into MCP servers, copilots, and agent workflows.
- **Observable** — OpenTelemetry traces and per-capability Prometheus metrics, with cost attribution.

## 🔌 One capability, many protocols

A single spec is exposed simultaneously from one Ikanos deployment. The agent-facing surfaces come first, because the spec *is* the context.

- 🤖 **MCP** — tools, resources, and prompts over streamable HTTP or stdio.
- 📄 **Agent Skills** — downloadable skill folders with `SKILL.md` prompt integration.
- 🌐 **REST** — clean endpoints with per-operation path, method, and parameter mapping.
- 🛣️ **A2A** — Google's Agent-to-Agent protocol. *On the roadmap, not yet shipped.*

## 🚀 Get started

Nothing to install: run the tutorials in the [**Playground**](https://shipyard.naftiko.io/playground).

To work locally, pick a distribution and follow the [**installation guide**](https://shipyard.naftiko.io/fleet/getting-started/installation/), then the [**quickstart**](https://shipyard.naftiko.io/fleet/getting-started/quickstart/).

| What | How you get it |
|---|---|
| **Capability Engine** | Native CLI — single binary for Linux, macOS, and Windows, no JVM. Or the `ghcr.io/naftiko/ikanos` Docker image. |
| **Capability Linter** | Native CLI — single binary for Linux, macOS, and Windows. Also an embeddable Java library, SDKs for Go, Node.js, and Python, an MCP server, and a GitHub Action with SARIF output. |
| **VS Code Extension** | [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=Naftiko-Inc.crafter) — also Cursor, Windsurf, and Zed. |
| **Backstage Integration** | npm package on GitHub Packages, plus a software template. *Enterprise.* |
| **Kubernetes Integration** | OCI Helm chart and a `Capability` CRD. *Enterprise.* |

The CLI is the fastest way in — author, validate, and run without leaving the file:

```bash
ikanos import openapi petstore.yaml     # skeleton capability from an API you already own
polychro lint capability.yml            # deterministic validation, sub-100 ms
ikanos run capability.yml               # MCP + Skill + REST on one process
```

### 🎓 Four tutorial tracks

Every track builds on *Shipyard*, a fictional maritime company, and each one stands alone.

1. **Context Engineering** — go from mock to live MCP tools against a real Maritime Registry API. *(30–45 min)*
2. **API Reusability** — Skill groups, aggregates with `ref:`, and a parallel REST adapter. One capability, three doors. *(30 min)*
3. **API Orchestration** — a multi-source Fleet Manifest with orchestrated `steps`, `lookup` joins, and shared `consumes`. *(30 min)*
4. **Platform Operations** — linting in CI, observability via the Control port, multi-environment binds. *(20 min)*

## 📦 Editions

| Edition | What it adds | Status |
|---|---|---|
| **Community** | The full author → lint → run inner loop, self-hosted forever. Ikanos + Polychro under Apache 2.0, plus the free Crafter extension. | ✅ Free forever · available now |
| **Developer** | Managed hosting for prototypes and demos. Push a capability, get a live endpoint, pay only while it serves. | 🚧 In development |
| **Team** | Managed hosting for production. Always-warm instances, higher throughput, backed by an SLA. | 🚧 In development |
| **Enterprise** | Everything in Team, plus Warden and Skipper, dedicated tenancy, domain dashboards, and RBAC. | 🗓️ Design partners · H2 2026 |

Licensing in short: **Ikanos and Polychro are Apache 2.0 in every edition.** Crafter and the docs hub ship under the Naftiko Freeware EULA. Warden, Skipper, and the hosted services are covered by the Naftiko Commercial License.

## 💡 Why Naftiko

- **Maximize existing investments** — your data and APIs are not technical debt, they are your strategic inventory.
- **Capabilities, not just endpoints** — AI doesn't need endpoints, it needs capabilities that are spec-driven.
- **Approved before it runs** — you can audit what happened with any approach; only a declaration lets you approve what *could* happen, before the credential is attached.
- **Meet teams where they are** — reuse shows up in the IDE and the copilot workflow, not in a catalog nobody opens.
- **Keep your runtime** — replace the hand-written glue. When the MCP transport revises, it's an engine bump; the capability spec is unchanged.
- **Open by default** — the engines are Apache 2.0.

## 📣 Status and community

Naftiko is in beta; the specification is getting stable, and we say so in the [release notes](https://shipyard.naftiko.io/fleet/releases/) and on the [roadmap](https://shipyard.naftiko.io/fleet/roadmap/).

Naftiko operates from Paris and Philadelphia.
