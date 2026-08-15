# Agent Integration Guide

## Purpose

This document is intended for developers who want to understand how Agent Verification can conceptually integrate with the existing Prism Protocol architecture. It is not a partner-facing or sales document and does not define a production runtime.

## Important constraint

This repository does not contain a confirmed SDK, package, endpoint, or runtime implementation for Agent Verification. As a result, this guide provides a protocol-level integration example only.

> Protocol-level integration example
>
> Non-executable reference implementation.

## 1. Conceptual model

The verification layer is a contract that sits alongside the v2.0 kernel rather than replacing it. The conceptual flow is:

```text
Agent Output
    ↓
Verification Request
    ↓
verify_intention()
    ↓
verify_boundary()
    ↓
verify_risk()
    ↓
verify_output()
    ↓
Verification Result
```

## 2. Conceptual invocation example

```text
verify_intention(agent_context, intention_manifest, user_request, conversation_history)
verify_boundary(agent_context, boundary_rules, request_scope, user_data)
verify_risk(agent_context, risk_triggers, proposed_response, user_context)
verify_output(response_content, intention_manifest, boundary_rules, risk_triggers, brand_context)
```

This is a conceptual protocol invocation example only. It is not a runtime call signature for an installed package or service.

## 3. Three-minute quick start

1. Establish the agent's purpose and declared boundaries.
2. Check whether the requested interaction fits the role and domain.
3. Evaluate the likely risk triggers before the response is accepted.
4. Verify the final output for brand alignment, empathy, and boundary safety.
5. Route high-risk or sensitive situations to a human reviewer.

## 4. Conceptual integration sequence

A developer would integrate the verification layer by treating it as a decision gate:

- before sending a response, evaluate intention
- before proceeding further, verify boundary rules
- before final delivery, evaluate risk and output quality
- if any stage fails or is ambiguous, require human review

## 5. What the guide does not do

This guide does not:

- define an npm package name
- define a URL or endpoint
- define API keys or authentication flows
- prescribe an executable client library
- claim that a runtime service exists in this repository

## 6. Recommended developer stance

Treat this as a protocol contract for governance and validation planning. Do not convert a conceptual protocol into a runtime implementation until the repository has an actual implementation requirement and governing architecture.

## 7. Status

- Version: `v2.1.0`
- Status: `protocol-level integration only`
