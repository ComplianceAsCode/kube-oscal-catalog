# CIS-1.1.21 - \[Control Plane Node Configuration Files\] Ensure that the Kubernetes PKI key file permissions are set to 600

## Control Statement

Ensure that Kubernetes PKI key files have permissions of `600`.

## Control rationale_statement

Kubernetes makes use of a number of key files as part of the operation of its components. The permissions on these files should be set to `600` to protect their integrity and confidentiality.

## Control impact_statement

None

## Control remediation_procedure

Run the below command (based on the file location on your system) on the Control Plane node. For example,

```
chmod -R 600 /etc/kubernetes/pki/*.key
```

## Control audit_procedure

Run the below command (based on the file location on your system) on the Control Plane node. For example,

```
ls -laR /etc/kubernetes/pki/*.key
```

Verify that the permissions are `600`.

## Control CIS_Controls

TITLE:Configure Data Access Control Lists CONTROL:v8 3.3 DESCRIPTION:Configure data access control lists based on a user’s need to know. Apply data access control lists, also known as access permissions, to local and remote file systems, databases, and applications.;TITLE:Protect Information through Access Control Lists CONTROL:v7 14.6 DESCRIPTION:Protect all information stored on systems with file system, network share, claims, application, or database specific access control lists. These controls will enforce the principle that only authorized individuals should have access to the information based on their need to access the information as a part of their responsibilities.;
