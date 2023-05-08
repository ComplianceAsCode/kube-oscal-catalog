# CIS-5.7.2 - \[General Policies\] Ensure that the seccomp profile is set to docker/default in your pod definitions

## Control Statement

Enable `docker/default` seccomp profile in your pod definitions.

## Control rationale_statement

Seccomp (secure computing mode) is used to restrict the set of system calls applications can make, allowing cluster administrators greater control over the security of workloads running in the cluster. Kubernetes disables seccomp profiles by default for historical reasons. You should enable it to ensure that the workloads have restricted actions available within the container.

## Control impact_statement

If the `docker/default` seccomp profile is too restrictive for you, you would have to create/manage your own seccomp profiles.

## Control remediation_procedure

Use security context to enable the `docker/default` seccomp profile in your pod definitions. An example is as below:
```
 securityContext:
 seccompProfile:
 type: RuntimeDefault
```

## Control audit_procedure

Review the pod definitions in your cluster. It should create a line as below:

```
 securityContext:
 seccompProfile:
 type: RuntimeDefault
```

## Control CIS_Controls

TITLE:Use Standard Hardening Configuration Templates for Application Infrastructure CONTROL:v8 16.7 DESCRIPTION:Use standard, industry-recommended hardening configuration templates for application infrastructure components. This includes underlying servers, databases, and web servers, and applies to cloud containers, Platform as a Service (PaaS) components, and SaaS components. Do not allow in-house developed software to weaken configuration hardening.;TITLE:Maintain Secure Images CONTROL:v7 5.2 DESCRIPTION:Maintain secure images or templates for all systems in the enterprise based on the organization's approved configuration standards. Any new system deployment or existing system that becomes compromised should be imaged using one of those images or templates.;
