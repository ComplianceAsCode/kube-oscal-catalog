# CIS-5.2.2 - \[Pod Security Standards\] Minimize the admission of privileged containers

## Control Statement

Do not generally permit containers to be run with the `securityContext.privileged` flag set to `true`.

## Control rationale_statement

Privileged containers have access to all Linux Kernel capabilities and devices. A container running with full privileges can do almost everything that the host can do. This flag exists to allow special use-cases, like manipulating the network stack and accessing devices. 

There should be at least one admission control policy defined which does not permit privileged containers. 

If you need to run privileged containers, this should be defined in a separate policy and you should carefully check to ensure that only limited service accounts and users are given permission to use that policy.

## Control impact_statement

Pods defined with `spec.containers[].securityContext.privileged: true`, `spec.initContainers[].securityContext.privileged: true` and `spec.ephemeralContainers[].securityContext.privileged: true` will not be permitted.

## Control remediation_procedure

Add policies to each namespace in the cluster which has user workloads to restrict the admission of privileged containers.

## Control audit_procedure

List the policies in use for each namespace in the cluster, ensure that each policy disallows the admission of privileged containers.

## Control CIS_Controls

TITLE:Restrict Administrator Privileges to Dedicated Administrator Accounts CONTROL:v8 5.4 DESCRIPTION:Restrict administrator privileges to dedicated administrator accounts on enterprise assets. Conduct general computing activities, such as internet browsing, email, and productivity suite use, from the user’s primary, non-privileged account.;TITLE:Controlled Use of Administrative Privileges CONTROL:v7 4 DESCRIPTION:Controlled Use of Administrative Privileges;TITLE:Minimize And Sparingly Use Administrative Privileges CONTROL:v6 5.1 DESCRIPTION:Minimize administrative privileges and only use administrative accounts when they are required. Implement focused auditing on the use of administrative privileged functions and monitor for anomalous behavior.;
