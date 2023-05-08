# CIS-5.2.5 - \[Pod Security Standards\] Minimize the admission of containers wishing to share the host network namespace

## Control Statement

Do not generally permit containers to be run with the `hostNetwork` flag set to true.

## Control rationale_statement

A container running in the host's network namespace could access the local loopback device, and could access network traffic to and from other pods.

There should be at least one admission control policy defined which does not permit containers to share the host network namespace.

If you need to run containers which require access to the host's network namesapces, this should be defined in a separate policy and you should carefully check to ensure that only limited service accounts and users are given permission to use that policy.

## Control impact_statement

Pods defined with `spec.hostNetwork: true` will not be permitted unless they are run under a specific policy.

## Control remediation_procedure

Add policies to each namespace in the cluster which has user workloads to restrict the admission of `hostNetwork` containers.

## Control audit_procedure

List the policies in use for each namespace in the cluster, ensure that each policy disallows the admission of `hostNetwork` containers

## Control CIS_Controls

TITLE:Segment Data Processing and Storage Based on Sensitivity CONTROL:v8 3.12 DESCRIPTION:Segment data processing and storage based on the sensitivity of the data. Do not process sensitive data on enterprise assets intended for lower sensitivity data.;TITLE:Segment the Network Based on Sensitivity CONTROL:v7 14.1 DESCRIPTION:Segment the network based on the label or classification level of the information stored on the servers, locate all sensitive information on separated Virtual Local Area Networks (VLANs).;
