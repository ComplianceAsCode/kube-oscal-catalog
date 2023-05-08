# CIS-4.2.10 - \[Kubelet\] Ensure that the --rotate-certificates argument is not set to false

## Control Statement

Enable kubelet client certificate rotation.

## Control rationale_statement

The `--rotate-certificates` setting causes the kubelet to rotate its client certificates by creating new CSRs as its existing credentials expire. This automated periodic rotation ensures that the there is no downtime due to expired certificates and thus addressing availability in the CIA security triad.

**Note:** This recommendation only applies if you let kubelets get their certificates from the API server. In case your kubelet certificates come from an outside authority/tool (e.g. Vault) then you need to take care of rotation yourself.

**Note:** This feature also require the `RotateKubeletClientCertificate` feature gate to be enabled (which is the default since Kubernetes v1.7)

## Control impact_statement

None

## Control remediation_procedure

If using a Kubelet config file, edit the file to add the line `rotateCertificates: true` or remove it altogether to use the default value.

If using command line arguments, edit the kubelet service file `/etc/kubernetes/kubelet.conf` on each worker node and remove `--rotate-certificates=false` argument from the `KUBELET_CERTIFICATE_ARGS` variable.

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

Verify that the `--rotate-certificates` argument is not present, or is set to `true`.

If the `--rotate-certificates` argument is not present, verify that if there is a Kubelet config file specified by `--config`, that file does not contain `rotateCertificates: false`.

## Control CIS_Controls

TITLE:Encrypt Sensitive Data in Transit CONTROL:v8 3.10 DESCRIPTION:Encrypt sensitive data in transit. Example implementations can include: Transport Layer Security (TLS) and Open Secure Shell (OpenSSH).;TITLE:Encrypt All Sensitive Information in Transit CONTROL:v7 14.4 DESCRIPTION:Encrypt all sensitive information in transit.;
