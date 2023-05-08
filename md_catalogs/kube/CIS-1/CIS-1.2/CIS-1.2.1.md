# CIS-1.2.1 - \[API Server\] Ensure that the --anonymous-auth argument is set to false

## Control Statement

Disable anonymous requests to the API server.

## Control rationale_statement

When enabled, requests that are not rejected by other configured authentication methods are treated as anonymous requests. These requests are then served by the API server. You should rely on authentication to authorize access and disallow anonymous requests.

If you are using RBAC authorization, it is generally considered reasonable to allow anonymous access to the API Server for health checks and discovery purposes, and hence this recommendation is not scored. However, you should consider whether anonymous discovery is an acceptable risk for your purposes.

## Control impact_statement

Anonymous requests will be rejected.

## Control remediation_procedure

Edit the API server pod specification file `/etc/kubernetes/manifests/kube-apiserver.yaml` on the Control Plane node and set the below parameter.

```
--anonymous-auth=false
```

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-apiserver
```

Verify that the `--anonymous-auth` argument is set to `false`.

Alternative Audit

kubectl get pod -nkube-system -lcomponent=kube-apiserver -o=jsonpath='{range .items[*]}{.spec.containers[*].command} {"\n"}{end}' | grep '\--anonymous-auth' | grep -i false

If the exit code is '1', then the control isn't present / failed

## Control CIS_Controls

TITLE:Configure Data Access Control Lists CONTROL:v8 3.3 DESCRIPTION:Configure data access control lists based on a user’s need to know. Apply data access control lists, also known as access permissions, to local and remote file systems, databases, and applications.;TITLE:Protect Information through Access Control Lists CONTROL:v7 14.6 DESCRIPTION:Protect all information stored on systems with file system, network share, claims, application, or database specific access control lists. These controls will enforce the principle that only authorized individuals should have access to the information based on their need to access the information as a part of their responsibilities.;
