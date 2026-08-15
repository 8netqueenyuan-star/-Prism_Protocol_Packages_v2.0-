# Verification Pricing — Draft v0.1

> This document is a proposed commercial model for agent verification services and is not a validated market price list. Pricing is provisional and subject to future validation, implementation requirements, and formal customer agreements.

## 1. Purpose

This document describes a draft commercial structure for the Agent Verification capability in Prism. It does not redefine the semantics of Capability, Product, or SKU. Instead, it uses the existing product semantics from `commerce/product-model.md` as the semantic authority.

The conceptual relationship is:

```text
Capability
    ↓
Agent Verification
    ↓
Product
    ↓
Verification Audit
    ↓
SKU
    ↓
Pricing
```

## 2. Semantic ownership

This draft does not redefine the repository's existing Product, SKU, or Capability semantics. Those concepts remain governed by:

- `commerce/product-model.md`

The pricing proposal only describes a draft commercial model for a verification-oriented product concept aligned to the repository's product architecture.

## 3. Verification Credit

A Verification Credit is a draft accounting unit used to represent a bounded unit of verification work.

### What one credit represents

One credit represents a single verification pass for a defined output or decision context, including consideration of:

- intention alignment
- boundary checks
- risk evaluation
- output quality review

### What consumes credits

Credits may be consumed by:

- a single verification request
- a batch of related checks within one review scope
- a staged review requiring multiple verification calls within the same workflow

### Does it correspond to verification operations?

Yes, in a draft sense: credits correspond to protocol-level verification operations, not to any actual installed runtime or service endpoint.

### Limitations

- This is a non-binding accounting abstraction.
- It does not imply a production metering system.
- It does not guarantee demand, usage, or commercial viability.

### Accounting assumptions

- Verification work is counted by review scope and complexity, not by token usage.
- The model assumes a bounded review workflow rather than an unbounded monitoring service.
- The model is intentionally preliminary and should be reviewed before any commercial commitment.

## 4. Audit Tiers — Draft Commercial Tiers

The following tiers are proposed only and are not validated market pricing.

### 4.1 Basic

Purpose: small-volume, individual, or low-complexity verification use.

Typical usage:
- single agent output review
- mild risk review context
- bounded customer support scenarios

Status: draft tier

### 4.2 Pro

Purpose: routine team or service workflow verification.

Typical usage:
- repeated review loops across workflows
- customer service and internal ops review
- structured validation with human escalation support

Status: draft tier

### 4.3 Enterprise

Purpose: organization-level governance, policy checks, and multi-team usage.

Typical usage:
- multiple teams or departments
- higher risk service contexts
- formal review and escalation protocols
- governance and monitoring responsibilities

Status: draft tier

## 5. Adapter License — Draft Annual Model

A proposed annual license model may be used to authorize an adapter or verification package for designated organizational use.

This is not a validated market price and does not represent a formal legal quotation.

### Proposed structure

- Annual license for the verification adapter and associated validation prompts
- Renewal tied to version review, governance review, and documentation updates
- Scope includes internal use within designated teams or service units
- Human escalation remains required for high-risk or regulated contexts

### License assumptions

- proposed annual pricing is based on usage scope, team size, and governance complexity
- only the internal operating scope is licensed, not the underlying kernel authority
- license rights do not replace ownership of the semantic kernel definitions

## 6. Commercial boundary

This draft does not establish final product pricing, market value, or binding commercial obligations. It should be read as a provisional proposal intended for architecture review and future validation.

## 7. Final note

Any actual commercial pricing, agreement, licensing schedule, or client commitment must be established through a separate formal process after this protocol is validated against real deployment requirements and governance constraints.
