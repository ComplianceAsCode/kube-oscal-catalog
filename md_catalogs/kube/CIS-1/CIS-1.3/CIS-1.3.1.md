# CIS-1.3.1 - \[Controller Manager\] Ensure that the --terminated-pod-gc-threshold argument is set as appropriate

## Control Statement

Activate garbage collector on pod termination, as appropriate.

## Control rationale_statement

Garbage collection is important to ensure sufficient resource availability and avoiding degraded performance and availability. In the worst case, the system might crash or just be unusable for a long period of time. The current setting for garbage collection is 12,500 terminated pods which might be too high for your system to sustain. Based on your system resources and tests, choose an appropriate threshold value to activate garbage collection.

## Control impact_statement

None

## Control remediation_procedure

Edit the Controller Manager pod specification file `/etc/kubernetes/manifests/kube-controller-manager.yaml` on the Control Plane node and set the `--terminated-pod-gc-threshold` to an appropriate threshold, for example:

```
--terminated-pod-gc-threshold=10
```

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-controller-manager
```

Verify that the `--terminated-pod-gc-threshold` argument is set as appropriate.

## Control CIS_Controls

TITLE:Enable Anti-Exploitation Features CONTROL:v8 10.5 DESCRIPTION:Enable anti-exploitation features on enterprise assets and software, where possible, such as Microsoft® Data Execution Prevention (DEP), Windows® Defender Exploit Guard (WDEG), or Apple® System Integrity Protection (SIP) and Gatekeeper™.;TITLE:Establish Secure Configurations CONTROL:v7 5.1 DESCRIPTION:Maintain documented, standard security configuration standards for all authorized operating systems and software.;
