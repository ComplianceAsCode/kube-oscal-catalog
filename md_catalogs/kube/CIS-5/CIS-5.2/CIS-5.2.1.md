# CIS-5.2.1 - \[Pod Security Standards\] Ensure that the cluster has at least one active policy control mechanism in place

## Control Statement

Every Kubernetes cluster should have at least one policy control mechanism in place to enforce the other requirements in this section. This could be the in-built Pod Security Admission controller, or a third party policy control system.

## Control rationale_statement

Without an active policy control mechanism, it is not possible to limit the use of containers with access to underlying cluster nodes, via mechanisms like privileged containers, or the use of hostPath volume mounts.

## Control impact_statement

Where policy control systems are in place, there is a risk that workloads required for the operation of the cluster may be stopped from running. Care is required when implementing admission control policies to ensure that this does not occur.

## Control remediation_procedure

Ensure that either Pod Security Admission or an external policy control system is in place for every namespace which contains user workloads.

## Control audit_procedure

Pod Security Admission is enabled by default on all clusters using Kubernetes 1.23 or higher. To assess what controls, if any, are in place using this mechanism, review the namespaces in the cluster to see if the [required labels](https://kubernetes.io/docs/concepts/security/pod-security-admission/#pod-security-admission-labels-for-namespaces) have been applied 

```
kubectl get namespaces -o yaml
```

To confirm if any external policy control system is in use, review the cluster for the presence of `validatingadmissionwebhook` and `mutatingadmissionwebhook` objects.

```
kubectl get validatingwebhookconfigurations
```

```
kubectl get mutatingwebhookconfigurations
```
