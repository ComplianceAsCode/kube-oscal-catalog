# CIS-1.2.15 - \[API Server\] Ensure that the admission control plugin NodeRestriction is set

## Control Statement

Limit the `Node` and `Pod` objects that a kubelet could modify.

## Control rationale_statement

Using the `NodeRestriction` plug-in ensures that the kubelet is restricted to the `Node` and `Pod` objects that it could modify as defined. Such kubelets will only be allowed to modify their own `Node` API object, and only modify `Pod` API objects that are bound to their node.

## Control impact_statement

None

## Control remediation_procedure

Follow the Kubernetes documentation and configure `NodeRestriction` plug-in on kubelets. Then, edit the API server pod specification file `/etc/kubernetes/manifests/kube-apiserver.yaml` on the master node and set the `--enable-admission-plugins` parameter to a value that includes `NodeRestriction`.

```
--enable-admission-plugins=...,NodeRestriction,...
```

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-apiserver
```

Verify that the `--enable-admission-plugins` argument is set to a value that includes `NodeRestriction`.

## Control CIS_Controls

TITLE:Perform Application Layer Filtering CONTROL:v8 13.10 DESCRIPTION:Perform application layer filtering. Example implementations include a filtering proxy, application layer firewall, or gateway.;TITLE:Deploy Application Layer Filtering Proxy Server CONTROL:v7 12.9 DESCRIPTION:Ensure that all network traffic to or from the Internet passes through an authenticated application layer proxy that is configured to filter unauthorized connections.;
