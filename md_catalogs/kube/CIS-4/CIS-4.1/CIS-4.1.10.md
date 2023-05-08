# CIS-4.1.10 - \[Worker Node Configuration Files\] If the kubelet config.yaml configuration file is being used validate file ownership is set to root:root

## Control Statement

Ensure that if the kubelet refers to a configuration file with the `--config` argument, that file is owned by root:root.

## Control rationale_statement

The kubelet reads various parameters, including security settings, from a config file specified by the `--config` argument. If this file is specified you should restrict its file permissions to maintain the integrity of the file. The file should be owned by root:root.

## Control impact_statement

None

## Control remediation_procedure

Run the following command (using the config file location identied in the Audit step)

```
chown root:root /etc/kubernetes/kubelet.conf
```

## Control audit_procedure

Automated AAC auditing has been modified to allow CIS-CAT to input a variable for the <PATH>/<FILENAME> of the kubelet config yaml file.

Please set $kubelet_config_yaml=<PATH><filename> based on the file location on your system 

for example:
```
export kubelet_config_yaml=/var/lib/kubelet/config.yaml

```

To perform the audit manually:
Run the below command (based on the file location on your system) on the each worker node. For example,

```
stat -c %a /var/lib/kubelet/config.yaml
```Verify that the ownership is set to `root:root`.

## Control CIS_Controls

TITLE:Restrict Administrator Privileges to Dedicated Administrator Accounts CONTROL:v8 5.4 DESCRIPTION:Restrict administrator privileges to dedicated administrator accounts on enterprise assets. Conduct general computing activities, such as internet browsing, email, and productivity suite use, from the user’s primary, non-privileged account.;TITLE:Controlled Use of Administrative Privileges CONTROL:v7 4 DESCRIPTION:Controlled Use of Administrative Privileges;
