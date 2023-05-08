# CIS-5.1.10 - \[RBAC and Service Accounts\] Minimize access to the proxy sub-resource of nodes

## Control Statement

Users with access to the `Proxy` sub-resource of `Node` objects automatically have permissions to use the Kubelet API, which may allow for privilege escalation or bypass cluster security controls such as audit logs.

The Kubelet provides an API which includes rights to execute commands in any container running on the node. Access to this API is covered by permissions to the main Kubernetes API via the `node` object. The proxy sub-resource specifically allows wide ranging access to the Kubelet API.

Direct access to the Kubelet API bypasses controls like audit logging (there is no audit log of Kubelet API access) and admission control.

## Control rationale_statement

The ability to use the `proxy` sub-resource of `node` objects opens up possibilities for privilege escalation and should be restricted, where possible.

## Control remediation_procedure

Where possible, remove access to the `proxy` sub-resource of `node` objects.

## Control audit_procedure

Review the users who have access to the `proxy` sub-resource of `node` objects in the Kubernetes API.

## Control CIS_Controls

TITLE:Define and Maintain Role-Based Access Control CONTROL:v8 6.8 DESCRIPTION:Define and maintain role-based access control, through determining and documenting the access rights necessary for each role within the enterprise to successfully carry out its assigned duties. Perform access control reviews of enterprise assets to validate that all privileges are authorized, on a recurring schedule at a minimum annually, or more frequently.;TITLE:Controlled Access Based on the Need to Know CONTROL:v7 14 DESCRIPTION:Controlled Access Based on the Need to Know;
