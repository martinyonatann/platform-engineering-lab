# Platform Engineering Lab

A hands-on platform engineering learning journey using local infrastructure to explore Kubernetes, Infrastructure as Code (IaC), GitOps, observability, networking, security, and CI/CD.

The goal is to build practical platform engineering skills through progressively more advanced labs, starting with a local Kubernetes cluster and eventually simulating production-like platform workflows.

---

## Learning Goals

- Understand Kubernetes architecture and workload management.
- Learn Infrastructure as Code (IaC) principles.
- Build reproducible local infrastructure.
- Manage Kubernetes configurations across environments.
- Implement GitOps workflows.
- Explore cloud-native networking and observability.
- Practice CI/CD, platform automation, and security.
- Develop production-oriented platform engineering skills.

---

## Learning Roadmap

All labs are designed to run locally wherever possible.

### Phase 1 — Kubernetes Fundamentals

**Objective:** Understand Kubernetes architecture, workload management, and the reconciliation loop.

**Tools:**

- Docker
- Kind
- kubectl
- Kubernetes

**Topics:**

- Kubernetes cluster, nodes, Pods, and containers
- Control plane vs. worker nodes
- Namespaces
- Deployments and ReplicaSets
- Services
- ConfigMaps and Secrets
- Pod self-healing
- Rolling updates and rollbacks
- Kubernetes resource inspection and troubleshooting

**Hands-on Labs:**

- Create a local Kind cluster
- Deploy an Nginx application
- Expose the application using a Service
- Delete a Pod and observe self-healing
- Perform a rolling update
- Roll back a deployment
- Inject configuration using ConfigMaps and Secrets

---

### Phase 2 — Kubernetes Configuration Management

**Objective:** Manage Kubernetes manifests using reusable and environment-specific configurations.

**Tools:**

- Kustomize
- kubectl
- Git

**Topics:**

- Declarative configuration
- Kubernetes manifests
- Base and overlay structures
- Environment-specific configuration
- Resource patches
- Namespace management
- Configuration consistency

**Hands-on Labs:**

- Organize Kubernetes manifests into a Git repository
- Create a Kustomize base
- Create development and staging overlays
- Customize replicas and container configuration
- Preview manifests before applying them
- Deploy different environments locally

---

### Phase 3 — Infrastructure as Code with Terraform

**Objective:** Learn how to provision and manage infrastructure through code.

**Tools:**

- Terraform
- Terraform providers
- Docker
- Kind

**Topics:**

- Terraform configuration language (HCL)
- Providers and resources
- Variables and outputs
- Terraform state
- Resource dependencies
- `terraform init`
- `terraform plan`
- `terraform apply`
- `terraform destroy`
- State management
- Infrastructure drift

**Hands-on Labs:**

- Install and configure Terraform
- Provision local Docker resources
- Manage a Kind-based Kubernetes environment
- Use Terraform to manage Kubernetes resources
- Inspect Terraform state
- Modify infrastructure through code
- Destroy and recreate resources

> Note: Kind creates Kubernetes nodes as Docker containers. Terraform can manage supported resources around the cluster, but creating a Kind cluster is not the same as provisioning a production cloud Kubernetes cluster.

---

### Phase 4 — Helm and Kubernetes Packaging

**Objective:** Package, configure, and distribute Kubernetes applications.

**Tools:**

- Helm
- Kubernetes
- Kind

**Topics:**

- Helm charts
- Chart structure
- Templates
- `values.yaml`
- Helm releases
- Template rendering
- Chart dependencies
- Configuration overrides

**Hands-on Labs:**

- Create a Helm chart for a backend service
- Convert existing Kubernetes manifests into a Helm chart
- Deploy applications with Helm
- Override values for different environments
- Upgrade and roll back Helm releases

---

### Phase 5 — GitOps with Argo CD

**Objective:** Implement declarative continuous delivery using Git as the source of truth.

**Tools:**

- Git
- GitHub
- Argo CD
- Kind
- Kustomize

**Topics:**

- GitOps principles
- Desired state reconciliation
- Continuous delivery
- Application synchronization
- Automated sync
- Self-healing
- Drift detection
- Deployment rollback

**Hands-on Labs:**

- Install Argo CD locally
- Connect Argo CD to the GitHub repository
- Deploy a Kustomize application through Argo CD
- Modify application configuration in Git
- Observe automatic synchronization
- Simulate configuration drift
- Recover from an invalid deployment

---

### Phase 6 — Kubernetes Networking

**Objective:** Understand how network traffic flows through Kubernetes.

**Tools:**

- Kind
- kubectl
- Cilium
- Hubble
- CoreDNS
- NetworkPolicy

**Topics:**

- Pod networking
- Services and service discovery
- ClusterIP, NodePort, and LoadBalancer
- DNS resolution
- Ingress
- NetworkPolicy
- Container Network Interface (CNI)
- eBPF fundamentals
- Network traffic observability

**Hands-on Labs:**

- Inspect Pod and Service networking
- Deploy multiple backend services
- Test Kubernetes DNS
- Configure NetworkPolicies
- Install Cilium locally
- Explore Hubble network flows
- Compare networking with and without Cilium

---

### Phase 7 — Observability and Reliability

**Objective:** Build an observable platform and understand system reliability.

**Tools:**

- OpenTelemetry
- Prometheus
- Grafana
- Loki
- Tempo
- OpenTelemetry Collector
- Docker
- Kind

**Topics:**

- Metrics, logs, and traces
- RED and USE methodologies
- Service-level indicators (SLIs)
- Service-level objectives (SLOs)
- Distributed tracing
- Alerting
- Dashboards
- Troubleshooting
- Resource utilization

**Hands-on Labs:**

- Deploy a sample microservices application
- Collect application metrics
- Centralize logs
- Implement distributed tracing
- Build Grafana dashboards
- Investigate service latency
- Measure CPU and memory overhead
- Create basic alerts

---

### Phase 8 — CI/CD and DevSecOps

**Objective:** Build secure and automated software delivery pipelines.

**Tools:**

- GitHub Actions
- GitLab CI/CD
- Docker
- Trivy
- Gitleaks
- Hadolint
- Checkov
- Terraform
- Kubernetes

**Topics:**

- CI/CD pipelines
- Build and test automation
- Container image security
- Dependency scanning
- IaC security scanning
- Secret detection
- Deployment automation
- Supply chain security
- Least privilege

**Hands-on Labs:**

- Build a Go backend service in CI
- Run unit and integration tests
- Build a Docker image
- Scan images for vulnerabilities
- Scan Terraform and Kubernetes manifests
- Detect leaked credentials
- Implement a deployment pipeline
- Add approval gates

---

### Phase 9 — Platform Engineering and Developer Experience

**Objective:** Build reusable internal platform capabilities for development teams.

**Tools:**

- Kubernetes
- Helm
- Argo CD
- Terraform
- Backstage
- GitHub Actions
- OpenTelemetry

**Topics:**

- Internal Developer Platforms (IDPs)
- Golden paths
- Self-service infrastructure
- Platform APIs
- Developer experience
- Service templates
- Environment provisioning
- Platform standards
- Documentation and operational ownership

**Hands-on Labs:**

- Create a reusable backend service template
- Standardize deployment configurations
- Build a self-service application workflow
- Create a service catalog
- Automate environment provisioning
- Establish platform conventions
- Document platform onboarding

---

### Phase 10 — Production-Oriented Platform Architecture

**Objective:** Combine the previous concepts into a realistic platform engineering environment.

**Tools:**

- Terraform
- Kubernetes
- Kind
- Helm
- Argo CD
- Cilium
- OpenTelemetry
- Prometheus
- Grafana
- GitHub Actions
- Trivy

**Topics:**

- Multi-environment architecture
- High availability concepts
- Rolling, blue-green, and canary deployments
- Infrastructure lifecycle management
- Disaster recovery
- Platform security
- Resource management
- Observability
- Operational readiness
- Cost awareness

**Hands-on Labs:**

- Build a complete local platform
- Deploy a multi-service application
- Manage configurations through GitOps
- Automate infrastructure provisioning
- Implement health checks and rollout strategies
- Add observability
- Enforce network policies
- Simulate failures and recovery
- Document architecture and operational procedures

> Local clusters cannot fully reproduce cloud-provider-managed control planes, real multi-zone availability, or production-scale infrastructure. The final phase focuses on practicing the concepts and workflows locally.

---

## Repository Structure

```text
platform-engineering-lab/
├── README.md
├── phase-01-kubernetes/
├── phase-02-kustomize/
├── phase-03-terraform/
├── phase-04-helm/
├── phase-05-gitops/
├── phase-06-networking/
├── phase-07-observability/
├── phase-08-cicd-devsecops/
├── phase-09-platform-engineering/
└── phase-10-production-architecture/
```

---

## Local Environment

Recommended baseline:

- Linux
- Docker
- Kind
- kubectl
- Git
- GitHub account

Additional tools will be introduced progressively in each phase.

---

## Learning Approach

Each phase follows this workflow:

1. Understand the concept.
2. Build it manually.
3. Inspect what Kubernetes or the infrastructure is doing.
4. Automate the configuration.
5. Introduce failure scenarios.
6. Troubleshoot and document the results.

The emphasis is on understanding **why** a tool is used, not just memorizing commands.

---

## Progress

- [x] Phase 1 — Kubernetes Fundamentals
- [ ] Phase 2 — Kubernetes Configuration Management
- [ ] Phase 3 — Infrastructure as Code with Terraform
- [ ] Phase 4 — Helm and Kubernetes Packaging
- [ ] Phase 5 — GitOps with Argo CD
- [ ] Phase 6 — Kubernetes Networking
- [ ] Phase 7 — Observability and Reliability
- [ ] Phase 8 — CI/CD and DevSecOps
- [ ] Phase 9 — Platform Engineering and Developer Experience
- [ ] Phase 10 — Production-Oriented Platform Architecture
