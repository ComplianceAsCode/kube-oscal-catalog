# CIS-3.1.1 - \[Authentication and Authorization\] Client certificate authentication should not be used for users

## Control Statement

Kubernetes provides the option to use client certificates for user authentication. However as there is no way to revoke these certificates when a user leaves an organization or loses their credential, they are not suitable for this purpose.

It is not possible to fully disable client certificate use within a cluster as it is used for component to component authentication.

## Control rationale_statement

With any authentication mechanism the ability to revoke credentials if they are compromised or no longer required, is a key control. Kubernetes client certificate authentication does not allow for this due to a lack of support for certificate revocation.

## Control impact_statement

External mechanisms for authentication generally require additional software to be deployed.

## Control remediation_procedure

Alternative mechanisms provided by Kubernetes such as the use of OIDC should be implemented in place of client certificates.

## Control audit_procedure

Review user access to the cluster and ensure that users are not making use of Kubernetes client certificate authentication.

## Control additional_information

The lack of certificate revocation was flagged up as a high risk issue in the recent Kubernetes security audit. Without this feature, client certificate authentication is not suitable for end users.

## Control CIS_Controls

TITLE:Establish an Access Revoking Process CONTROL:v8 6.2 DESCRIPTION:Establish and follow a process, preferably automated, for revoking access to enterprise assets, through disabling accounts immediately upon termination, rights revocation, or role change of a user. Disabling accounts, instead of deleting accounts, may be necessary to preserve audit trails.;TITLE:Establish Process for Revoking Access CONTROL:v7 16.7 DESCRIPTION:Establish and follow an automated process for revoking system access by disabling accounts immediately upon termination or change of responsibilities of an employee or contractor . Disabling these accounts, instead of deleting accounts, allows preservation of audit trails.;
