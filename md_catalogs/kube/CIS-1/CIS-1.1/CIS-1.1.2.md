# CIS-1.1.2 - \[Control Plane Node Configuration Files\] Ensure that the API server pod specification file ownership is set to root:root

## Control Statement

Ensure that the API server pod specification file ownership is set to `root:root`.

## Control rationale_statement

The API server pod specification file controls various parameters that set the behavior of the API server. You should set its file ownership to maintain the integrity of the file. The file should be owned by `root:root`.

## Control impact_statement

None

## Control remediation_procedure

Run the below command (based on the file location on your system) on the Control Plane node. For example,

```
chown root:root /etc/kubernetes/manifests/kube-apiserver.yaml
```

## Control audit_procedure

Run the below command (based on the file location on your system) on the Control Plane node. For example,

```
stat -c %U:%G /etc/kubernetes/manifests/kube-apiserver.yaml
```

Verify that the ownership is set to `root:root`.

## Control CIS_Controls

TITLE:Restrict Administrator Privileges to Dedicated Administrator Accounts CONTROL:v8 5.4 DESCRIPTION:Restrict administrator privileges to dedicated administrator accounts on enterprise assets. Conduct general computing activities, such as internet browsing, email, and productivity suite use, from the user’s primary, non-privileged account.;TITLE:Controlled Use of Administrative Privileges CONTROL:v7 4 DESCRIPTION:Controlled Use of Administrative Privileges;
