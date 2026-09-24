# Helm Environments

This phase demonstrates how to use the same Helm chart with different environment configurations.

## Goals

- Manage environment-specific configuration with Helm values.
- Deploy the same chart to different environments.
- Understand values file overrides.
- Practice `helm upgrade` with different environment values.

## Structure

```text
04-environments/
├── README.md
└── nginx/
    ├── Chart.yaml
    ├── values.yaml
    ├── values-dev.yaml
    ├── values-prod.yaml
    └── templates/
```

## Environment configuration

The same Helm chart is reused across environments.

```mermaid
flowchart TD
    Chart["nginx Helm Chart"]

    Chart --> DevValues["values-dev.yaml"]
    Chart --> ProdValues["values-prod.yaml"]

    DevValues --> Dev["Development"]
    ProdValues --> Prod["Production"]

    Dev --> DevConfig["replicas: 1<br/>environment: development"]
    Prod --> ProdConfig["replicas: 3<br/>environment: production"]
```

## Deployment flow

```mermaid
flowchart LR
    Values["Environment Values"] --> Helm["Helm"]
    Chart["Helm Chart"] --> Helm

    Helm --> K8s["Kubernetes"]

    K8s --> Dev["Development"]
    K8s --> Prod["Production"]
```

## Commands

Render development configuration:

```bash
helm template nginx ./nginx -f ./nginx/values-dev.yaml
```

Render production configuration:

```bash
helm template nginx ./nginx -f ./nginx/values-prod.yaml
```

Deploy development:

```bash
helm upgrade --install nginx ./nginx \
  -n platform \
  -f ./nginx/values-dev.yaml
```

Deploy production:

```bash
helm upgrade --install nginx ./nginx \
  -n platform \
  -f ./nginx/values-prod.yaml
```

## Key concept

One Helm chart can be reused across multiple environments.

```mermaid
flowchart TD
    Chart["One Helm Chart"]

    Chart --> Dev["Dev"]
    Chart --> Prod["Prod"]

    Dev --> DevValues["values-dev.yaml"]
    Prod --> ProdValues["values-prod.yaml"]

    DevValues --> DevResult["Development configuration"]
    ProdValues --> ProdResult["Production configuration"]
```

The templates remain the same. Only the environment specific values change.
