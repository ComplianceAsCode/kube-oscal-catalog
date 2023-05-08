# CIS-1.2.14 - \[API Server\] Ensure that the admission control plugin NamespaceLifecycle is set

## Control Statement

Reject creating objects in a namespace that is undergoing termination.

## Control rationale_statement

Setting admission control policy to `NamespaceLifecycle` ensures that objects cannot be created in non-existent namespaces, and that namespaces undergoing termination are not used for creating the new objects. This is recommended to enforce the integrity of the namespace termination process and also for the availability of the newer objects.

## Control impact_statement

None

## Control remediation_procedure

Edit the API server pod specification file `/etc/kubernetes/manifests/kube-apiserver.yaml` on the Control Plane node and set the `--disable-admission-plugins` parameter to ensure it does not include `NamespaceLifecycle`.

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-apiserver
```

Verify that the `--disable-admission-plugins` argument is set to a value that does not include `NamespaceLifecycle`.

## Control CIS_Controls

TITLE:Secure Configuration of Enterprise Assets and Software CONTROL:v8 4 DESCRIPTION:Establish and maintain the secure configuration of enterprise assets (end-user devices, including portable and mobile; network devices; non-computing/IoT devices; and servers) and software (operating systems and applications).;TITLE:Establish Secure Configurations CONTROL:v7 5.1 DESCRIPTION:Maintain documented, standard security configuration standards for all authorized operating systems and software.;
