for d in ./catalogs/* ; do
    catalog=$(basename "$d")
    if [ "$catalog" != "IBM_FS_FR_COMBINED" ]; then
       echo "Regenerating ${catalog}" 
       trestle author catalog-generate --name $catalog --output md_catalogs/$catalog
    else 
       echo "Skipping ${catalog}"
    fi 
done
