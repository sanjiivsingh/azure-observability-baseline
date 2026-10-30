# Azure Observability Baseline (Terraform)

[![Status](https://img.shields.io/badge/Status-Statically%20Validated-informational.svg)](#)
[![Terraform CI](https://github.com/sanjiivsingh/azure-observability-baseline/actions/workflows/ci.yml/badge.svg)](https://github.com/sanjiivsingh/azure-observability-baseline/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Production-ready Terraform module for centralizing Azure telemetry: Log Analytics workspace, automated daily ingestion cap alerts, reusable diagnostic settings, and curated KQL query packs.

---

## 🏛️ Architecture Overview

```mermaid
flowchart TD
    subgraph LandingZones["🏢 Workloads & Landing Zones"]
        AKS["Azure Kubernetes Service"]
        APIM["API Management"]
        FW["Azure Firewall"]
        KV["Azure Key Vault"]
    end

    subgraph CentralObs["📊 Observability Platform"]
        DS["Diagnostic Settings Module"]
        LAW["Central Log Analytics Workspace (30-day retention)"]
        CAP["Daily Cap & Ingestion Monitor"]
        AG["Action Group (On-Call Alerting)"]
    end

    AKS -->|Logs & Metrics| DS
    APIM -->|Request Telemetry| DS
    FW -->|Network & App Rules| DS
    KV -->|Audit Events| DS

    DS --> LAW
    LAW --> CAP
    CAP -->|Threshold Alert (80%)| AG
```

---

## 🌟 Key Features

- **Centralized Telemetry**: Consolidated Log Analytics workspace compliant with CAF landing zone recommendations.
- **Cost Guardrails**: Hard daily ingestion limit (`5 GB/day`) with metric alerts at 80% to eliminate bill shock.
- **Diagnostic Settings Module**: Reusable child module (`modules/diagnostic_settings`) to attach any Azure resource to central logging.
- **KQL Pack**: Production queries for audit logging, failed logins, AKS crash-looping containers, and cost spikes.

---

## 🚀 Quickstart

### Prerequisites
- Terraform `>= 1.9.0`
- Azure CLI `>= 2.60.0`
- Azure Subscription Reader/Contributor role

### Deployment
```bash
git clone https://github.com/sanjiivsingh/azure-observability-baseline.git
cd azure-observability-baseline

terraform init
terraform plan -out=tfplan
terraform apply tfplan
```

---

## 💰 Cost Estimate & Teardown

- **Monthly Cost**: Baseline cost is ~$0.10/month idle. Ingestion is usage-based at $2.30/GB beyond the initial free 5 GB/month tier.
- **Teardown**:
  ```bash
  terraform destroy -auto-approve
  ```

---

## 🔒 Security & Support
See [SECURITY.md](SECURITY.md) and [ARCHITECTURE.md](docs/ARCHITECTURE.md).
