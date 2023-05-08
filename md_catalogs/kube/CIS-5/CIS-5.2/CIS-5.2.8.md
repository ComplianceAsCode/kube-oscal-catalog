# CIS-5.2.8 - \[Pod Security Standards\] Minimize the admission of containers with the NET_RAW capability

## Control Statement

Do not generally permit containers with the potentially dangerous NET_RAW capability.

## Control rationale_statement

Containers run with a default set of capabilities as assigned by the Container Runtime. By default this can include potentially dangerous capabilities. With Docker as the container runtime the NET_RAW capability is enabled which may be misused by malicious containers.

Ideally, all containers should drop this capability.

There should be at least one admission control policy defined which does not permit containers with the NET_RAW capability.

If you need to run containers with this capability, this should be defined in a separate policy and you should carefully check to ensure that only limited service accounts and users are given permission to use that policy.

## Control impact_statement

Pods with containers which run with the NET_RAW capability will not be permitted.

## Control remediation_procedure

Add policies to each namespace in the cluster which has user workloads to restrict the admission of containers with the `NET_RAW` capability.

## Control audit_procedure

List the policies in use for each namespace in the cluster, ensure that at least one policy disallows the admission of containers with the `NET_RAW` capability.

## Control CIS_Controls

TITLE:Uninstall or Disable Unnecessary Services on Enterprise Assets and Software CONTROL:v8 4.8 DESCRIPTION:Uninstall or disable unnecessary services on enterprise assets and software, such as an unused file sharing service, web application module, or service function.;TITLE:Maintain Secure Images CONTROL:v7 5.2 DESCRIPTION:Maintain secure images or templates for all systems in the enterprise based on the organization's approved configuration standards. Any new system deployment or existing system that becomes compromised should be imaged using one of those images or templates.;
