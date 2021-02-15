#!/bin/bash
if [[ $# -eq 0 ]] ; then
    echo 'commit message required'
    exit 0
fi

jupyter book build ./
git add *
git commit -m "$1"
git push
ghp-import -n -p -f _build/html
