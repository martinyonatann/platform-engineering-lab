# Kubernetes Provider

## Architecture

```mermaid
flowchart TD
    TF["1. Terraform<br/>main.tf"]
    PROVIDER["2. Kubernetes Provider<br/>provider.tf"]
    API["3. Kubernetes API Server"]
    NS["4. Namespace<br/>terraform-platform"]
    RES["5. Kubernetes Resources<br/>Deployment / Service"]

    TF --> PROVIDER
    PROVIDER -->|Connects to| API
    API --> NS
    API --> RES
```

## Files

| Step | Component               | File          |
| ---- | ----------------------- | ------------- |
| 1    | Terraform configuration | `main.tf`     |
| 2    | Kubernetes Provider     | `provider.tf` |
| 3    | Kubernetes API Server   | Kubernetes    |
| 4    | Namespace               | `main.tf`     |
| 5    | Kubernetes resources    | `main.tf`     |

## Provider Configuration

Terraform uses the Kubernetes provider to communicate with the Kubernetes cluster.

```hcl
provider "kubernetes" {
  config_path = "~/.kube/config"
}
```

The provider reads the Kubernetes configuration from `~/.kube/config` and uses it to connect to the cluster.

## Resources

Terraform manages the following Kubernetes resources:

- Namespace
- Deployment
- Service
