# CIS-2.6 - \[etcd\] Ensure that the --peer-auto-tls argument is not set to true

## Control Statement

Do not use automatically generated self-signed certificates for TLS connections between peers.

## Control rationale_statement

etcd is a highly-available key value store used by Kubernetes deployments for persistent storage of all of its REST API objects. These objects are sensitive in nature and should be accessible only by authenticated etcd peers in the etcd cluster. Hence, do not use self-signed certificates for authentication.

## Control impact_statement

All peers attempting to communicate with the etcd server will require a valid client certificate for authentication.

## Control remediation_procedure

Edit the etcd pod specification file `/etc/kubernetes/manifests/etcd.yaml` on the master node and either remove the `--peer-auto-tls` parameter or set it to `false`.

```
--peer-auto-tls=false
```

## Control audit_procedure

Run the following command on the etcd server node:

```
ps -ef | grep etcd
```

Verify that if the `--peer-auto-tls` argument exists, it is not set to `true`.
**Note:** This recommendation is applicable only for etcd clusters. If you are using only one etcd server in your environment then this recommendation is not applicable.

## Control CIS_Controls

TITLE:Use Unique Passwords CONTROL:v8 5.2 DESCRIPTION:Use unique passwords for all enterprise assets. Best practice implementation includes, at a minimum, an 8-character password for accounts using MFA and a 14-character password for accounts not using MFA. ;TITLE:Use Unique Passwords CONTROL:v7 4.4 DESCRIPTION:Where multi-factor authentication is not supported (such as local administrator, root, or service accounts), accounts will use passwords that are unique to that system.;
