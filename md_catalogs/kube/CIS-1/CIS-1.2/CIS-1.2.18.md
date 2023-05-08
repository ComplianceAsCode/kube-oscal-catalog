# CIS-1.2.18 - \[API Server\] Ensure that the --audit-log-path argument is set

## Control Statement

Enable auditing on the Kubernetes API Server and set the desired audit log path.

## Control rationale_statement

Auditing the Kubernetes API Server provides a security-relevant chronological set of records documenting the sequence of activities that have affected system by individual users, administrators or other components of the system. Even though currently, Kubernetes provides only basic audit capabilities, it should be enabled. You can enable it by setting an appropriate audit log path.

## Control impact_statement

None

## Control remediation_procedure

Edit the API server pod specification file `/etc/kubernetes/manifests/kube-apiserver.yaml` on the Control Plane node and set the `--audit-log-path` parameter to a suitable path and file where you would like audit logs to be written, for example:

```
--audit-log-path=/var/log/apiserver/audit.log
```

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-apiserver
```

Verify that the `--audit-log-path` argument is set as appropriate.

## Control CIS_Controls

TITLE:Collect Audit Logs CONTROL:v8 8.2 DESCRIPTION:Collect audit logs. Ensure that logging, per the enterprise’s audit log management process, has been enabled across enterprise assets.;TITLE:Activate audit logging CONTROL:v7 6.2 DESCRIPTION:Ensure that local logging has been enabled on all systems and networking devices.;
