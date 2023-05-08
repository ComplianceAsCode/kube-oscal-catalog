# CIS-5.1.4 - \[RBAC and Service Accounts\] Minimize access to create pods

## Control Statement

The ability to create pods in a namespace can provide a number of opportunities for privilege escalation, such as assigning privileged service accounts to these pods or mounting hostPaths with access to sensitive data (unless Pod Security Policies are implemented to restrict this access)

As such, access to create new pods should be restricted to the smallest possible group of users.

## Control rationale_statement

The ability to create pods in a cluster opens up possibilities for privilege escalation and should be restricted, where possible.

## Control impact_statement

Care should be taken not to remove access to pods to system components which require this for their operation

## Control remediation_procedure

Where possible, remove `create` access to `pod` objects in the cluster.

## Control audit_procedure

Review the users who have create access to pod objects in the Kubernetes API.

## Control CIS_Controls

TITLE:Define and Maintain Role-Based Access Control CONTROL:v8 6.8 DESCRIPTION:Define and maintain role-based access control, through determining and documenting the access rights necessary for each role within the enterprise to successfully carry out its assigned duties. Perform access control reviews of enterprise assets to validate that all privileges are authorized, on a recurring schedule at a minimum annually, or more frequently.;TITLE:Controlled Access Based on the Need to Know CONTROL:v7 14 DESCRIPTION:Controlled Access Based on the Need to Know;
