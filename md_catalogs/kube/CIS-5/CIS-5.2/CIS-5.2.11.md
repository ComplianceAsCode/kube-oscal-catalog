# CIS-5.2.11 - \[Pod Security Standards\] Minimize the admission of Windows HostProcess Containers

## Control Statement

Do not generally permit Windows containers to be run with the `hostProcess` flag set to true.

## Control rationale_statement

A Windows container making use of the `hostProcess` flag can interact with the underlying Windows cluster node. As per the Kubernetes documentation, this provides "privileged access" to the Windows node.

Where Windows containers are used inside a Kubernetes cluster, there should be at least one admission control policy which does not permit `hostProcess` Windows containers.

If you need to run Windows containers which require `hostProcess`, this should be defined in a separate policy and you should carefully check to ensure that only limited service accounts and users are given permission to use that policy.

## Control impact_statement

Pods defined with `securityContext.windowsOptions.hostProcess: true` will not be permitted unless they are run under a specific policy.

## Control remediation_procedure

Add policies to each namespace in the cluster which has user workloads to restrict the admission of `hostProcess` containers.

## Control audit_procedure

List the policies in use for each namespace in the cluster, ensure that each policy disallows the admission of `hostProcess` containers
