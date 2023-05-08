# CIS-5.1.5 - \[RBAC and Service Accounts\] Ensure that default service accounts are not actively used.

## Control Statement

The `default` service account should not be used to ensure that rights granted to applications can be more easily audited and reviewed.

## Control rationale_statement

Kubernetes provides a `default` service account which is used by cluster workloads where no specific service account is assigned to the pod.

Where access to the Kubernetes API from a pod is required, a specific service account should be created for that pod, and rights granted to that service account.

The default service account should be configured such that it does not provide a service account token and does not have any explicit rights assignments.

## Control impact_statement

All workloads which require access to the Kubernetes API will require an explicit service account to be created.

## Control remediation_procedure

Create explicit service accounts wherever a Kubernetes workload requires specific access to the Kubernetes API server.

Modify the configuration of each default service account to include this value 

```
automountServiceAccountToken: false
```

## Control audit_procedure

For each namespace in the cluster, review the rights assigned to the default service account and ensure that it has no roles or cluster roles bound to it apart from the defaults.

Additionally ensure that the `automountServiceAccountToken: false` setting is in place for each default service account.

## Control CIS_Controls

TITLE:Disable Dormant Accounts CONTROL:v8 5.3 DESCRIPTION:Delete or disable any dormant accounts after a period of 45 days of inactivity, where supported.;TITLE:Disable Dormant Accounts CONTROL:v7 16.9 DESCRIPTION:Automatically disable dormant accounts after a set period of inactivity.;
