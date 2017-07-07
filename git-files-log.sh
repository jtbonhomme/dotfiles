#!/bin/bash

function output_help {
    echo "usage: git-files-log <sha1>"
}

sha1=$1
if [[ $sha1 ]]; then
git log --name-only --pretty=oneline --full-index $sha1..HEAD | grep -vE '^[0-9a-f]{40} ' | sort | uniq
else
output_help
fi
