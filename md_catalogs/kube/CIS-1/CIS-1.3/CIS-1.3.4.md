# CIS-1.3.4 - \[Controller Manager\] Ensure that the --service-account-private-key-file  argument is set as appropriate

## Control Statement

Explicitly set a service account private key file for service accounts on the controller manager.

## Control rationale_statement

To ensure that keys for service account tokens can be rotated as needed, a separate public/private key pair should be used for signing service account tokens. The private key should be specified to the controller manager with `--service-account-private-key-file` as appropriate.

## Control impact_statement

You would need to securely maintain the key file and rotate the keys based on your organization's key rotation policy.

## Control remediation_procedure

Edit the Controller Manager pod specification file `/etc/kubernetes/manifests/kube-controller-manager.yaml` on the Control Plane node and set the `--service-account-private-key-file` parameter to the private key file for service accounts.

```
--service-account-private-key-file=<filename>
```

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-controller-manager
```

Verify that the `--service-account-private-key-file` argument is set as appropriate.

## Control CIS_Controls

TITLE:Use Unique Passwords CONTROL:v8 5.2 DESCRIPTION:Use unique passwords for all enterprise assets. Best practice implementation includes, at a minimum, an 8-character password for accounts using MFA and a 14-character password for accounts not using MFA. ;TITLE:Use Unique Passwords CONTROL:v7 4.4 DESCRIPTION:Where multi-factor authentication is not supported (such as local administrator, root, or service accounts), accounts will use passwords that are unique to that system.;TITLE:Controlled Access Based on the Need to Know CONTROL:v6 14 DESCRIPTION:Controlled Access Based on the Need to Know;
