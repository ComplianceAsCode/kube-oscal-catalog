# CIS-1.2.21 - \[API Server\] Ensure that the --audit-log-maxsize argument is set to 100 or as appropriate

## Control Statement

Rotate log files on reaching 100 MB or as appropriate.

## Control rationale_statement

Kubernetes automatically rotates the log files. Retaining old log files ensures that you would have sufficient log data available for carrying out any investigation or correlation. If you have set file size of 100 MB and the number of old log files to keep as 10, you would approximate have 1 GB of log data that you could potentially use for your analysis.

## Control impact_statement

None

## Control remediation_procedure

Edit the API server pod specification file `/etc/kubernetes/manifests/kube-apiserver.yaml` on the Control Plane node and set the `--audit-log-maxsize` parameter to an appropriate size in MB. For example, to set it as 100 MB:

```
--audit-log-maxsize=100
```

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-apiserver
```

Verify that the `--audit-log-maxsize` argument is set to `100` or as appropriate.

## Control CIS_Controls

TITLE:Ensure Adequate Audit Log Storage CONTROL:v8 8.3 DESCRIPTION:Ensure that logging destinations maintain adequate storage to comply with the enterprise’s audit log management process.;TITLE:Ensure adequate storage for logs CONTROL:v7 6.4 DESCRIPTION:Ensure that all systems that store logs have adequate storage space for the logs generated.;
