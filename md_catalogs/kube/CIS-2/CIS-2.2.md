# CIS-2.2 - \[etcd\] Ensure that the --client-cert-auth argument is set to true

## Control Statement

Enable client authentication on etcd service.

## Control rationale_statement

etcd is a highly-available key value store used by Kubernetes deployments for persistent storage of all of its REST API objects. These objects are sensitive in nature and should not be available to unauthenticated clients. You should enable the client authentication via valid certificates to secure the access to the etcd service.

## Control impact_statement

All clients attempting to access the etcd server will require a valid client certificate.

## Control remediation_procedure

Edit the etcd pod specification file `/etc/kubernetes/manifests/etcd.yaml` on the master node and set the below parameter.

```
--client-cert-auth="true"
```

## Control audit_procedure

Run the following command on the etcd server node:

```
ps -ef | grep etcd
```

Verify that the `--client-cert-auth` argument is set to `true`.

## Control CIS_Controls

TITLE:Encrypt Sensitive Data at Rest CONTROL:v8 3.11 DESCRIPTION:Encrypt sensitive data at rest on servers, applications, and databases containing sensitive data. Storage-layer encryption, also known as server-side encryption, meets the minimum requirement of this Safeguard. Additional encryption methods may include application-layer encryption, also known as client-side encryption, where access to the data storage device(s) does not permit access to the plain-text data. ;TITLE:Encrypt Sensitive Information at Rest CONTROL:v7 14.8 DESCRIPTION:Encrypt all sensitive information at rest using a tool that requires a secondary authentication mechanism not integrated into the operating system, in order to access the information.;
