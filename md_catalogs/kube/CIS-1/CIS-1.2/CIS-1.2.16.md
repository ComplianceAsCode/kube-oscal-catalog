# CIS-1.2.16 - \[API Server\] Ensure that the --secure-port argument is not set to 0 - NoteThis recommendation is obsolete and will be deleted per the consensus process.

## Control Statement

This recommendation is obsolete and will be deleted per the consensus process.

## Control rationale_statement

The secure port is used to serve https with authentication and authorization. If you disable it, no https traffic is served and all traffic is served unencrypted.

## Control impact_statement

You need to set the API Server up with the right TLS certificates.

## Control remediation_procedure

Edit the API server pod specification file `/etc/kubernetes/manifests/kube-apiserver.yaml` on the Control Plane node and either remove the `--secure-port` parameter or set it to a different (non-zero) desired port.

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-apiserver
```

Verify that the `--secure-port` argument is either not set or is set to an integer value between 1 and 65535.

## Control CIS_Controls

TITLE:Encrypt Sensitive Data in Transit CONTROL:v8 3.10 DESCRIPTION:Encrypt sensitive data in transit. Example implementations can include: Transport Layer Security (TLS) and Open Secure Shell (OpenSSH).;TITLE:Encrypt All Sensitive Information in Transit CONTROL:v7 14.4 DESCRIPTION:Encrypt all sensitive information in transit.;
