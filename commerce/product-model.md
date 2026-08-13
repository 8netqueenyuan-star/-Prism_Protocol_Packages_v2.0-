# Product Model

## Purpose

This file is the product-level semantic anchor for Prism Commerce.

It defines what a Product is, how products relate to other commerce layers, and the interface between product objects and commercial mechanisms (pricing, licensing, membership, entitlement).

---

## 1. Core product objects

### Capability
An underlying reusable ability, method, workflow, or decision structure.
Capabilities exist conceptually before they are packaged as products.

### Product
A commercialized, validated, versioned unit derived from one or more capabilities.
A Product has:
- clear identity and audience
- defined problem and outcome
- version and lifecycle state
- governance and maintenance responsibility
- licensing conditions
- entitlement behavior

### SKU
The commercial identity of a Product in the marketplace.
Used to track pricing, licensing, access, and version for commerce operations.

### Bundle
A commercial grouping of multiple Products into a single offer.
Not automatically a new Product or Capability.

### Marketplace Listing
The catalog record of a Product or SKU once it is published in the marketplace.
A Product can exist without being listed.

---

## 2. Product lifecycle states

Products may exist in various maturity states:

- concept: early-stage capability
- prototype: tested capability
- deliverable: ready for use
- certified: passed review and gates
- active: published to marketplace
- sunset: phased out or deprecated
- suspended: temporarily unavailable

---

## 3. Product-to-Commerce layer interfaces

Products are the focal point for the commerce system. Other layers describe how products flow through:

| Layer | Responsibility | Interface |
| --- | --- | --- |
| Membership | Defines customer relationships and recurring access | Which membership levels can access which products |
| Licensing | Defines legal permission boundaries | What uses are allowed under each license type |
| Entitlement | Defines actual enabled access states | What each customer can do with each product now |
| Pricing | Defines commercial value and exchange | How products and bundles are priced |

---

## 4. Semantic boundaries

These are not the same:
- Capability ≠ Product
- Product ≠ SKU
- Product ≠ Listing
- Bundle ≠ Product
- Product objects ≠ Rights (licensing, entitlement)
- Product objects ≠ Pricing model
- Product objects ≠ Membership relationship

---

## 5. Applicability boundary

This file defines product object semantics and their relationship to pricing, licensing, membership, and entitlement layers.

It does not define the detailed structure of products (which is architectural or domain-specific) or operational details of other layers.

Detailed product structure and requirements are documented in relevant product packages or process documents.
