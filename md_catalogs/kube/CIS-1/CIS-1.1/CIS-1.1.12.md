# CIS-1.1.12 - \[Control Plane Node Configuration Files\] Ensure that the etcd data directory ownership is set to etcd:etcd

## Control Statement

Ensure that the etcd data directory ownership is set to `etcd:etcd`.

## Control rationale_statement

etcd is a highly-available key-value store used by Kubernetes deployments for persistent storage of all of its REST API objects. This data directory should be protected from any unauthorized reads or writes. It should be owned by `etcd:etcd`.

## Control impact_statement

None

## Control remediation_procedure

On the etcd server node, get the etcd data directory, passed as an argument `--data-dir`, from the below command:
```
ps -ef | grep etcd
```
Run the below command (based on the etcd data directory found above). For example,
```
chown etcd:etcd /var/lib/etcd
```

## Control audit_procedure

On the etcd server node, get the etcd data directory, passed as an argument `--data-dir`, from the below command:

```
ps -ef | grep etcd
```

Run the below command (based on the etcd data directory found above). For example,

```
stat -c %U:%G /var/lib/etcd
```

Verify that the ownership is set to `etcd:etcd`.

## Control CIS_Controls

TITLE:Configure Data Access Control Lists CONTROL:v8 3.3 DESCRIPTION:Configure data access control lists based on a user’s need to know. Apply data access control lists, also known as access permissions, to local and remote file systems, databases, and applications.;TITLE:Account Monitoring and Control CONTROL:v7 16 DESCRIPTION:Account Monitoring and Control;
