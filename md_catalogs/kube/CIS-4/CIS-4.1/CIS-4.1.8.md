# CIS-4.1.8 - \[Worker Node Configuration Files\] Ensure that the client certificate authorities file ownership is set to root:root

## Control Statement

Ensure that the certificate authorities file ownership is set to `root:root`.

## Control rationale_statement

The certificate authorities file controls the authorities used to validate API requests. You should set its file ownership to maintain the integrity of the file. The file should be owned by `root:root`.

## Control impact_statement

None

## Control remediation_procedure

Run the following command to modify the ownership of the `--client-ca-file`.

```
chown root:root <filename>
```

## Control audit_procedure

Run the following command:

```
ps -ef | grep kubelet
```

Find the file specified by the `--client-ca-file` argument.

Run the following command:

```
stat -c %U:%G <filename>
```

Verify that the ownership is set to `root:root`.

## Control CIS_Controls

TITLE:Restrict Administrator Privileges to Dedicated Administrator Accounts CONTROL:v8 5.4 DESCRIPTION:Restrict administrator privileges to dedicated administrator accounts on enterprise assets. Conduct general computing activities, such as internet browsing, email, and productivity suite use, from the user’s primary, non-privileged account.;TITLE:Controlled Use of Administrative Privileges CONTROL:v7 4 DESCRIPTION:Controlled Use of Administrative Privileges;
