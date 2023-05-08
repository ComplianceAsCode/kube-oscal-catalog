# CIS-1.1.10 - \[Control Plane Node Configuration Files\] Ensure that the Container Network Interface file ownership is set to root:root

## Control Statement

Ensure that the Container Network Interface files have ownership set to `root:root`.

## Control rationale_statement

Container Network Interface provides various networking options for overlay networking. You should consult their documentation and restrict their respective file permissions to maintain the integrity of those files. Those files should be owned by `root:root`.

## Control impact_statement

None

## Control remediation_procedure

Run the below command (based on the file location on your system) on the Control Plane node. For example,

```
chown root:root <path/to/cni/files>
```

## Control audit_procedure

Run the below command (based on the file location on your system) on the Control Plane node. For example,

```
stat -c %U:%G <path/to/cni/files>
```

Verify that the ownership is set to `root:root`.

## Control CIS_Controls

TITLE:Restrict Administrator Privileges to Dedicated Administrator Accounts CONTROL:v8 5.4 DESCRIPTION:Restrict administrator privileges to dedicated administrator accounts on enterprise assets. Conduct general computing activities, such as internet browsing, email, and productivity suite use, from the user’s primary, non-privileged account.;TITLE:Controlled Use of Administrative Privileges CONTROL:v7 4 DESCRIPTION:Controlled Use of Administrative Privileges;
