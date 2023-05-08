version_tag=$1
for d in ./catalogs/* ; do
    catalog=$(basename "$d")
    if [ "$catalog" != "IBM_FS_FR_COMBINED" ]; then 
       if [ "$1" != "" ]; then 
          echo "Assembling ${catalog} with version ${version_tag}"
          trestle author catalog-assemble --markdown md_catalogs/$catalog --output $catalog --version $version_tag 
       else
          echo "Assembling ${catalog}"
          trestle author catalog-assemble --markdown md_catalogs/$catalog --output $catalog
       fi
    else 
       echo "Skipping ${catalog}"
    fi 
done
