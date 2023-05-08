# CIS-1.2.19 - \[API Server\] Ensure that the --audit-log-maxage argument is set to 30 or as appropriate

## Control Statement

Retain the logs for at least 30 days or as appropriate.

## Control rationale_statement

Retaining logs for at least 30 days ensures that you can go back in time and investigate or correlate any events. Set your audit log retention period to 30 days or as per your business requirements.

## Control impact_statement

None

## Control remediation_procedure

Edit the API server pod specification file `/etc/kubernetes/manifests/kube-apiserver.yaml` on the Control Plane node and set the `--audit-log-maxage` parameter to 30 or as an appropriate number of days:

```
--audit-log-maxage=30
```

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-apiserver
```

Verify that the `--audit-log-maxage` argument is set to `30` or as appropriate.

## Control CIS_Controls

TITLE:Ensure Adequate Audit Log Storage CONTROL:v8 8.3 DESCRIPTION:Ensure that logging destinations maintain adequate storage to comply with the enterprise’s audit log management process.;TITLE:Ensure adequate storage for logs CONTROL:v7 6.4 DESCRIPTION:Ensure that all systems that store logs have adequate storage space for the logs generated.;
