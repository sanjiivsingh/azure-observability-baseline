# Verification Evidence & CI Audit

## Repository Status
- **Validation State**: Statically Validated & CI Verified
- **Target Platform**: Microsoft Azure (Azure Monitor, Log Analytics, Action Groups)
- **Terraform Compatibility**: `>= 1.9.0`
- **AzureRM Provider**: `~> 4.0`

## Continuous Integration Verification
All Terraform configurations and child modules pass static syntax, style, and security validations:
- **CI Pipeline**: [GitHub Actions Workflow](https://github.com/sanjiivsingh/azure-observability-baseline/actions)
- **Local Validation**:
  ```bash
  terraform fmt -check
  terraform init -backend=false
  terraform validate
  ```

## Monthly Cost Profile (East US Estimate)

| Resource | Configuration | Estimated Monthly Cost |
| :--- | :--- | :--- |
| Azure Log Analytics Workspace | 5 GB/day cap (First 5 GB/mo free; $2.30/GB beyond) | ~$0.00 - $34.50 (Usage-based) |
| Data Retention | 30 Days Included | $0.00 |
| Action Group & Email Notifications | Sev 1/2 Alerts (< 1,000 emails) | $0.00 |
| Metric Alert Rule | 1 Metric Alert Rule | $0.10 |
| **Total Estimated Baseline** | Minimal idle telemetry | **$0.10 - $35.00 / month** |
