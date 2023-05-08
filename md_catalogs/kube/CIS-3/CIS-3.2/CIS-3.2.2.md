# CIS-3.2.2 - \[Logging\] Ensure that the audit policy covers key security concerns

## Control Statement

Ensure that the audit policy created for the cluster covers key security concerns.

## Control rationale_statement

Security audit logs should cover access and modification of key resources in the cluster, to enable them to form an effective part of a security environment.

## Control impact_statement

Increasing audit logging will consume resources on the nodes or other log destination.

## Control remediation_procedure

Consider modification of the audit policy in use on the cluster to include these items, at a minimum.

## Control audit_procedure

Review the audit policy provided for the cluster and ensure that it covers at least the following areas :-

 - Access to Secrets managed by the cluster. Care should be taken to only log Metadata for requests to Secrets, ConfigMaps, and TokenReviews, in order to avoid the risk of logging sensitive data.
 - Modification of `pod` and `deployment` objects.
 - Use of `pods/exec`, `pods/portforward`, `pods/proxy` and `services/proxy`.

For most requests, minimally logging at the Metadata level is recommended (the most basic level of logging).

## Control CIS_Controls

TITLE:Collect Detailed Audit Logs CONTROL:v8 8.5 DESCRIPTION:Configure detailed audit logging for enterprise assets containing sensitive data. Include event source, date, username, timestamp, source addresses, destination addresses, and other useful elements that could assist in a forensic investigation.;TITLE:Enforce Detail Logging for Access or Changes to Sensitive Data CONTROL:v7 14.9 DESCRIPTION:Enforce detailed audit logging for access to sensitive data or changes to sensitive data (utilizing tools such as File Integrity Monitoring or Security Information and Event Monitoring).;
