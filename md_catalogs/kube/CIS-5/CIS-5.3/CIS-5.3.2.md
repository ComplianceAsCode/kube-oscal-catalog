# CIS-5.3.2 - \[Network Policies and CNI\] Ensure that all Namespaces have Network Policies defined

## Control Statement

Use network policies to isolate traffic in your cluster network.

## Control rationale_statement

Running different applications on the same Kubernetes cluster creates a risk of one compromised application attacking a neighboring application. Network segmentation is important to ensure that containers can communicate only with those they are supposed to. A network policy is a specification of how selections of pods are allowed to communicate with each other and other network endpoints. 

Network Policies are namespace scoped. When a network policy is introduced to a given namespace, all traffic not allowed by the policy is denied. However, if there are no network policies in a namespace all traffic will be allowed into and out of the pods in that namespace.

## Control impact_statement

Once network policies are in use within a given namespace, traffic not explicitly allowed by a network policy will be denied. As such it is important to ensure that, when introducing network policies, legitimate traffic is not blocked.

## Control remediation_procedure

Follow the documentation and create `NetworkPolicy` objects as you need them.

## Control audit_procedure

Run the below command and review the `NetworkPolicy` objects created in the cluster.

```
kubectl get networkpolicy --all-namespaces```

Ensure that each namespace defined in the cluster has at least one Network Policy.

## Control CIS_Controls

TITLE:Implement and Manage a Firewall on Servers CONTROL:v8 4.4 DESCRIPTION:Implement and manage a firewall on servers, where supported. Example implementations include a virtual firewall, operating system firewall, or a third-party firewall agent.;TITLE:Enable Firewall Filtering Between VLANs CONTROL:v7 14.2 DESCRIPTION:Enable firewall filtering between VLANs to ensure that only authorized systems are able to communicate with other systems necessary to fulfill their specific responsibilities.;
