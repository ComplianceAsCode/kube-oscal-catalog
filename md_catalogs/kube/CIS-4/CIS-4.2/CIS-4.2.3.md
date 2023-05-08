# CIS-4.2.3 - \[Kubelet\] Ensure that the --client-ca-file argument is set as appropriate

## Control Statement

Enable Kubelet authentication using certificates.

## Control rationale_statement

The connections from the apiserver to the kubelet are used for fetching logs for pods, attaching (through kubectl) to running pods, and using the kubelet’s port-forwarding functionality. These connections terminate at the kubelet’s HTTPS endpoint. By default, the apiserver does not verify the kubelet’s serving certificate, which makes the connection subject to man-in-the-middle attacks, and unsafe to run over untrusted and/or public networks. Enabling Kubelet certificate authentication ensures that the apiserver could authenticate the Kubelet before submitting any requests.

## Control impact_statement

You require TLS to be configured on apiserver as well as kubelets.

## Control remediation_procedure

If using a Kubelet config file, edit the file to set `authentication: x509: clientCAFile` to the location of the client CA file. 

If using command line arguments, edit the kubelet service file `/etc/kubernetes/kubelet.conf` on each worker node and set the below parameter in `KUBELET_AUTHZ_ARGS` variable.

```
--client-ca-file=<path/to/client-ca-file>
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

Verify that the `--client-ca-file` argument exists and is set to the location of the client certificate authority file.

If the `--client-ca-file` argument is not present, check that there is a Kubelet config file specified by `--config`, and that the file sets `authentication: x509: clientCAFile` to the location of the client certificate authority file.

## Control CIS_Controls

TITLE:Encrypt Sensitive Data in Transit CONTROL:v8 3.10 DESCRIPTION:Encrypt sensitive data in transit. Example implementations can include: Transport Layer Security (TLS) and Open Secure Shell (OpenSSH).;TITLE:Encrypt All Sensitive Information in Transit CONTROL:v7 14.4 DESCRIPTION:Encrypt all sensitive information in transit.;
