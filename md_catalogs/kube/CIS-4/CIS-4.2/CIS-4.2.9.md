# CIS-4.2.9 - \[Kubelet\] Ensure that the --tls-cert-file and --tls-private-key-file arguments are set as appropriate

## Control Statement

Setup TLS connection on the Kubelets.

## Control rationale_statement

The connections from the apiserver to the kubelet are used for fetching logs for pods, attaching (through kubectl) to running pods, and using the kubelet’s port-forwarding functionality. These connections terminate at the kubelet’s HTTPS endpoint. By default, the apiserver does not verify the kubelet’s serving certificate, which makes the connection subject to man-in-the-middle attacks, and unsafe to run over untrusted and/or public networks.

## Control remediation_procedure

If using a Kubelet config file, edit the file to set tlsCertFile to the location of the certificate file to use to identify this Kubelet, and tlsPrivateKeyFile to the location of the corresponding private key file.

If using command line arguments, edit the kubelet service file /etc/kubernetes/kubelet.conf on each worker node and set the below parameters in KUBELET_CERTIFICATE_ARGS variable.

--tls-cert-file=<path/to/tls-certificate-file> --tls-private-key-file=<path/to/tls-key-file>
Based on your system, restart the kubelet service. For example:

```
systemctl daemon-reload
systemctl restart kubelet.service
```

## Control audit_procedure

Run the following command on each node:

```
ps -ef | grep kubelet
```

Verify that the --tls-cert-file and --tls-private-key-file arguments exist and they are set as appropriate.

If these arguments are not present, check that there is a Kubelet config specified by --config and that it contains appropriate settings for tlsCertFile and tlsPrivateKeyFile.

## Control CIS_Controls

TITLE:Encrypt Sensitive Data in Transit CONTROL:v8 3.10 DESCRIPTION:Encrypt sensitive data in transit. Example implementations can include: Transport Layer Security (TLS) and Open Secure Shell (OpenSSH).;TITLE:Encrypt All Sensitive Information in Transit CONTROL:v7 14.4 DESCRIPTION:Encrypt all sensitive information in transit.;
