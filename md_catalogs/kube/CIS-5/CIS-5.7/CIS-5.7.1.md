# CIS-5.7.1 - \[General Policies\] Create administrative boundaries between resources using namespaces

## Control Statement

Use namespaces to isolate your Kubernetes objects.

## Control rationale_statement

Limiting the scope of user permissions can reduce the impact of mistakes or malicious activities. A Kubernetes namespace allows you to partition created resources into logically named groups. Resources created in one namespace can be hidden from other namespaces. By default, each resource created by a user in Kubernetes cluster runs in a default namespace, called `default`. You can create additional namespaces and attach resources and users to them. You can use Kubernetes Authorization plugins to create policies that segregate access to namespace resources between different users.

## Control impact_statement

You need to switch between namespaces for administration.

## Control remediation_procedure

Follow the documentation and create namespaces for objects in your deployment as you need them.

## Control audit_procedure

Run the below command and review the namespaces created in the cluster.

```
kubectl get namespaces
```

Ensure that these namespaces are the ones you need and are adequately administered as per your requirements.

## Control CIS_Controls

TITLE:Network Monitoring and Defense CONTROL:v8 13 DESCRIPTION:Operate processes and tooling to establish and maintain comprehensive network monitoring and defense against security threats across the enterprise’s network infrastructure and user base.;TITLE:Boundary Defense CONTROL:v7 12 DESCRIPTION:Boundary Defense;
