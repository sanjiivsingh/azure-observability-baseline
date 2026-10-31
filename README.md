# 📊 Azure Observability Baseline (Terraform)

[![Terraform 1.9+](https://img.shields.io/badge/Terraform-1.9+-844FBA?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure Provider v4+](https://img.shields.io/badge/AzureRM-v4.0+-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
[![CI/CD Validation](https://github.com/sanjiivsingh/azure-observability-baseline/actions/workflows/ci.yml/badge.svg)](https://github.com/sanjiivsingh/azure-observability-baseline/actions)
[![Status: Statically Validated](https://img.shields.io/badge/Status-Observability_--_Statically_Validated-10B981?style=for-the-badge)](https://github.com/sanjiivsingh/azure-observability-baseline)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

> **Reference Architecture · Statically Validated**  
> Enterprise-grade Terraform module for centralizing Azure telemetry: Log Analytics workspace, automated daily ingestion cap alerts, reusable diagnostic settings, and curated KQL query packs. Detailed verification logs are documented in [docs/EVIDENCE.md](docs/EVIDENCE.md) and architectural patterns in [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md).

---

## 🏛️ Architecture Overview

```mermaid
flowchart TD
    subgraph LandingZones["Workloads & Landing Zones"]
        AKS["Azure Kubernetes Service"]
        APIM["API Management"]
        FW["Azure Firewall"]
        KV["Azure Key Vault"]
    end

    subgraph CentralObs["Observability Platform"]
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
terraform fmt -check
terraform validate
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

## 👨‍💻 Author & Cloud Consultant

**Sanjeev Singh**  
Senior Azure Cloud Architect & DevSecOps Platform Engineer  
* 🌐 **Portfolio**: [sanjeevsingh.oneps.in](https://sanjeevsingh.oneps.in)  
* 💼 **LinkedIn**: [linkedin.com/in/sanjiivsingh](https://linkedin.com/in/sanjiivsingh)  
* 🐙 **GitHub**: [github.com/sanjiivsingh](https://github.com/sanjiivsingh)

---

## 📄 License
This project is open-source under the [MIT License](LICENSE).
