# CIS-2.7 - \[etcd\] Ensure that a unique Certificate Authority is used for etcd

## Control Statement

Use a different certificate authority for etcd from the one used for Kubernetes.

## Control rationale_statement

etcd is a highly available key-value store used by Kubernetes deployments for persistent storage of all of its REST API objects. Its access should be restricted to specifically designated clients and peers only. 

Authentication to etcd is based on whether the certificate presented was issued by a trusted certificate authority. There is no checking of certificate attributes such as common name or subject alternative name. As such, if any attackers were able to gain access to any certificate issued by the trusted certificate authority, they would be able to gain full access to the etcd database.

## Control impact_statement

Additional management of the certificates and keys for the dedicated certificate authority will be required.

## Control remediation_procedure

Follow the etcd documentation and create a dedicated certificate authority setup for the etcd service.

Then, edit the etcd pod specification file `/etc/kubernetes/manifests/etcd.yaml` on the master node and set the below parameter.

```
--trusted-ca-file=</path/to/ca-file>
```

## Control audit_procedure

Review the CA used by the etcd environment and ensure that it does not match the CA certificate file used for the management of the overall Kubernetes cluster.

Run the following command on the master node:

```
ps -ef | grep etcd
```

Note the file referenced by the `--trusted-ca-file` argument. 

Run the following command on the master node: 

```
ps -ef | grep apiserver
```

Verify that the file referenced by the `--client-ca-file` for apiserver is different from the `--trusted-ca-file` used by etcd.

## Control CIS_Controls

TITLE:Establish an Access Granting Process CONTROL:v8 6.1 DESCRIPTION:Establish and follow a process, preferably automated, for granting access to enterprise assets upon new hire, rights grant, or role change of a user.;TITLE:Establish an Access Revoking Process CONTROL:v8 6.2 DESCRIPTION:Establish and follow a process, preferably automated, for revoking access to enterprise assets, through disabling accounts immediately upon termination, rights revocation, or role change of a user. Disabling accounts, instead of deleting accounts, may be necessary to preserve audit trails.;
