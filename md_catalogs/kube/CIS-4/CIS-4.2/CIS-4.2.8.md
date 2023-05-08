# CIS-4.2.8 - \[Kubelet\] Ensure that the eventRecordQPS argument is set to a level which ensures appropriate event capture

## Control Statement

Security relevant information should be captured. The eventRecordQPS on the Kubelet configuration can be used to limit the rate at which events are gathered and sets the maximum event creations per second. Setting this too low could result in relevant events not being logged, however the unlimited setting of `0` could result in a denial of service on the kubelet.

## Control rationale_statement

It is important to capture all events and not restrict event creation. Events are an important source of security information and analytics that ensure that your environment is consistently monitored using the event data.

## Control impact_statement

Setting this parameter to `0` could result in a denial of service condition due to excessive events being created. The cluster's event processing and storage systems should be scaled to handle expected event loads.

## Control remediation_procedure

If using a Kubelet config file, edit the file to set `eventRecordQPS:` to an appropriate level.

If using command line arguments, edit the kubelet service file `/etc/systemd/system/kubelet.service.d/10-kubeadm.conf` on each worker node and set the below parameter in `KUBELET_SYSTEM_PODS_ARGS` variable.

Based on your system, restart the `kubelet` service. For example:

```
systemctl daemon-reload
systemctl restart kubelet.service
```

## Control audit_procedure

Run the following command on each node:

```
sudo grep "eventRecordQPS" /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
```

Review the value set for the argument and determine whether this has been set to an appropriate level for the cluster.

If the argument does not exist, check that there is a Kubelet config file specified by `--config` and review the value in this location.

## Control CIS_Controls

TITLE:Collect Audit Logs CONTROL:v8 8.2 DESCRIPTION:Collect audit logs. Ensure that logging, per the enterprise’s audit log management process, has been enabled across enterprise assets.;TITLE:Activate audit logging CONTROL:v7 6.2 DESCRIPTION:Ensure that local logging has been enabled on all systems and networking devices.;
