# CIS-4.2.5 - \[Kubelet\] Ensure that the --streaming-connection-idle-timeout argument is not set to 0

## Control Statement

Do not disable timeouts on streaming connections.

## Control rationale_statement

Setting idle timeouts ensures that you are protected against Denial-of-Service attacks, inactive connections and running out of ephemeral ports. 

**Note:** By default, `--streaming-connection-idle-timeout` is set to 4 hours which might be too high for your environment. Setting this as appropriate would additionally ensure that such streaming connections are timed out after serving legitimate use cases.

## Control impact_statement

Long-lived connections could be interrupted.

## Control remediation_procedure

If using a Kubelet config file, edit the file to set `streamingConnectionIdleTimeout` to a value other than 0. 

If using command line arguments, edit the kubelet service file `/etc/kubernetes/kubelet.conf` on each worker node and set the below parameter in `KUBELET_SYSTEM_PODS_ARGS` variable.

```
--streaming-connection-idle-timeout=5m
```

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

Verify that the `--streaming-connection-idle-timeout` argument is not set to `0`.

If the argument is not present, and there is a Kubelet config file specified by `--config`, check that it does not set `streamingConnectionIdleTimeout` to 0.

## Control CIS_Controls

TITLE:Enable Anti-Exploitation Features CONTROL:v8 10.5 DESCRIPTION:Enable anti-exploitation features on enterprise assets and software, where possible, such as Microsoft® Data Execution Prevention (DEP), Windows® Defender Exploit Guard (WDEG), or Apple® System Integrity Protection (SIP) and Gatekeeper™.;TITLE:Enable Operating System Anti-Exploitation Features/ Deploy Anti-Exploit Technologies CONTROL:v7 8.3 DESCRIPTION:Enable anti-exploitation features such as Data Execution Prevention (DEP) or Address Space Layout Randomization (ASLR) that are available in an operating system or deploy appropriate toolkits that can be configured to apply protection to a broader set of applications and executables.;
