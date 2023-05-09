#!/bin/bash

CHANGES=`git diff-tree --no-commit-id --name-only -r HEAD`

md_changed=false
json_changed=false
txt_changed=false

# bash regex does not support lazy match, so need to use two patterns to match before and after the control id
md1=$"^md_catalogs/"
md2=$"\.md$"

json1=$"^catalogs/"
json2=$"\.json$"

# xlsx to OSCAL catalog conversion has to be done separately as we cannot put the CIS benchmark XLSX file in git
# txt1=$"^data/"
# txt2=$"\.xlsx$"

for val in ${CHANGES[@]} ; do
  if [[ $val =~ $md1 && $val =~ $md2 ]]; then
    md_changed=true
  fi

  if [[ $val =~ $json1 && $val =~ $json2 ]]; then
    json_changed=true
  fi

  # if [[ $val =~ $txt1 && $val =~ $txt2 ]]; then
    # txt_changed=true
  # fi
done

# if [[ $txt_changed = true ]]; then
    # echo "xlsx data file had changes, converting xlsx to catalog and regenerating markdowns..."
    # trestle task cis-xlsx-to-oscal-catalog -c data/cis-xlsx-ocp-to-oscal-catalog.config
    # ./scripts/automation/regenerate_catalogs.sh
# fi

if [[ $json_changed = true ]]; then
    echo "Json file(s) were changed, regenerating catalogs..."
    ./scripts/automation/regenerate_catalogs.sh
fi


if [[ $md_changed = true ]]; then
    echo "Md file(s) were changed, assembling catalogs..."
    ./scripts/automation/assemble_catalogs.sh
fi



#echo "$md_changed $json_changed $txt_changed"
echo "$md_changed $json_changed"
