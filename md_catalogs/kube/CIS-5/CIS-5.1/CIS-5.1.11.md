# CIS-5.1.11 - \[RBAC and Service Accounts\] Minimize access to the approval sub-resource of certificatesigningrequests objects

## Control Statement

Users with access to the update the `approval` sub-resource of `certificateaigningrequest` objects can approve new client certificates for the Kubernetes API effectively allowing them to create new high-privileged user accounts.

This can allow for privilege escalation to full cluster administrator, depending on users configured in the cluster

## Control rationale_statement

The ability to update certificate signing requests should be limited.

## Control remediation_procedure

Where possible, remove access to the `approval` sub-resource of `certificatesigningrequest` objects.

## Control audit_procedure

Review the users who have access to update the `approval` sub-resource of `certificatesigningrequest` objects in the Kubernetes API.

## Control CIS_Controls

TITLE:Define and Maintain Role-Based Access Control CONTROL:v8 6.8 DESCRIPTION:Define and maintain role-based access control, through determining and documenting the access rights necessary for each role within the enterprise to successfully carry out its assigned duties. Perform access control reviews of enterprise assets to validate that all privileges are authorized, on a recurring schedule at a minimum annually, or more frequently.;TITLE:Controlled Access Based on the Need to Know CONTROL:v7 14 DESCRIPTION:Controlled Access Based on the Need to Know;
