# CIS-3.1.3 - \[Authentication and Authorization\] Bootstrap token authentication should not be used for users

## Control Statement

Kubernetes provides bootstrap tokens which are intended for use by new nodes joining the cluster

These tokens are not designed for use by end-users they are specifically designed for the purpose of bootstrapping new nodes and not for general authentication

## Control rationale_statement

Bootstrap tokens are not intended for use as a general authentication mechanism and impose constraints on user and group naming that do not facilitate good RBAC design. They also cannot be used with MFA resulting in a weak authentication mechanism being available.

## Control impact_statement

External mechanisms for authentication generally require additional software to be deployed.

## Control remediation_procedure

Alternative mechanisms provided by Kubernetes such as the use of OIDC should be implemented in place of bootstrap tokens.

## Control audit_procedure

Review user access to the cluster and ensure that users are not making use of bootstrap token authentication.

## Control CIS_Controls

TITLE:Establish an Access Revoking Process CONTROL:v8 6.2 DESCRIPTION:Establish and follow a process, preferably automated, for revoking access to enterprise assets, through disabling accounts immediately upon termination, rights revocation, or role change of a user. Disabling accounts, instead of deleting accounts, may be necessary to preserve audit trails.;TITLE:Establish Process for Revoking Access CONTROL:v7 16.7 DESCRIPTION:Establish and follow an automated process for revoking system access by disabling accounts immediately upon termination or change of responsibilities of an employee or contractor . Disabling these accounts, instead of deleting accounts, allows preservation of audit trails.;
