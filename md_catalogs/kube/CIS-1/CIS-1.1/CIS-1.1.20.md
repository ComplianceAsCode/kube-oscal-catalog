# CIS-1.1.20 - \[Control Plane Node Configuration Files\] Ensure that the Kubernetes PKI certificate file permissions are set to 600 or more restrictive

## Control Statement

Ensure that Kubernetes PKI certificate files have permissions of `600` or more restrictive.

## Control rationale_statement

Kubernetes makes use of a number of certificate files as part of the operation of its components. The permissions on these files should be set to `600` or more restrictive to protect their integrity.

## Control impact_statement

None

## Control remediation_procedure

Run the below command (based on the file location on your system) on the Control Plane node. For example,

```
chmod -R 600 /etc/kubernetes/pki/*.crt
```

## Control audit_procedure

Run the below command (based on the file location on your system) on the Control Plane node. For example,

```
ls -laR /etc/kubernetes/pki/*.crt
```

Verify that the permissions are `600` or more restrictive.

## Control CIS_Controls

TITLE:Restrict Administrator Privileges to Dedicated Administrator Accounts CONTROL:v8 5.4 DESCRIPTION:Restrict administrator privileges to dedicated administrator accounts on enterprise assets. Conduct general computing activities, such as internet browsing, email, and productivity suite use, from the user’s primary, non-privileged account.;TITLE:Controlled Use of Administrative Privileges CONTROL:v7 4 DESCRIPTION:Controlled Use of Administrative Privileges;
