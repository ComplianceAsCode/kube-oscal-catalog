# CIS-1.2.30 - \[API Server\] Ensure that encryption providers are appropriately configured

## Control Statement

Where `etcd` encryption is used, appropriate providers should be configured.

## Control rationale_statement

Where `etcd` encryption is used, it is important to ensure that the appropriate set of encryption providers is used. Currently, the `aescbc`, `kms` and `secretbox` are likely to be appropriate options.

## Control impact_statement

None

## Control remediation_procedure

Follow the Kubernetes documentation and configure a `EncryptionConfig` file. In this file, choose `aescbc`, `kms` or `secretbox` as the encryption provider.

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-apiserver
```

Get the `EncryptionConfig` file set for `--encryption-provider-config` argument. Verify that `aescbc`, `kms` or `secretbox` is set as the encryption provider for all the desired `resources`.

## Control CIS_Controls

TITLE:Encrypt Sensitive Data at Rest CONTROL:v8 3.11 DESCRIPTION:Encrypt sensitive data at rest on servers, applications, and databases containing sensitive data. Storage-layer encryption, also known as server-side encryption, meets the minimum requirement of this Safeguard. Additional encryption methods may include application-layer encryption, also known as client-side encryption, where access to the data storage device(s) does not permit access to the plain-text data. ;TITLE:Encrypt Sensitive Information at Rest CONTROL:v7 14.8 DESCRIPTION:Encrypt all sensitive information at rest using a tool that requires a secondary authentication mechanism not integrated into the operating system, in order to access the information.;
