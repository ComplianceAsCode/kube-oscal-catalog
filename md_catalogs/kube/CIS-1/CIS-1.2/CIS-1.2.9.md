# CIS-1.2.9 - \[API Server\] Ensure that the admission control plugin EventRateLimit is set

## Control Statement

Limit the rate at which the API server accepts requests.

## Control rationale_statement

Using `EventRateLimit` admission control enforces a limit on the number of events that the API Server will accept in a given time slice. A misbehaving workload could overwhelm and DoS the API Server, making it unavailable. This particularly applies to a multi-tenant cluster, where there might be a small percentage of misbehaving tenants which could have a significant impact on the performance of the cluster overall. Hence, it is recommended to limit the rate of events that the API server will accept.

Note: This is an Alpha feature in the Kubernetes 1.15 release.

## Control impact_statement

You need to carefully tune in limits as per your environment.

## Control remediation_procedure

Follow the Kubernetes documentation and set the desired limits in a configuration file.

Then, edit the API server pod specification file `/etc/kubernetes/manifests/kube-apiserver.yaml` and set the below parameters.

```
--enable-admission-plugins=...,EventRateLimit,...
--admission-control-config-file=<path/to/configuration/file>
```

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-apiserver
```

Verify that the `--enable-admission-plugins` argument is set to a value that includes `EventRateLimit`.

## Control CIS_Controls

TITLE:Leverage Vetted Modules or Services for Application Security Components CONTROL:v8 16.11 DESCRIPTION:Leverage vetted modules or services for application security components, such as identity management, encryption, and auditing and logging. Using platform features in critical security functions will reduce developers’ workload and minimize the likelihood of design or implementation errors. Modern operating systems provide effective mechanisms for identification, authentication, and authorization and make those mechanisms available to applications. Use only standardized, currently accepted, and extensively reviewed encryption algorithms. Operating systems also provide mechanisms to create and maintain secure audit logs.;TITLE:Enable Operating System Anti-Exploitation Features/ Deploy Anti-Exploit Technologies CONTROL:v7 8.3 DESCRIPTION:Enable anti-exploitation features such as Data Execution Prevention (DEP) or Address Space Layout Randomization (ASLR) that are available in an operating system or deploy appropriate toolkits that can be configured to apply protection to a broader set of applications and executables.;
