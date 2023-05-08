# CIS-1.2.3 - \[API Server\] Ensure that the DenyServiceExternalIPs is set

## Control Statement

This admission controller rejects all net-new usage of the Service field externalIPs.

## Control rationale_statement

Most users do not need the ability to set the `externalIPs` field for a `Service` at all, and cluster admins should consider disabling this functionality by enabling the `DenyServiceExternalIPs` admission controller. Clusters that do need to allow this functionality should consider using some custom policy to manage its usage.

## Control impact_statement

When enabled, users of the cluster may not create new Services which use externalIPs and may not add new values to externalIPs on existing Service objects.

## Control remediation_procedure

Edit the API server pod specification file `/etc/kubernetes/manifests/kube-apiserver.yaml` on the master node and remove the `--DenyServiceExternalIPs'parameter 

or

The Kubernetes API server flag disable-admission-plugins takes a comma-delimited list of admission control plugins to be disabled, even if they are in the list of plugins enabled by default.

`kube-apiserver --disable-admission-plugins=DenyServiceExternalIPs,AlwaysDeny ...`

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-apiserver
```

Verify that the `DenyServiceExternalIPs' argument exist as a string value in --disable-admission-plugins.

## Control CIS_Controls

TITLE:Securely Manage Enterprise Assets and Software CONTROL:v8 4.6 DESCRIPTION:Securely manage enterprise assets and software. Example implementations include managing configuration through version-controlled-infrastructure-as-code and accessing administrative interfaces over secure network protocols, such as Secure Shell (SSH) and Hypertext Transfer Protocol Secure (HTTPS). Do not use insecure management protocols, such as Telnet (Teletype Network) and HTTP, unless operationally essential.;TITLE:Encrypt or Hash all Authentication Credentials CONTROL:v7 16.4 DESCRIPTION:Encrypt or hash with a salt all authentication credentials when stored.;
