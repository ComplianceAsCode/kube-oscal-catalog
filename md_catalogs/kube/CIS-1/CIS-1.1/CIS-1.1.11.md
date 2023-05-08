# CIS-1.1.11 - \[Control Plane Node Configuration Files\] Ensure that the etcd data directory permissions are set to 700 or more restrictive

## Control Statement

Ensure that the etcd data directory has permissions of `700` or more restrictive.

## Control rationale_statement

etcd is a highly-available key-value store used by Kubernetes deployments for persistent storage of all of its REST API objects. This data directory should be protected from any unauthorized reads or writes. It should not be readable or writable by any group members or the world.

## Control impact_statement

None

## Control remediation_procedure

On the etcd server node, get the etcd data directory, passed as an argument `--data-dir`, from the below command:
```
ps -ef | grep etcd
```
Run the below command (based on the etcd data directory found above). For example,
```
chmod 700 /var/lib/etcd
```

## Control audit_procedure

On the etcd server node, get the etcd data directory, passed as an argument `--data-dir`, from the below command:

```
ps -ef | grep etcd
```

Run the below command (based on the etcd data directory found above). For example,

```
stat -c %a /var/lib/etcd
```

Verify that the permissions are `700` or more restrictive.

## Control CIS_Controls

TITLE:Configure Data Access Control Lists CONTROL:v8 3.3 DESCRIPTION:Configure data access control lists based on a user’s need to know. Apply data access control lists, also known as access permissions, to local and remote file systems, databases, and applications.;TITLE:Protect Information through Access Control Lists CONTROL:v7 14.6 DESCRIPTION:Protect all information stored on systems with file system, network share, claims, application, or database specific access control lists. These controls will enforce the principle that only authorized individuals should have access to the information based on their need to access the information as a part of their responsibilities.;
