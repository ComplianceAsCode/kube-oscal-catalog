# CIS-1.2.20 - \[API Server\] Ensure that the --audit-log-maxbackup argument is set to 10 or as appropriate

## Control Statement

Retain 10 or an appropriate number of old log files.

## Control rationale_statement

Kubernetes automatically rotates the log files. Retaining old log files ensures that you would have sufficient log data available for carrying out any investigation or correlation. For example, if you have set file size of 100 MB and the number of old log files to keep as 10, you would approximate have 1 GB of log data that you could potentially use for your analysis.

## Control impact_statement

None

## Control remediation_procedure

Edit the API server pod specification file `/etc/kubernetes/manifests/kube-apiserver.yaml` on the Control Plane node and set the `--audit-log-maxbackup` parameter to 10 or to an appropriate value.

```
--audit-log-maxbackup=10
```

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-apiserver
```

Verify that the `--audit-log-maxbackup` argument is set to `10` or as appropriate.

## Control CIS_Controls

TITLE:Ensure Adequate Audit Log Storage CONTROL:v8 8.3 DESCRIPTION:Ensure that logging destinations maintain adequate storage to comply with the enterprise’s audit log management process.;TITLE:Ensure adequate storage for logs CONTROL:v7 6.4 DESCRIPTION:Ensure that all systems that store logs have adequate storage space for the logs generated.;
