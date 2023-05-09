# kube-oscal-catalog
Kube OSCAL catalog

#### Overview

This repo comprises the [CIS Kubernetes Benchmark v1.7.0](https://workbench.cisecurity.org/files/4381) as an [OSCAL catalog](https://pages.nist.gov/OSCAL/concepts/layer/control/catalog/).


This repo was created and is managed using open source project compliance-[trestle](https://github.com/IBM/compliance-trestle).
The initial catalog in OSCAL `json` format is created using the `trestle task ocp4-cis-profile-to-oscal-catalog` command.
The `markdown` documents and managed by the trestle automation scripts, which employ trestle core commands.

The [catalog](catalogs/kube/catalog.json).

Example [markdown](md_catalogs/kube/CIS-1/CIS-1.1/CIS-1.1.1.md).

The trestle Agile Authoring process facilitates management of the OSCAL json via the GIT managed lifecycle of markdown documents.
The process using GIT is as follows:
1. check-out a markdown document, representing one segment of the OSCAL catalog
2. modify the markdown
3. check-in the markdown document, and create a pull request for review
4. once reviewed and approved, the markdown is employed to render an revised version of the OSCAL catalog via the automation scripts in the repo

#### Initial catalog

To create the initial OSCAL catalog: 

1. Install `CIS_Kubernetes_Benchmark_v1.7.0.xlsx` in data folder

2. Run: `trestle task cis-xlsx-to-oscal-catalog -c data/cis-xlsx-ocp-to-oscal-catalog.config`


#### automation scripts customizations

These scripts were customized in scripts automation as follows.

##### check_and_update_all.sh

- `trestle task ocp4-cis-profile-to-oscal-catalog -c data/trestle task cis-xlsx-to-oscal-catalog data/cis-xlsx-ocp-to-oscal-catalog.config`

##### check_and_update_all.sh

- `remote=https://$GIT_TOKEN@github.com/ComplianceAsCode/kube-oscal-catalog`

##### update_profile.sh

- `export COMMIT_BODY="Sync catalogs with kube-oscal-catalog repo"`
- `cd kube-oscal-profile`
- `remote=https://$GIT_TOKEN@github.com/ComplianceAsCode/kube-oscal-profile`

##### repo customization

Settings -> Secrets and variables -> Actions

- Add Repository secret `GIT_TOKEN` with your personal token created [here](https://github.com/settings/tokens)
- Be sure token has `workflow` checked
