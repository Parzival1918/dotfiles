#!/usr/bin/env fish

#set separator "/"
#set outdated_formulae (brew outdated --json | jq '.formulae | length')
#set outdated_casks (brew outdated --json | jq '.casks | length')
#echo "$outdated_formulae $separator $outdated_casks"

set outdated (brew outdated --quiet | wc -l)
echo "$outdated"
