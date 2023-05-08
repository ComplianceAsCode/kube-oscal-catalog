# CIS-5.2.6 - \[Pod Security Standards\] Minimize the admission of containers with allowPrivilegeEscalation

## Control Statement

Do not generally permit containers to be run with the `allowPrivilegeEscalation` flag set to true. Allowing this right can lead to a process running a container getting more rights than it started with.

It's important to note that these rights are still constrained by the overall container sandbox, and this setting does not relate to the use of privileged containers.

## Control rationale_statement

A container running with the `allowPrivilegeEscalation` flag set to `true` may have processes that can gain more privileges than their parent.

There should be at least one admission control policy defined which does not permit containers to allow privilege escalation. The option exists (and is defaulted to true) to permit setuid binaries to run. 

If you have need to run containers which use setuid binaries or require privilege escalation, this should be defined in a separate policy and you should carefully check to ensure that only limited service accounts and users are given permission to use that policy.

## Control impact_statement

Pods defined with `spec.allowPrivilegeEscalation: true` will not be permitted unless they are run under a specific policy.

## Control remediation_procedure

Add policies to each namespace in the cluster which has user workloads to restrict the admission of conatiners with `.spec.allowPrivilegeEscalation`set to `true`.

## Control audit_procedure

List the policies in use for each namespace in the cluster, ensure that each policy disallows the admission of containers which allow privilege escalation.

## Control CIS_Controls

TITLE:Restrict Administrator Privileges to Dedicated Administrator Accounts CONTROL:v8 5.4 DESCRIPTION:Restrict administrator privileges to dedicated administrator accounts on enterprise assets. Conduct general computing activities, such as internet browsing, email, and productivity suite use, from the user’s primary, non-privileged account.;TITLE:Controlled Use of Administrative Privileges CONTROL:v7 4 DESCRIPTION:Controlled Use of Administrative Privileges;
