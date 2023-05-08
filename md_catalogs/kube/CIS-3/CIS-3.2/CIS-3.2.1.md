# CIS-3.2.1 - \[Logging\] Ensure that a minimal audit policy is created

## Control Statement

Kubernetes can audit the details of requests made to the API server. The `--audit-policy-file` flag must be set for this logging to be enabled.

## Control rationale_statement

Logging is an important detective control for all systems, to detect potential unauthorised access.

## Control impact_statement

Audit logs will be created on the master nodes, which will consume disk space. Care should be taken to avoid generating too large volumes of log information as this could impact the available of the cluster nodes.

## Control remediation_procedure

Create an audit policy file for your cluster.

## Control audit_procedure

Run the following command on one of the cluster master nodes:

```
ps -ef | grep kube-apiserver
```

Verify that the `--audit-policy-file` is set. Review the contents of the file specified and ensure that it contains a valid audit policy.

## Control CIS_Controls

TITLE:Collect Audit Logs CONTROL:v8 8.2 DESCRIPTION:Collect audit logs. Ensure that logging, per the enterprise’s audit log management process, has been enabled across enterprise assets.;TITLE:Activate audit logging CONTROL:v7 6.2 DESCRIPTION:Ensure that local logging has been enabled on all systems and networking devices.;
