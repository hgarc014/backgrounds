#/bin/bash

filePaths=$(find . -type f -exec file {} \; | awk -F: '{if ($2 ~/image/) print $1}')
IFS=$'\n'       # make newlines the only separator

LINK_FOLDER="links"

rm -rf "$LINK_FOLDER"
mkdir "$LINK_FOLDER"

for file in $filePaths; do
    #echo "f:$file"
    ln -s "$file" "./$LINK_FOLDER"
done

