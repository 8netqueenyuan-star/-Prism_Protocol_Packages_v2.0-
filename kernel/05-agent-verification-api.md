# Agent Verification Protocol Interface / Contract

> This document defines a protocol-level verification contract. It does not imply the existence of a production API, SDK, npm package, endpoint, or runtime implementation.

## 1. Purpose

This document establishes the verification layer for agent behavior and agent output within the Prism Protocol architecture. It is a compatibility layer for v2.1 and does not replace the existing v2.0 kernel authority.

The verification contract exists to evaluate:

- whether an agent's intention is aligned with its declared mission
- whether it remains within authority and privacy boundaries
- whether it recognizes risk and escalation triggers
- whether generated output is safe, truthful, and appropriate for the scenario

## 2. Compatibility with existing kernel

This verification layer remains compatible with the existing OEIA Kernel defined in:

- `kernel/00_OEIA_Core_Protocol.md`
- `kernel/01_Watcher_Scales.md`
- `kernel/02-tension-diagnostic.md`
- `kernel/03-action-orchestrator.md`
- `kernel/04-synthesis-protocol.md`

The verification contract does not redefine OEIA, Watcher Scales, Tension Diagnostic, Action Orchestrator, or Synthesis. It operates as a protocol overlay that can be used by an Adapter or a product package without changing the semantic authority of the v2.0 kernel.

## 3. Contract overview

The protocol defines four verification functions:

- `verify_intention()`
- `verify_boundary()`
- `verify_risk()`
- `verify_output()`

These functions are contract-level validation operations. They describe the required semantics and decision pathways, not a runtime service implementation.

## 4. Verification function contract

### 4.1 `verify_intention()`

#### Purpose
Determine whether an agent's declared intention, objective, and message framing are aligned with the stated mission and the receiving context.

#### Input signature
`verify_intention(agent_context, intention_manifest, user_request, conversation_history)`

#### Input fields
- `agent_context`: identity, role, system description, agent type
- `intention_manifest`: declared purpose, allowed objectives, prohibited objectives
- `user_request`: immediate request or task submitted to the agent
- `conversation_history`: recent context needed to understand drift or mission creep

#### Output format
```json
{
  "function": "verify_intention",
  "status": "pass|review|fail",
  "confidence": 0.0,
  "evidence": ["observed signals"],
  "issues": ["risk or mismatch findings"],
  "decision": "proceed|human_review|required_redirection"
}
```

#### Decision semantics
- `pass`: intention aligns with purpose and is within allowed objectives.
- `review`: intention is broadly aligned but ambiguous or weakly evidenced.
- `fail`: intention contradicts purpose, mission drift, or malicious objective.

#### Latency target
- Target: sub-second protocol evaluation for text-only request evaluation.
- Operational note: this is a protocol target, not a production service guarantee.

#### Failure modes
- missing intention manifest
- contradictory purpose statements
- mission drift across repeated turns
- hidden objective not present in the declared scope

#### Compatibility requirements
- must remain compatible with OEIA decision sequence and watcher-level boundary checks
- must not reinterpret the v2.0 semantic definitions of OEIA or Adapter

#### Version
- `v2.1.0-contract`

#### Human-review fallback
Trigger human review when the intention is ambiguous, high stakes, or contradicts a declared boundary or mission.

---

### 4.2 `verify_boundary()`

#### Purpose
Check whether the agent remains within its authority, scope, and responsibility boundaries.

#### Input signature
`verify_boundary(agent_context, boundary_rules, request_scope, user_data)`

#### Input fields
- `agent_context`: role, permissions, and stated domain boundaries
- `boundary_rules`: domain restrictions, escalation triggers, privacy rules
- `request_scope`: requested action or decision class
- `user_data`: sensitive or regulated data involved in the request

#### Output format
```json
{
  "function": "verify_boundary",
  "status": "pass|review|fail",
  "authorized": true,
  "boundary_hits": ["rule names"],
  "decision": "proceed|escalate|refuse"
}
```

#### Decision semantics
- `pass`: task falls within authorized scope and boundaries.
- `review`: request may be adjacent to a boundary but does not clearly violate it.
- `fail`: task exceeds authority, privacy, or professional scope.

#### Latency target
- Target: sub-second protocol evaluation for routine boundary checks.

#### Failure modes
- overstepping authority
- data handling beyond approved scope
- offering professional advice outside role
- treating a boundary as optional when it is mandatory

#### Compatibility requirements
- must preserve existing Adapter and OEIA semantics
- must not create a new definition of authority beyond the repository's existing governance language

#### Version
- `v2.1.0-contract`

#### Human-review fallback
Escalate to a human when a boundary conflict affects privacy, finance, legal exposure, or high-risk decision-making.

---

### 4.3 `verify_risk()`

#### Purpose
Assess whether the agent response or requested action demonstrates identifiable risk signals that should trigger caution, redirection, or escalation.

#### Input signature
`verify_risk(agent_context, risk_triggers, proposed_response, user_context)`

#### Input fields
- `agent_context`: role and authority level
- `risk_triggers`: observable risk categories and trigger conditions
- `proposed_response`: content, wording, action recommendations, or escalation steps
- `user_context`: emotional state, urgency, vulnerability, or sensitivity indicators

#### Output format
```json
{
  "function": "verify_risk",
  "status": "pass|review|fail",
  "risk_level": "low|moderate|high",
  "trigger_categories": ["manipulation", "privacy_violation"],
  "decision": "proceed|defer|escalate"
}
```

#### Decision semantics
- `pass`: no material risk indicators.
- `review`: some risk cues but not clearly disqualifying.
- `fail`: explicit coercion, deception, manipulation, unsafe escalation, discriminatory output, or privacy violation.

#### Latency target
- Target: sub-second for standard rule-based checks.

#### Failure modes
- manipulation or coercive framing
- inappropriate authority claims
- deceptive reassurance or false certainty
- escalation bypass
- privacy leakage or harmful disclosure

#### Compatibility requirements
- the risk model must remain consistent with the repository's Watcher Scales and the principle of naming rather than denying risk
- it must not replace professional judgement with a fictional automated decision engine

#### Version
- `v2.1.0-contract`

#### Human-review fallback
Escalate for any high-risk indicators involving harm, coercion, legal exposure, or sensitive personal data.

---

### 4.4 `verify_output()`

#### Purpose
Evaluate whether the generated output is aligned with the task, the stated intention, and the relevant boundary and risk constraints.

#### Input signature
`verify_output(response_content, intention_manifest, boundary_rules, risk_triggers, brand_context)`

#### Input fields
- `response_content`: message or output to be reviewed
- `intention_manifest`: supposed objective and scope
- `boundary_rules`: applicable operational boundaries
- `risk_triggers`: signal list for dangerous content or patterns
- `brand_context`: stated brand, tone, or service promise the message should honor

#### Output format
```json
{
  "function": "verify_output",
  "status": "pass|review|fail",
  "alignment_score": 0.0,
  "evidence": ["specific output signals"],
  "decision": "accept|revise|reject|human_review"
}
```

#### Decision semantics
- `pass`: output fits the declared role, is safe, and remains within bounds.
- `review`: output is mostly appropriate but needs revision or clarification.
- `fail`: output violates boundaries, misstates authority, manipulates emotion, or creates unsafe or dishonest behavior.

#### Latency target
- Target: sub-second evaluation for structured prompt outputs.

#### Failure modes
- mismatch between output and declared brand intent
- false empathy or false intimacy
- unsupported claims or guarantee language
- tone drift that exceeds the original mission

#### Compatibility requirements
- must remain compatible with the existing OEIA pattern of observation, explanation, intervention, and application
- must not rewrite the semantics of Product, SKU, Capability, or Adapter

#### Version
- `v2.1.0-contract`

#### Human-review fallback
Where output materially affects customer trust, legal exposure, financial decision-making, or safety, require human review before acceptance.

## 5. Shared contract rules

1. Protocol outputs are decision signals, not final legal or ethical verdicts.
2. Any high-risk or sensitive matter must trigger human review.
3. Verification is not a replacement for professional advice.
4. The contract does not assert a production runtime or service.
5. This document remains a v2.1 compatibility layer alongside the v2.0 kernel.

## 6. Versioning and status

- Contract version: `2.1.0-contract`
- Status: `protocol-draft`
- Authority: v2.0 kernel remains the semantic source of truth; this file defines a verification protocol overlay.

## 7. Final compatibility statement

This document defines a protocol-level verification contract. It does not imply the existence of a production API, SDK, npm package, endpoint, or runtime implementation.
