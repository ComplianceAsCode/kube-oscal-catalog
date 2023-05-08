# CIS-1.2.2 - \[API Server\] Ensure that the --token-auth-file parameter is not set

## Control Statement

Do not use token based authentication.

## Control rationale_statement

The token-based authentication utilizes static tokens to authenticate requests to the apiserver. The tokens are stored in clear-text in a file on the apiserver, and cannot be revoked or rotated without restarting the apiserver. Hence, do not use static token-based authentication.

## Control impact_statement

You will have to configure and use alternate authentication mechanisms such as certificates. Static token based authentication could not be used.

## Control remediation_procedure

Follow the documentation and configure alternate mechanisms for authentication. Then, edit the API server pod specification file `/etc/kubernetes/manifests/kube-apiserver.yaml` on the master node and remove the `--token-auth-file=<filename>` parameter.

## Control audit_procedure

Run the following command on the Control Plane node:

```
ps -ef | grep kube-apiserver
```

Verify that the `--token-auth-file` argument does not exist.

Alternative Audit Method

kubectl get pod -nkube-system -lcomponent=kube-apiserver -o=jsonpath='{range .items[*]}{.spec.containers[*].command} {"\n"}{end}' | grep '\--token-auth-file' | grep -i false

If the exit code is '1', then the control isn't present / failed

## Control CIS_Controls

TITLE:Securely Manage Enterprise Assets and Software CONTROL:v8 4.6 DESCRIPTION:Securely manage enterprise assets and software. Example implementations include managing configuration through version-controlled-infrastructure-as-code and accessing administrative interfaces over secure network protocols, such as Secure Shell (SSH) and Hypertext Transfer Protocol Secure (HTTPS). Do not use insecure management protocols, such as Telnet (Teletype Network) and HTTP, unless operationally essential.;TITLE:Encrypt or Hash all Authentication Credentials CONTROL:v7 16.4 DESCRIPTION:Encrypt or hash with a salt all authentication credentials when stored.;
