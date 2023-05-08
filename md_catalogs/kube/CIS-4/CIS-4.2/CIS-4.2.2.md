# CIS-4.2.2 - \[Kubelet\] Ensure that the --authorization-mode argument is not set to AlwaysAllow

## Control Statement

Do not allow all requests. Enable explicit authorization.

## Control rationale_statement

Kubelets, by default, allow all authenticated requests (even anonymous ones) without needing explicit authorization checks from the apiserver. You should restrict this behavior and only allow explicitly authorized requests.

## Control impact_statement

Unauthorized requests will be denied.

## Control remediation_procedure

If using a Kubelet config file, edit the file to set `authorization: mode` to `Webhook`. 

If using executable arguments, edit the kubelet service file `/etc/kubernetes/kubelet.conf` on each worker node and set the below parameter in `KUBELET_AUTHZ_ARGS` variable.

```
--authorization-mode=Webhook
```

Based on your system, restart the `kubelet` service. For example:

```
systemctl daemon-reload
systemctl restart kubelet.service
```

## Control audit_procedure

Run the following command on each node:

```
ps -ef | grep kubelet
```

If the `--authorization-mode` argument is present check that it is not set to `AlwaysAllow`. If it is not present check that there is a Kubelet config file specified by `--config`, and that file sets `authorization: mode` to something other than `AlwaysAllow`.

It is also possible to review the running configuration of a Kubelet via the `/configz` endpoint on the Kubelet API port (typically `10250/TCP`). Accessing these with appropriate credentials will provide details of the Kubelet's configuration.

## Control CIS_Controls

TITLE:Configure Data Access Control Lists CONTROL:v8 3.3 DESCRIPTION:Configure data access control lists based on a user’s need to know. Apply data access control lists, also known as access permissions, to local and remote file systems, databases, and applications.;TITLE:Ensure Only Approved Ports, Protocols and Services Are Running CONTROL:v7 9.2 DESCRIPTION:Ensure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.;
