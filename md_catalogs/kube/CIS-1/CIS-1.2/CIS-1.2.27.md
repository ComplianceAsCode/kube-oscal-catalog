# CIS-1.2.27 - \[API Server\] Ensure that the --client-ca-file argument is set as appropriate

## Control Statement

Setup TLS connection on the API server.

## Control rationale_statement

API server communication contains sensitive parameters that should remain encrypted in transit. Configure the API server to serve only HTTPS traffic. If `--client-ca-file` argument is set, any request presenting a client certificate signed by one of the authorities in the `client-ca-file` is authenticated with an identity corresponding to the CommonName of the client certificate.

## Control impact_statement

TLS and client certificate authentication must be configured for your Kubernetes cluster deployment.

## Control remediation_procedure

Follow the Kubernetes documentation and set up the TLS connection on the apiserver. Then, edit the API server pod specification file `/etc/kubernetes/manifests/kube-apiserver.yaml` on the master node and set the client certificate authority file.

```
--client-ca-file=<path/to/client-ca-file>
```

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-apiserver
```

Verify that the `--client-ca-file` argument exists and it is set as appropriate.

## Control CIS_Controls

TITLE:Encrypt Sensitive Data in Transit CONTROL:v8 3.10 DESCRIPTION:Encrypt sensitive data in transit. Example implementations can include: Transport Layer Security (TLS) and Open Secure Shell (OpenSSH).;TITLE:Encrypt All Sensitive Information in Transit CONTROL:v7 14.4 DESCRIPTION:Encrypt all sensitive information in transit.;
