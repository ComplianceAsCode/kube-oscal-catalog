# CIS-1.2.23 - \[API Server\] Ensure that the --service-account-lookup argument is set to true

## Control Statement

Validate service account before validating token.

## Control rationale_statement

If `--service-account-lookup` is not enabled, the apiserver only verifies that the authentication token is valid, and does not validate that the service account token mentioned in the request is actually present in etcd. This allows using a service account token even after the corresponding service account is deleted. This is an example of time of check to time of use security issue.

## Control impact_statement

None

## Control remediation_procedure

Edit the API server pod specification file `/etc/kubernetes/manifests/kube-apiserver.yaml` on the Control Plane node and set the below parameter. 

```
--service-account-lookup=true
```

Alternatively, you can delete the `--service-account-lookup` parameter from this file so that the default takes effect.

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-apiserver
```

Verify that if the `--service-account-lookup` argument exists it is set to `true`.

## Control CIS_Controls

TITLE:Configure Data Access Control Lists CONTROL:v8 3.3 DESCRIPTION:Configure data access control lists based on a user’s need to know. Apply data access control lists, also known as access permissions, to local and remote file systems, databases, and applications.;TITLE:Account Monitoring and Control CONTROL:v7 16 DESCRIPTION:Account Monitoring and Control;
