#!/bin/bash

export COMMIT_TITLE="chore: Catalogs automatic update."
export COMMIT_BODY="Sync catalogs with kube-oscal-catalog repo"
git config --global user.email "automation@example.com"
git config --global user.name "AutomationBot" 
cd kube-oscal-profile
git checkout -b "catalogs_autoupdate_$GITHUB_RUN_ID"
cp -r ../catalogs .
if [ -z "$(git status --porcelain)" ]; then 
  echo "Nothing to commit" 
else 
  git diff
  git add catalogs
  if [ -z "$(git status --untracked-files=no --porcelain)" ]; then 
     echo "Nothing to commit" 
  else
     git commit -m "$COMMIT_TITLE"
     remote=https://$GIT_TOKEN@github.com/ComplianceAsCode/kube-oscal-profile
     git push -u "$remote" "catalogs_autoupdate_$GITHUB_RUN_ID"
     echo $COMMIT_BODY
     gh pr create -t "$COMMIT_TITLE" -b "$COMMIT_BODY" -B "develop" -H "catalogs_autoupdate_$GITHUB_RUN_ID" 
  fi
fi

