#!/bin/bash
# Author: SJ
# Date Created: 5 June 2026
# Date Modified: 5 June 2026

# Description
# This script automates the cleanup of a specified directory by finding and 
# deleting files that haven't been accessed in a given number of days.
# 
# Options:
#   -f [path]      The directory path to clean up.
#   -d [days]      The maximum age of files to keep (in days, based on access time).
# 
# Behavior:
#   - Supports both command-line flags (-f, -d) and interactive user prompts if 
#     arguments are omitted.
#   - Validates that the provided path exists and that the day count is an integer.
#   - Generates a temporary list of target files ('deletionFiles') using the 'find' command.
#   - Iterates through the list and safely prompts the user for confirmation ('rm -iv') 
#     before deleting each file.

path=''
maxdays=''
while getopts "f:d:" opt; do
    case "${opt}" in
        f) path="${OPTARG}";;
        d) maxdays="${OPTARG}";;
        \?) echo "Invalid argument!!";exit 1;; 
    esac
done

if [[ -z "${path}" ]];then
    read -r -p "Enter path of the folder want to cleanup?" path
fi

if [[ -z "${maxdays}" ]];then
    read -r -p "Enter a number of days(number) for file to be considered for not cleaning?" maxdays
fi

if [[ ! -d "${path}" ]];then
    echo "Path not found!"; exit 1
fi

if [[ !  "${maxdays}" =~ ^[0-9]+$ ]];then
    echo "Not in the mentioned format!"; exit 1
fi
#got the input now need to find specific files in that folder
find "$path" -type f -atime +"$maxdays" > deletionFiles
readarray -t files < deletionFiles

pt=0

if [[ -z "${files[0]}" ]]; then
    echo "No files found matching the criteria."
else
    pt=0
    while [[ pt -lt "${#files[@]}" ]]; do
        rm -iv "${files[pt]}"
        ((pt++))
    done
fi

echo "Done cleaning up!"
rm -rf deletionFiles
exit 0 