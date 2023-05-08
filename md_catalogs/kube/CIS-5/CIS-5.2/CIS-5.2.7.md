# CIS-5.2.7 - \[Pod Security Standards\] Minimize the admission of root containers

## Control Statement

Do not generally permit containers to be run as the root user.

## Control rationale_statement

Containers may run as any Linux user. Containers which run as the root user, whilst constrained by Container Runtime security features still have a escalated likelihood of container breakout.

Ideally, all containers should run as a defined non-UID 0 user.

There should be at least one admission control policy defined which does not permit root containers.

If you need to run root containers, this should be defined in a separate policy and you should carefully check to ensure that only limited service accounts and users are given permission to use that policy.

## Control impact_statement

Pods with containers which run as the root user will not be permitted.

## Control remediation_procedure

Create a policy for each namespace in the cluster, ensuring that either `MustRunAsNonRoot` or `MustRunAs` with the range of UIDs not including 0, is set.

## Control audit_procedure

List the policies in use for each namespace in the cluster, ensure that each policy restricts the use of root containers by setting `MustRunAsNonRoot` or `MustRunAs` with the range of UIDs not including 0.

## Control CIS_Controls

TITLE:Restrict Administrator Privileges to Dedicated Administrator Accounts CONTROL:v8 5.4 DESCRIPTION:Restrict administrator privileges to dedicated administrator accounts on enterprise assets. Conduct general computing activities, such as internet browsing, email, and productivity suite use, from the user’s primary, non-privileged account.;TITLE:Controlled Use of Administrative Privileges CONTROL:v7 4 DESCRIPTION:Controlled Use of Administrative Privileges;
