# CIS-4.2.7 - \[Kubelet\] Ensure that the --hostname-override argument is not set

## Control Statement

Do not override node hostnames.

## Control rationale_statement

Overriding hostnames could potentially break TLS setup between the kubelet and the apiserver. Additionally, with overridden hostnames, it becomes increasingly difficult to associate logs with a particular node and process them for security analytics. Hence, you should setup your kubelet nodes with resolvable FQDNs and avoid overriding the hostnames with IPs.

## Control impact_statement

Some cloud providers may require this flag to ensure that hostname matches names issued by the cloud provider. In these environments, this recommendation should not apply.

## Control remediation_procedure

Edit the kubelet service file `/etc/systemd/system/kubelet.service.d/10-kubeadm.conf` on each worker node and remove the `--hostname-override` argument from the `KUBELET_SYSTEM_PODS_ARGS` variable.

Based on your system, restart the `kubelet` service. For example:

```
systemctl daemon-reload
systemctl restart kubelet.service
```

## Control audit_procedure

Run the following command on each node:

```
ps -ef | grep kubelet
```

Verify that `--hostname-override` argument does not exist.

**Note** This setting is not configurable via the Kubelet config file.

## Control CIS_Controls

TITLE:Secure Configuration of Enterprise Assets and Software CONTROL:v8 4 DESCRIPTION:Establish and maintain the secure configuration of enterprise assets (end-user devices, including portable and mobile; network devices; non-computing/IoT devices; and servers) and software (operating systems and applications).;TITLE:Secure Configuration for Hardware and Software on Mobile Devices, Laptops, Workstations and Servers CONTROL:v7 5 DESCRIPTION:Secure Configuration for Hardware and Software on Mobile Devices, Laptops, Workstations and Servers;
