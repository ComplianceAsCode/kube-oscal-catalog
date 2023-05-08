# CIS-1.2.17 - \[API Server\] Ensure that the --profiling argument is set to false

## Control Statement

Disable profiling, if not needed.

## Control rationale_statement

Profiling allows for the identification of specific performance bottlenecks. It generates a significant amount of program data that could potentially be exploited to uncover system and program details. If you are not experiencing any bottlenecks and do not need the profiler for troubleshooting purposes, it is recommended to turn it off to reduce the potential attack surface.

## Control impact_statement

Profiling information would not be available.

## Control remediation_procedure

Edit the API server pod specification file `/etc/kubernetes/manifests/kube-apiserver.yaml` on the Control Plane node and set the below parameter.

```
--profiling=false
```

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-apiserver
```

Verify that the `--profiling` argument is set to `false`.

## Control CIS_Controls

TITLE:Audit Log Management CONTROL:v8 8 DESCRIPTION:Collect, alert, review, and retain audit logs of events that could help detect, understand, or recover from an attack.;TITLE:Maintenance, Monitoring and Analysis of Audit Logs CONTROL:v7 6 DESCRIPTION:Maintenance, Monitoring and Analysis of Audit Logs;
