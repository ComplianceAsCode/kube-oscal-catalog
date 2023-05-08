# CIS-1.1.13 - \[Control Plane Node Configuration Files\] Ensure that the admin.conf file permissions are set to 600

## Control Statement

Ensure that the `admin.conf` file has permissions of `600`.

## Control rationale_statement

The `admin.conf` is the administrator kubeconfig file defining various settings for the administration of the cluster. This file contains private key and respective certificate allowed to fully manage the cluster. You should restrict its file permissions to maintain the integrity and confidentiality of the file. The file should be readable and writable by only the administrators on the system.

## Control impact_statement

None.

## Control remediation_procedure

Run the below command (based on the file location on your system) on the Control Plane node. For example,

```
chmod 600 /etc/kubernetes/admin.conf
```

## Control audit_procedure

Run the following command (based on the file location on your system) on the Control Plane node. For example,

```
stat -c %a /etc/kubernetes/admin.conf
```

Verify that the permissions are `600` or more restrictive.

## Control CIS_Controls

TITLE:Configure Data Access Control Lists CONTROL:v8 3.3 DESCRIPTION:Configure data access control lists based on a user’s need to know. Apply data access control lists, also known as access permissions, to local and remote file systems, databases, and applications.;TITLE:Protect Information through Access Control Lists CONTROL:v7 14.6 DESCRIPTION:Protect all information stored on systems with file system, network share, claims, application, or database specific access control lists. These controls will enforce the principle that only authorized individuals should have access to the information based on their need to access the information as a part of their responsibilities.;
