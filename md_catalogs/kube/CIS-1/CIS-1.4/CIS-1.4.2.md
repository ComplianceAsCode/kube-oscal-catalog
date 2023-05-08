# CIS-1.4.2 - \[Scheduler\] Ensure that the --bind-address argument is set to 127.0.0.1

## Control Statement

Do not bind the scheduler service to non-loopback insecure addresses.

## Control rationale_statement

The Scheduler API service which runs on port 10251/TCP by default is used for health and metrics information and is available without authentication or encryption. As such it should only be bound to a localhost interface, to minimize the cluster's attack surface

## Control impact_statement

None

## Control remediation_procedure

Edit the Scheduler pod specification file `/etc/kubernetes/manifests/kube-scheduler.yaml` on the Control Plane node and ensure the correct value for the `--bind-address` parameter

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-scheduler
```

Verify that the `--bind-address` argument is set to 127.0.0.1

## Control CIS_Controls

TITLE:Use of Secure Network Management and Communication Protocols  CONTROL:v8 12.6 DESCRIPTION:Use secure network management and communication protocols (e.g., 802.1X, Wi-Fi Protected Access 2 (WPA2) Enterprise or greater).;TITLE:Ensure Only Approved Ports, Protocols and Services Are Running CONTROL:v7 9.2 DESCRIPTION:Ensure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.;
