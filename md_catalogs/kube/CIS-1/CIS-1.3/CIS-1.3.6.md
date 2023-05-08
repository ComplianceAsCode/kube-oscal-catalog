# CIS-1.3.6 - \[Controller Manager\] Ensure that the RotateKubeletServerCertificate argument is set to true

## Control Statement

Enable kubelet server certificate rotation on controller-manager.

## Control rationale_statement

`RotateKubeletServerCertificate` causes the kubelet to both request a serving certificate after bootstrapping its client credentials and rotate the certificate as its existing credentials expire. This automated periodic rotation ensures that the there are no downtimes due to expired certificates and thus addressing availability in the CIA security triad.

Note: This recommendation only applies if you let kubelets get their certificates from the API server. In case your kubelet certificates come from an outside authority/tool (e.g. Vault) then you need to take care of rotation yourself.

## Control impact_statement

None

## Control remediation_procedure

Edit the Controller Manager pod specification file `/etc/kubernetes/manifests/kube-controller-manager.yaml` on the Control Plane node and set the `--feature-gates` parameter to include `RotateKubeletServerCertificate=true`.

```
--feature-gates=RotateKubeletServerCertificate=true
```

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-controller-manager
```

Verify that `RotateKubeletServerCertificate` argument exists and is set to `true`.

## Control CIS_Controls

TITLE:Encrypt Sensitive Data in Transit CONTROL:v8 3.10 DESCRIPTION:Encrypt sensitive data in transit. Example implementations can include: Transport Layer Security (TLS) and Open Secure Shell (OpenSSH).;TITLE:Encrypt All Sensitive Information in Transit CONTROL:v7 14.4 DESCRIPTION:Encrypt all sensitive information in transit.;
