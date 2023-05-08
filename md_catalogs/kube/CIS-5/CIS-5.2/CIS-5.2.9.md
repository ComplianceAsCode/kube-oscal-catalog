# CIS-5.2.9 - \[Pod Security Standards\] Minimize the admission of containers with added capabilities

## Control Statement

Do not generally permit containers with capabilities assigned beyond the default set.

## Control rationale_statement

Containers run with a default set of capabilities as assigned by the Container Runtime. Capabilities outside this set can be added to containers which could expose them to risks of container breakout attacks.

There should be at least one policy defined which prevents containers with capabilities beyond the default set from launching.

If you need to run containers with additional capabilities, this should be defined in a separate policy and you should carefully check to ensure that only limited service accounts and users are given permission to use that policy.

## Control impact_statement

Pods with containers which require capabilities outwith the default set will not be permitted.

## Control remediation_procedure

Ensure that `allowedCapabilities` is not present in policies for the cluster unless it is set to an empty array.

## Control audit_procedure

List the policies in use for each namespace in the cluster, ensure that policies are present which prevent `allowedCapabilities` to be set to anything other than an empty array.

## Control CIS_Controls

TITLE:Uninstall or Disable Unnecessary Services on Enterprise Assets and Software CONTROL:v8 4.8 DESCRIPTION:Uninstall or disable unnecessary services on enterprise assets and software, such as an unused file sharing service, web application module, or service function.;TITLE:Maintain Secure Images CONTROL:v7 5.2 DESCRIPTION:Maintain secure images or templates for all systems in the enterprise based on the organization's approved configuration standards. Any new system deployment or existing system that becomes compromised should be imaged using one of those images or templates.;
