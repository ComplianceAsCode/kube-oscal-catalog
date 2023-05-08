# CIS-5.1.9 - \[RBAC and Service Accounts\] Minimize access to create persistent volumes

## Control Statement

The ability to create persistent volumes in a cluster can provide an opportunity for privilege escalation, via the creation of `hostPath` volumes. As persistent volumes are not covered by Pod Security Admission, a user with access to create persistent volumes may be able to get access to sensitive files from the underlying host even where restrictive Pod Security Admission policies are in place.

## Control rationale_statement

The ability to create persistent volumes in a cluster opens up possibilities for privilege escalation and should be restricted, where possible.

## Control remediation_procedure

Where possible, remove `create` access to `PersistentVolume` objects in the cluster.

## Control audit_procedure

Review the users who have create access to `PersistentVolume` objects in the Kubernetes API.

## Control CIS_Controls

TITLE:Define and Maintain Role-Based Access Control CONTROL:v8 6.8 DESCRIPTION:Define and maintain role-based access control, through determining and documenting the access rights necessary for each role within the enterprise to successfully carry out its assigned duties. Perform access control reviews of enterprise assets to validate that all privileges are authorized, on a recurring schedule at a minimum annually, or more frequently.;TITLE:Controlled Access Based on the Need to Know CONTROL:v7 14 DESCRIPTION:Controlled Access Based on the Need to Know;
