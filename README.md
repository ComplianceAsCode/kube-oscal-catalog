# kube-oscal-catalog
Kube OSCAL catalog

#### Initial catalog

To create the initial OSCAL catalog: 

1. Install `CIS_Kubernetes_Benchmark_v1.7.0.xlsx` in data folder

2. Run: `trestle task cis-xlsx-to-oscal-catalog data/cis-xlsx-ocp-to-oscal-catalog.config`


#### automation scripts customizations

These scripts were customized in scripts/automation as follows.

##### check_and_update_all.sh

- `trestle task ocp4-cis-profile-to-oscal-catalog -c data/trestle task cis-xlsx-to-oscal-catalog data/cis-xlsx-ocp-to-oscal-catalog.config`

##### check_and_update_all.sh

- `remote=https://$GIT_TOKEN@github.com/ComplianceAsCode/kube-oscal-catalog`

##### update_profile.sh

- `export COMMIT_BODY="Sync catalogs with kube-oscal-catalog repo"`
- `cd kube-oscal-profile`
- `remote=https://$GIT_TOKEN@github.com/ComplianceAsCode/kube-oscal-profile`
