# Secret Management

## Architecture

```mermaid
flowchart TD
    TF["1. Terraform<br/>main.tf"]

    V["2. Vault<br/>Secret Manager"]

    ESO["3. External Secrets Operator<br/>installed via Helm"]

    SS["4. SecretStore<br/>secret-store.yaml"]

    ES["5. ExternalSecret<br/>external-secret.yaml"]

    KS["6. Kubernetes Secret<br/>database-secret"]

    APP["7. Application Pod<br/>main.tf"]

    TF -->|Manages Deployment| APP
    V -->|Provides secret| ESO
    ESO --> SS
    SS --> ES
    ES --> KS
    KS --> APP
```

## Why?

Terraform should manage infrastructure, while a dedicated secret manager such as Vault manages sensitive values.

This avoids putting actual secret values directly in Terraform configuration.
