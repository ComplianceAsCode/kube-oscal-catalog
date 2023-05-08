# CIS-5.5.1 - \[Extensible Admission Control\] Configure Image Provenance using ImagePolicyWebhook admission controller

## Control Statement

Configure Image Provenance for your deployment.

## Control rationale_statement

Kubernetes supports plugging in provenance rules to accept or reject the images in your deployments. You could configure such rules to ensure that only approved images are deployed in the cluster.

## Control impact_statement

You need to regularly maintain your provenance configuration based on container image updates.

## Control remediation_procedure

Follow the Kubernetes documentation and setup image provenance.

## Control audit_procedure

Review the pod definitions in your cluster and verify that image provenance is configured as appropriate.

## Control CIS_Controls

TITLE:Use Standard Hardening Configuration Templates for Application Infrastructure CONTROL:v8 16.7 DESCRIPTION:Use standard, industry-recommended hardening configuration templates for application infrastructure components. This includes underlying servers, databases, and web servers, and applies to cloud containers, Platform as a Service (PaaS) components, and SaaS components. Do not allow in-house developed software to weaken configuration hardening.;TITLE:Maintain Secure Images CONTROL:v7 5.2 DESCRIPTION:Maintain secure images or templates for all systems in the enterprise based on the organization's approved configuration standards. Any new system deployment or existing system that becomes compromised should be imaged using one of those images or templates.;
