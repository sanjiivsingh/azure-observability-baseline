# Architecture Decision Record (ADR) - Central Observability Baseline

## Context
Enterprise cloud architectures require centralized logging and telemetry aggregation to enforce security compliance, maintain operational visibility, and avoid fragmented monitoring silos across landing zones.

## Decisions

### 1. Centralized Log Analytics Workspace Architecture
- **Decision**: Single central Log Analytics Workspace per region and environment.
- **Rationale**: Enables unified cross-resource KQL querying, centralized retention policies, simplified Sentinel / SIEM connectivity, and consolidated billing tier benefits.

### 2. Daily Quota Guardrails
- **Decision**: Default daily ingestion cap set to 5 GB with proactive Sev-2 threshold alerts at 80% capacity.
- **Rationale**: Prevents unexpected ingestion bill runaway caused by runaway debug logs or chatty service metrics.

### 3. Modular Diagnostic Settings
- **Decision**: Separate child module (`modules/diagnostic_settings`) for uniform streaming configuration from AKS, APIM, Key Vault, and Azure Firewall.
- **Rationale**: Enforces standardized category logging across all spoke and platform resources without code duplication.
