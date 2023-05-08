# CIS-1.1.9 - \[Control Plane Node Configuration Files\] Ensure that the Container Network Interface file permissions are set to 600 or more restrictive

## Control Statement

Ensure that the Container Network Interface files have permissions of `600` or more restrictive.

## Control rationale_statement

Container Network Interface provides various networking options for overlay networking. You should consult their documentation and restrict their respective file permissions to maintain the integrity of those files. Those files should be writable by only the administrators on the system.

## Control impact_statement

None

## Control remediation_procedure

Run the below command (based on the file location on your system) on the Control Plane node. For example,

```
chmod 600 <path/to/cni/files>
```

## Control audit_procedure

Run the below command (based on the file location on your system) on the Control Plane node. For example,

```
stat -c %a <path/to/cni/files>
```

Verify that the permissions are `600` or more restrictive.

## Control CIS_Controls

TITLE:Configure Data Access Control Lists CONTROL:v8 3.3 DESCRIPTION:Configure data access control lists based on a user’s need to know. Apply data access control lists, also known as access permissions, to local and remote file systems, databases, and applications.;TITLE:Protect Information through Access Control Lists CONTROL:v7 14.6 DESCRIPTION:Protect all information stored on systems with file system, network share, claims, application, or database specific access control lists. These controls will enforce the principle that only authorized individuals should have access to the information based on their need to access the information as a part of their responsibilities.;
