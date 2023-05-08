#!/bin/bash

function github-branch-commit() {
    msg "Github ref $GITHUB_REF" 
    GIT_BRANCH=${GITHUB_REF##*/}
    msg "Github branch: ($GIT_BRANCH)" 
    local head_ref branch_ref
    head_ref=$(git rev-parse HEAD)
    git config --global user.email "automation@example.com"
    git config --global user.name "Automation Bot" 
    if [[ $? -ne 0 || ! $head_ref ]]; then
        err "failed to get HEAD reference"
        return 1
    fi
    branch_ref=$(git rev-parse "$GIT_BRANCH")
    if [[ $? -ne 0 || ! $branch_ref ]]; then
        err "failed to get $GIT_BRANCH reference"
        return 1
    fi
    if [[ $head_ref != $branch_ref ]]; then
        msg "HEAD ref ($head_ref) does not match $GIT_BRANCH ref ($branch_ref)"
        msg "someone may have pushed new commits before this build cloned the repo"
        return 0
    fi
    if ! git checkout "$GIT_BRANCH"; then
        err "failed to checkout $GIT_BRANCH"
        return 1
    fi

    if ! git add catalogs; then
        err "failed to add modified files to git index"
        return 1
    fi
    if ! git add md_catalogs; then
        err "failed to add modified files to git index"
        return 1
    fi
    if [ -z "$(git status --porcelain)" ]; then 
        msg "Nothing to commit" 
        return 0 
    fi
    # make Github CI skip this build
    if ! git commit -m "Autoupdate [ci skip]"; then
        err "failed to commit updates"
        return 1
    fi
}

function msg() {
    echo "github-commit: $*"
}

function err() {
    msg "$*" 1>&2
}

github-branch-commit
