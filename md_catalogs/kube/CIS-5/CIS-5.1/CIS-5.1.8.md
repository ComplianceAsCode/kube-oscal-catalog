# CIS-5.1.8 - \[RBAC and Service Accounts\] Limit use of the Bind, Impersonate and Escalate permissions in the Kubernetes cluster

## Control Statement

Cluster roles and roles with the impersonate, bind or escalate permissions should not be granted unless strictly required. Each of these permissions allow a particular subject to escalate their privileges beyond those explicitly granted by cluster administrators

## Control rationale_statement

The impersonate privilege allows a subject to impersonate other users gaining their rights to the cluster. The bind privilege allows the subject to add a binding to a cluster role or role which escalates their effective permissions in the cluster. The escalate privilege allows a subject to modify cluster roles to which they are bound, increasing their rights to that level.

Each of these permissions has the potential to allow for privilege escalation to cluster-admin level.

## Control impact_statement

There are some cases where these permissions are required for cluster service operation, and care should be taken before removing these permissions from system service accounts.

## Control remediation_procedure

Where possible, remove the impersonate, bind and escalate rights from subjects.

## Control audit_procedure

Review the users who have access to cluster roles or roles which provide the impersonate, bind or escalate privileges.

## Control CIS_Controls

TITLE:Restrict Administrator Privileges to Dedicated Administrator Accounts CONTROL:v8 5.4 DESCRIPTION:Restrict administrator privileges to dedicated administrator accounts on enterprise assets. Conduct general computing activities, such as internet browsing, email, and productivity suite use, from the user’s primary, non-privileged account.;TITLE:Controlled Use of Administrative Privileges CONTROL:v7 4 DESCRIPTION:Controlled Use of Administrative Privileges;
