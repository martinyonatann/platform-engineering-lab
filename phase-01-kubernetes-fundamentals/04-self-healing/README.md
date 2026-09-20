# Kubernetes Self-Healing

This section demonstrates how Kubernetes automatically maintains the desired state of a Deployment.

## Prerequisites

Make sure the `platform` namespace and `nginx` Deployment are already running.

```bash
kubectl get pods -n platform
kubectl get deployment -n platform
```

Expected:

```text
NAME                     READY   STATUS    RESTARTS
nginx-xxxxxxxxxx-xxxxx   1/1     Running   0
nginx-xxxxxxxxxx-xxxxx   1/1     Running   0
```

---

## 1. Delete a Pod

First, list the Pods:

```bash
kubectl get pods -n platform
```

Delete one Pod:

```bash
kubectl delete pod <pod-name> -n platform
```

For example:

```bash
kubectl delete pod nginx-xxxxxxxxxx-xxxxx -n platform
```

Immediately check the Pods again:

```bash
kubectl get pods -n platform
```

You should see Kubernetes create a replacement Pod.

### What happened?

The Deployment declares:

```yaml
spec:
  replicas: 2
```

Kubernetes continuously compares:

```text
Desired state:  2 Pods
Actual state:   1 Pod
```

The Deployment/ReplicaSet controller detects the difference and creates another Pod.

```text
              Deployment
                   │
                   ▼
              ReplicaSet
              ┌────┴────┐
              ▼         ▼
            Pod 1      Pod 2
                         │
                    DELETE POD
                         │
                         ▼
                    Pod recreated
```

---

## 2. Scale the Deployment

Check the current number of replicas:

```bash
kubectl get deployment nginx -n platform
```

Scale from 2 to 3:

```bash
kubectl scale deployment nginx -n platform --replicas=3
```

Check the Pods:

```bash
kubectl get pods -n platform
```

You should now have 3 Pods.

---

## 3. Scale Down

Scale back to 2:

```bash
kubectl scale deployment nginx -n platform --replicas=2
```

Verify:

```bash
kubectl get pods -n platform
```

---

## 4. Rolling Update

Check the current image:

```bash
kubectl describe deployment nginx -n platform | grep Image
```

Update the image:

```bash
kubectl set image deployment/nginx \
  nginx=nginx:1.28 \
  -n platform
```

Watch the rollout:

```bash
kubectl rollout status deployment/nginx -n platform
```

Check the Pods:

```bash
kubectl get pods -n platform
```

Kubernetes gradually replaces the old Pods with new Pods.

---

## 5. Check Rollout History

```bash
kubectl rollout history deployment/nginx -n platform
```

---

## 6. Rollback

Rollback to the previous version:

```bash
kubectl rollout undo deployment/nginx -n platform
```

Check the rollout:

```bash
kubectl rollout status deployment/nginx -n platform
```

Verify the image:

```bash
kubectl describe deployment nginx -n platform | grep Image
```

---

## Key Concepts

### Desired State

The Deployment defines what we want:

```text
replicas: 2
image: nginx:1.27
```

### Actual State

Kubernetes continuously observes what is actually running.

### Reconciliation

If the actual state differs from the desired state, Kubernetes takes action to reconcile them.

```text
        Desired State
             │
             ▼
        Deployment
             │
             ▼
       Kubernetes
       Controllers
             │
             ▼
        Actual State
             │
             │
       Difference?
          /     \
        No       Yes
        │         │
        ▼         ▼
      Wait     Reconcile
```

## Commands Learned

```bash
kubectl get pods -n platform
kubectl delete pod <pod-name> -n platform
kubectl scale deployment nginx -n platform --replicas=3
kubectl set image deployment/nginx nginx=nginx:1.28 -n platform
kubectl rollout status deployment/nginx -n platform
kubectl rollout history deployment/nginx -n platform
kubectl rollout undo deployment/nginx -n platform
```

## Main Lesson

Kubernetes is not simply running containers.

It continuously works to maintain the state declared by the user.

**Desired state -> Observe -> Compare -> Reconcile -> Repeat**
