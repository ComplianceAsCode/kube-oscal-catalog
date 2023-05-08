# CIS-5.2.12 - \[Pod Security Standards\] Minimize the admission of HostPath volumes

## Control Statement

Do not generally admit containers which make use of `hostPath` volumes.

## Control rationale_statement

A container which mounts a `hostPath` volume as part of its specification will have access to the filesystem of the underlying cluster node. The use of `hostPath` volumes may allow containers access to privileged areas of the node filesystem.

There should be at least one admission control policy defined which does not permit containers to mount `hostPath` volumes.

If you need to run containers which require `hostPath` volumes, this should be defined in a separate policy and you should carefully check to ensure that only limited service accounts and users are given permission to use that policy.

## Control impact_statement

Pods defined which make use of `hostPath` volumes will not be permitted unless they are run under a spefific policy.

## Control remediation_procedure

Add policies to each namespace in the cluster which has user workloads to restrict the admission of containers which use `hostPath` volumes.

## Control audit_procedure

List the policies in use for each namespace in the cluster, ensure that each policy disallows the admission of containers with `hostPath` volumes.
