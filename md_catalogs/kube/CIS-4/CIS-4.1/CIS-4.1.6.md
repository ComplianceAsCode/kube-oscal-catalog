# CIS-4.1.6 - \[Worker Node Configuration Files\] Ensure that the --kubeconfig kubelet.conf file ownership is set to root:root

## Control Statement

Ensure that the `kubelet.conf` file ownership is set to `root:root`.

## Control rationale_statement

The `kubelet.conf` file is the kubeconfig file for the node, and controls various parameters that set the behavior and identity of the worker node. You should set its file ownership to maintain the integrity of the file. The file should be owned by `root:root`.

## Control impact_statement

None

## Control remediation_procedure

Run the below command (based on the file location on your system) on the each worker node. For example,

```
chown root:root /etc/kubernetes/kubelet.conf
```

## Control audit_procedure

Automated AAC auditing has been modified to allow CIS-CAT to input a variable for the <PATH>/<FILENAME> of the kubelet config file.

Please set $kubelet_config=<PATH><filename> based on the file location on your system 

for example:
```
export kubelet_config=/etc/kubernetes/kubelet.conf
```

To perform the audit manually:
Run the below command (based on the file location on your system) on the each worker node. For example,

```
stat -c %U %G /etc/kubernetes/kubelet.conf
```

Verify that the ownership is set to `root:root`.

## Control CIS_Controls

TITLE:Restrict Administrator Privileges to Dedicated Administrator Accounts CONTROL:v8 5.4 DESCRIPTION:Restrict administrator privileges to dedicated administrator accounts on enterprise assets. Conduct general computing activities, such as internet browsing, email, and productivity suite use, from the user’s primary, non-privileged account.;TITLE:Controlled Use of Administrative Privileges CONTROL:v7 4 DESCRIPTION:Controlled Use of Administrative Privileges;
