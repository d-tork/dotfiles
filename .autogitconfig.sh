#!/bin/bash

# Supplemental git configurations 
# (run this on setup of a new dotfile system)

previous_value="$(git config --get user.name)"
new_value="$USER@$HOSTNAME"

git config --global user.name "$new_value"

if [ "${new_value}" == "${previous_value}" ]; then
       exit 0
else
       echo "changed"
fi

