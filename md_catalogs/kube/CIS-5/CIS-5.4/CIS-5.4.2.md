# CIS-5.4.2 - \[Secrets Management\] Consider external secret storage

## Control Statement

Consider the use of an external secrets storage and management system, instead of using Kubernetes Secrets directly, if you have more complex secret management needs. Ensure the solution requires authentication to access secrets, has auditing of access to and use of secrets, and encrypts secrets. Some solutions also make it easier to rotate secrets.

## Control rationale_statement

Kubernetes supports secrets as first-class objects, but care needs to be taken to ensure that access to secrets is carefully limited. Using an external secrets provider can ease the management of access to secrets, especially where secrests are used across both Kubernetes and non-Kubernetes environments.

## Control impact_statement

None

## Control remediation_procedure

Refer to the secrets management options offered by your cloud provider or a third-party secrets management solution.

## Control audit_procedure

Review your secrets management implementation.

## Control CIS_Controls

TITLE:Data Protection CONTROL:v8 3 DESCRIPTION:Develop processes and technical controls to identify, classify, securely handle, retain, and dispose of data.;TITLE:Data Protection CONTROL:v7 13 DESCRIPTION:Data Protection;
