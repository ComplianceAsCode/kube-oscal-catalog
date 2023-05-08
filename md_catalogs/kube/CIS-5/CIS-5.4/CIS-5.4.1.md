# CIS-5.4.1 - \[Secrets Management\] Prefer using secrets as files over secrets as environment variables

## Control Statement

Kubernetes supports mounting secrets as data volumes or as environment variables. Minimize the use of environment variable secrets.

## Control rationale_statement

It is reasonably common for application code to log out its environment (particularly in the event of an error). This will include any secret values passed in as environment variables, so secrets can easily be exposed to any user or entity who has access to the logs.

## Control impact_statement

Application code which expects to read secrets in the form of environment variables would need modification

## Control remediation_procedure

If possible, rewrite application code to read secrets from mounted secret files, rather than from environment variables.

## Control audit_procedure

Run the following command to find references to objects which use environment variables defined from secrets.

```
kubectl get all -o jsonpath='{range .items[?(@..secretKeyRef)]} {.kind} {.metadata.name} {"\n"}{end}' -A
```

## Control additional_information

Mounting secrets as volumes has the additional benefit that secret values can be updated without restarting the pod

## Control CIS_Controls

TITLE:Data Protection CONTROL:v8 3 DESCRIPTION:Develop processes and technical controls to identify, classify, securely handle, retain, and dispose of data.;TITLE:Data Protection CONTROL:v7 13 DESCRIPTION:Data Protection;
