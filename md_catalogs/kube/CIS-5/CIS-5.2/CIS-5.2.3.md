# CIS-5.2.3 - \[Pod Security Standards\] Minimize the admission of containers wishing to share the host process ID namespace

## Control Statement

Do not generally permit containers to be run with the `hostPID` flag set to true.

## Control rationale_statement

A container running in the host's PID namespace can inspect processes running outside the container. If the container also has access to ptrace capabilities this can be used to escalate privileges outside of the container.

There should be at least one admission control policy defined which does not permit containers to share the host PID namespace.

If you need to run containers which require hostPID, this should be defined in a separate policy and you should carefully check to ensure that only limited service accounts and users are given permission to use that policy.

## Control impact_statement

Pods defined with `spec.hostPID: true` will not be permitted unless they are run under a specific policy.

## Control remediation_procedure

Add policies to each namespace in the cluster which has user workloads to restrict the admission of `hostPID` containers.

## Control audit_procedure

List the policies in use for each namespace in the cluster, ensure that each policy disallows the admission of `hostPID` containers

## Control CIS_Controls

TITLE:Perform Application Layer Filtering CONTROL:v8 13.10 DESCRIPTION:Perform application layer filtering. Example implementations include a filtering proxy, application layer firewall, or gateway.;TITLE:Deploy Application Layer Filtering Proxy Server CONTROL:v7 12.9 DESCRIPTION:Ensure that all network traffic to or from the Internet passes through an authenticated application layer proxy that is configured to filter unauthorized connections.;
