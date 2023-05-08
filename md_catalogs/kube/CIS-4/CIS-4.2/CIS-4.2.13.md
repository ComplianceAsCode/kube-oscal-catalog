# CIS-4.2.13 - \[Kubelet\] Ensure that a limit is set on pod PIDs

## Control Statement

Ensure that the Kubelet sets limits on the number of PIDs that can be created by pods running on the node.

## Control rationale_statement

By default pods running in a cluster can consume any number of PIDs, potentially exhausting the resources available on the node. Setting an appropriate limit reduces the risk of a denial of service attack on cluster nodes.

## Control impact_statement

Setting this value will restrict the number of processes per pod. If this limit is lower than the number of PIDs required by a pod it will not operate.

## Control remediation_procedure

Decide on an appropriate level for this parameter and set it, either via the `--pod-max-pids` command line parameter or the `PodPidsLimit` configuration file setting.

## Control audit_procedure

Review the Kubelet's start-up parameters for the value of `--pod-max-pids`, and check the Kubelet configuration file for the `PodPidsLimit` . If neither of these values is set, then there is no limit in place.
