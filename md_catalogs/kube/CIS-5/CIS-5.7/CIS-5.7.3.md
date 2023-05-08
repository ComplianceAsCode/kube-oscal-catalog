# CIS-5.7.3 - \[General Policies\] Apply Security Context to Your Pods and Containers

## Control Statement

Apply Security Context to Your Pods and Containers

## Control rationale_statement

A security context defines the operating system security settings (uid, gid, capabilities, SELinux role, etc..) applied to a container. When designing your containers and pods, make sure that you configure the security context for your pods, containers, and volumes. A security context is a property defined in the deployment yaml. It controls the security parameters that will be assigned to the pod/container/volume. There are two levels of security context: pod level security context, and container level security context.

## Control impact_statement

If you incorrectly apply security contexts, you may have trouble running the pods.

## Control remediation_procedure

Follow the Kubernetes documentation and apply security contexts to your pods. For a suggested list of security contexts, you may refer to the CIS Security Benchmark for Docker Containers.

## Control audit_procedure

Review the pod definitions in your cluster and verify that you have security contexts defined as appropriate.

## Control CIS_Controls

TITLE:Secure Configuration of Enterprise Assets and Software CONTROL:v8 4 DESCRIPTION:Establish and maintain the secure configuration of enterprise assets (end-user devices, including portable and mobile; network devices; non-computing/IoT devices; and servers) and software (operating systems and applications).;TITLE:Establish Secure Configurations CONTROL:v7 5.1 DESCRIPTION:Maintain documented, standard security configuration standards for all authorized operating systems and software.;
