# CIS-4.2.1 - \[Kubelet\] Ensure that the --anonymous-auth argument is set to false

## Control Statement

Disable anonymous requests to the Kubelet server.

## Control rationale_statement

When enabled, requests that are not rejected by other configured authentication methods are treated as anonymous requests. These requests are then served by the Kubelet server. You should rely on authentication to authorize access and disallow anonymous requests.

## Control impact_statement

Anonymous requests will be rejected.

## Control remediation_procedure

If using a Kubelet config file, edit the file to set `authentication: anonymous: enabled` to `false`. 

If using executable arguments, edit the kubelet service file `/etc/kubernetes/kubelet.conf` on each worker node and set the below parameter in `KUBELET_SYSTEM_PODS_ARGS` variable.

```
--anonymous-auth=false
```

Based on your system, restart the `kubelet` service. For example:

```
systemctl daemon-reload
systemctl restart kubelet.service
```

## Control audit_procedure

If using a Kubelet configuration file, check that there is an entry for `authentication: anonymous: enabled` set to `false`. 

Run the following command on each node:

```
ps -ef | grep kubelet
```

Verify that the `--anonymous-auth` argument is set to `false`. 

This executable argument may be omitted, provided there is a corresponding entry set to `false` in the Kubelet config file.

## Control CIS_Controls

TITLE:Configure Data Access Control Lists CONTROL:v8 3.3 DESCRIPTION:Configure data access control lists based on a user’s need to know. Apply data access control lists, also known as access permissions, to local and remote file systems, databases, and applications.;TITLE:Protect Information through Access Control Lists CONTROL:v7 14.6 DESCRIPTION:Protect all information stored on systems with file system, network share, claims, application, or database specific access control lists. These controls will enforce the principle that only authorized individuals should have access to the information based on their need to access the information as a part of their responsibilities.;
