# CIS-1.1.14 - \[Control Plane Node Configuration Files\] Ensure that the admin.conf file ownership is set to root:root

## Control Statement

Ensure that the `admin.conf` file ownership is set to `root:root`.

## Control rationale_statement

The `admin.conf` file contains the admin credentials for the cluster. You should set its file ownership to maintain the integrity and confidentiality of the file. The file should be owned by root:root.

## Control impact_statement

None.

## Control remediation_procedure

Run the below command (based on the file location on your system) on the Control Plane node. For example,

```
chown root:root /etc/kubernetes/admin.conf
```

## Control audit_procedure

Run the below command (based on the file location on your system) on the Control Plane node. For example,

```
stat -c %U:%G /etc/kubernetes/admin.conf
```

Verify that the ownership is set to `root:root`.

## Control CIS_Controls

TITLE:Restrict Administrator Privileges to Dedicated Administrator Accounts CONTROL:v8 5.4 DESCRIPTION:Restrict administrator privileges to dedicated administrator accounts on enterprise assets. Conduct general computing activities, such as internet browsing, email, and productivity suite use, from the user’s primary, non-privileged account.;TITLE:Controlled Use of Administrative Privileges CONTROL:v7 4 DESCRIPTION:Controlled Use of Administrative Privileges;
