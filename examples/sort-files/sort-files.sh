#!/bin/bash

source=$1
target=$2

# echo "source $source, target $target"

if [ ! -d $source ]
then
    echo "source directory not found: $source"
    exit 1
fi

if [ ! -d $target ]
then
    mkdir $target
fi

files=($source/*)

if [[ $files[1] =~ "source/*" ]]
then
    echo "Files not found in '$source'"
    exit 1
fi

declare -A dates

for file in "${files[@]}"
do
    re="[a-z]{3,}-[0-9]{2,}-[0-9]{4,}\.rsc$"
    [[ $file =~ $re ]] && date=$BASH_REMATCH
    
    if [[ ${#date} -eq 0 ]]
    then
        echo "can't parse '$file'"
        exit 1
    fi
    
    re="^[a-z]{3,}-[0-9]{2,}-[0-9]{4,}"
    [[ $date =~ $re ]] && date=$BASH_REMATCH
    re="^[a-z]{3,}"
    [[ $date =~ $re ]] && month=$BASH_REMATCH
    re="[0-9]{2,}-[0-9]{4,}$"
    [[ $date =~ $re ]] && date=$BASH_REMATCH
    re="^[0-9]{2,}"
    [[ $date =~ $re ]] && day=$BASH_REMATCH
    re="[0-9]{4,}$"
    [[ $date =~ $re ]] && year=$BASH_REMATCH
    
    filePath="$target/$year/$month/$day"
    if [ ! -d $filePath ]
    then
        echo "create directory '$filePath'"
        mkdir -p $filePath
    fi
    
    fileName=$(basename "$file")
    
    if [ -f "$filePath/$fileName" ]
    then
        echo "file already exists '$filePath/$fileName'"
    else
        echo "moving file '$file' to '$filePath'"
        mv "$file" "$filePath"
    fi
    
done

echo "done"