#/bin/bash

filePaths=$(find . -type f -exec file {} \; | awk -F: '{if ($2 ~/image/) print $1}')
IFS=$'\n'       # make newlines the only separator

LINK_FOLDER="links"

rm -rf "$LINK_FOLDER"
mkdir "$LINK_FOLDER"

for file in $filePaths; do
    filePath=$(realpath $file)
    linkPath=$(realpath $LINK_FOLDER)
    cmd="ln \"$filePath\" \"$linkPath\""

    echo "$cmd"
    eval "$cmd"
done

