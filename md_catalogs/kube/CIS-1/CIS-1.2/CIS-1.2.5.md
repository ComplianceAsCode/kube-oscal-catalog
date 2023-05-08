# CIS-1.2.5 - \[API Server\] Ensure that the --kubelet-certificate-authority argument is set as appropriate

## Control Statement

Verify kubelet's certificate before establishing connection.

## Control rationale_statement

The connections from the apiserver to the kubelet are used for fetching logs for pods, attaching (through kubectl) to running pods, and using the kubelet’s port-forwarding functionality. These connections terminate at the kubelet’s HTTPS endpoint. By default, the apiserver does not verify the kubelet’s serving certificate, which makes the connection subject to man-in-the-middle attacks, and unsafe to run over untrusted and/or public networks.

## Control impact_statement

You require TLS to be configured on apiserver as well as kubelets.

## Control remediation_procedure

Follow the Kubernetes documentation and setup the TLS connection between the apiserver and kubelets. Then, edit the API server pod specification file `/etc/kubernetes/manifests/kube-apiserver.yaml` on the Control Plane node and set the `--kubelet-certificate-authority` parameter to the path to the cert file for the certificate authority.

```
--kubelet-certificate-authority=<ca-string>
```

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-apiserver
```

Verify that the `--kubelet-certificate-authority` argument exists and is set as appropriate.

Alternative Audit

kubectl get pod -nkube-system -lcomponent=kube-apiserver -o=jsonpath='{range .items[]}{.spec.containers[].command} {"\n"}{end}' | grep '--kubelet-certificate-Authority' | grep -i false

If the exit code is '1', then the control isn't present / failed

## Control CIS_Controls

TITLE:Leverage Vetted Modules or Services for Application Security Components CONTROL:v8 16.11 DESCRIPTION:Leverage vetted modules or services for application security components, such as identity management, encryption, and auditing and logging. Using platform features in critical security functions will reduce developers’ workload and minimize the likelihood of design or implementation errors. Modern operating systems provide effective mechanisms for identification, authentication, and authorization and make those mechanisms available to applications. Use only standardized, currently accepted, and extensively reviewed encryption algorithms. Operating systems also provide mechanisms to create and maintain secure audit logs.;TITLE:Limitation and Control of Network Ports, Protocols, and Services CONTROL:v7 9 DESCRIPTION:Limitation and Control of Network Ports, Protocols, and Services;
