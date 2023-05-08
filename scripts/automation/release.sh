version_tag=$(semantic-release print-version)
echo "Bumping version of profiles to ${version_tag}" 
export VERSION_TAG="$version_tag"
echo "VERSION_TAG=${VERSION_TAG}" >> $GITHUB_ENV
./scripts/automation/assemble_catalogs.sh $version_tag
git config --global user.email "automation@example.com"
git config --global user.name "Automation Bot" 
semantic-release publish
