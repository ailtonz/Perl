for ResFile in $(find . -name "*.vba" -type f | sed 's/\.vba$/\.txt/g')
do
    cp -f "${SourceFile}" "${ResFile}"
done