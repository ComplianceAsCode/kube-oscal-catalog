# CIS-3.1.2 - \[Authentication and Authorization\] Service account token authentication should not be used for users

## Control Statement

Kubernetes provides service account tokens which are intended for use by workloads running in the Kubernetes cluster, for authentication to the API server.

These tokens are not designed for use by end-users and do not provide for features such as revocation or expiry, making them insecure. A newer version of the feature (Bound service account token volumes) does introduce expiry but still does not allow for specific revocation.

## Control rationale_statement

With any authentication mechanism the ability to revoke credentials if they are compromised or no longer required, is a key control. Service account token authentication does not allow for this due to the use of JWT tokens as an underlying technology.

## Control impact_statement

External mechanisms for authentication generally require additional software to be deployed.

## Control remediation_procedure

Alternative mechanisms provided by Kubernetes such as the use of OIDC should be implemented in place of service account tokens.

## Control audit_procedure

Review user access to the cluster and ensure that users are not making use of service account token authentication.

## Control CIS_Controls

TITLE:Establish an Access Revoking Process CONTROL:v8 6.2 DESCRIPTION:Establish and follow a process, preferably automated, for revoking access to enterprise assets, through disabling accounts immediately upon termination, rights revocation, or role change of a user. Disabling accounts, instead of deleting accounts, may be necessary to preserve audit trails.;TITLE:Establish Process for Revoking Access CONTROL:v7 16.7 DESCRIPTION:Establish and follow an automated process for revoking system access by disabling accounts immediately upon termination or change of responsibilities of an employee or contractor . Disabling these accounts, instead of deleting accounts, allows preservation of audit trails.;
