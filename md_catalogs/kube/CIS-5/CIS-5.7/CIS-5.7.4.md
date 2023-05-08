# CIS-5.7.4 - \[General Policies\] The default namespace should not be used

## Control Statement

Kubernetes provides a default namespace, where objects are placed if no namespace is specified for them. Placing objects in this namespace makes application of RBAC and other controls more difficult.

## Control rationale_statement

Resources in a Kubernetes cluster should be segregated by namespace, to allow for security controls to be applied at that level and to make it easier to manage resources.

## Control impact_statement

None

## Control remediation_procedure

Ensure that namespaces are created to allow for appropriate segregation of Kubernetes resources and that all new resources are created in a specific namespace.

## Control audit_procedure

Run this command to list objects in default namespace

```
kubectl get $(kubectl api-resources --verbs=list --namespaced=true -o name | paste -sd, -) --ignore-not-found -n default
```

The only entries there should be system managed resources such as the `kubernetes` service

## Control CIS_Controls

TITLE:Establish and Maintain a Secure Network Architecture CONTROL:v8 12.2 DESCRIPTION:Establish and maintain a secure network architecture. A secure network architecture must address segmentation, least privilege, and availability, at a minimum.;TITLE:Physically or Logically Segregate High Risk Applications CONTROL:v7 2.10 DESCRIPTION:Physically or logically segregated systems should be used to isolate and run software that is required for business operations but incur higher risk for the organization.;
