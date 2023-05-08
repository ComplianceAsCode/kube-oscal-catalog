# CIS-5.1.13 - \[RBAC and Service Accounts\] Minimize access to the service account token creation

## Control Statement

Users with rights to create new service account tokens at a cluster level, can create long-lived privileged credentials in the cluster. This could allow for privilege escalation and persistent access to the cluster, even if the users account has been revoked.

## Control rationale_statement

The ability to create service account tokens should be limited.

## Control remediation_procedure

Where possible, remove access to the `token` sub-resource of `serviceaccount` objects.

## Control audit_procedure

Review the users who have access to create the `token` sub-resource of `serviceaccount` objects in the Kubernetes API.

## Control CIS_Controls

TITLE:Define and Maintain Role-Based Access Control CONTROL:v8 6.8 DESCRIPTION:Define and maintain role-based access control, through determining and documenting the access rights necessary for each role within the enterprise to successfully carry out its assigned duties. Perform access control reviews of enterprise assets to validate that all privileges are authorized, on a recurring schedule at a minimum annually, or more frequently.;TITLE:Controlled Access Based on the Need to Know CONTROL:v7 14 DESCRIPTION:Controlled Access Based on the Need to Know;
