# CIS-5.2.13 - \[Pod Security Standards\] Minimize the admission of containers which use HostPorts

## Control Statement

Do not generally permit containers which require the use of HostPorts.

## Control rationale_statement

Host ports connect containers directly to the host's network. This can bypass controls such as network policy.

There should be at least one admission control policy defined which does not permit containers which require the use of HostPorts.

If you need to run containers which require HostPorts, this should be defined in a separate policy and you should carefully check to ensure that only limited service accounts and users are given permission to use that policy.

## Control impact_statement

Pods defined with `hostPort` settings in either the container, initContainer or ephemeralContainer sections will not be permitted unless they are run under a specific policy.

## Control remediation_procedure

Add policies to each namespace in the cluster which has user workloads to restrict the admission of containers which use `hostPort` sections.

## Control audit_procedure

List the policies in use for each namespace in the cluster, ensure that each policy disallows the admission of containers which have `hostPort` sections.
