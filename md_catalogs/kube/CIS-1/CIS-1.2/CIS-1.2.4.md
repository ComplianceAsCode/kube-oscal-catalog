# CIS-1.2.4 - \[API Server\] Ensure that the --kubelet-client-certificate and --kubelet-client-key arguments are set as appropriate

## Control Statement

Enable certificate based kubelet authentication.

## Control rationale_statement

The apiserver, by default, does not authenticate itself to the kubelet's HTTPS endpoints. The requests from the apiserver are treated anonymously. You should set up certificate-based kubelet authentication to ensure that the apiserver authenticates itself to kubelets when submitting requests.

## Control impact_statement

You require TLS to be configured on apiserver as well as kubelets.

## Control remediation_procedure

Follow the Kubernetes documentation and set up the TLS connection between the apiserver and kubelets. Then, edit API server pod specification file `/etc/kubernetes/manifests/kube-apiserver.yaml` on the Control Plane node and set the kubelet client certificate and key parameters as below.

```
--kubelet-client-certificate=<path/to/client-certificate-file>
--kubelet-client-key=<path/to/client-key-file>
```

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-apiserver
```

Verify that the `--kubelet-client-certificate` and `--kubelet-client-key` arguments exist and they are set as appropriate.

Alternative Audit

kubectl get pod -nkube-system -lcomponent=kube-apiserver -o=jsonpath='{range .items[]}{.spec.containers[].command} {"\n"}{end}' | grep '--kubelet-client-certificate' | grep -i false

If the exit code is '1', then the control isn't present / failed

## Control CIS_Controls

TITLE:Leverage Vetted Modules or Services for Application Security Components CONTROL:v8 16.11 DESCRIPTION:Leverage vetted modules or services for application security components, such as identity management, encryption, and auditing and logging. Using platform features in critical security functions will reduce developers’ workload and minimize the likelihood of design or implementation errors. Modern operating systems provide effective mechanisms for identification, authentication, and authorization and make those mechanisms available to applications. Use only standardized, currently accepted, and extensively reviewed encryption algorithms. Operating systems also provide mechanisms to create and maintain secure audit logs.;TITLE:Limitation and Control of Network Ports, Protocols, and Services CONTROL:v7 9 DESCRIPTION:Limitation and Control of Network Ports, Protocols, and Services;
