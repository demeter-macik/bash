#!/bin/bash

replace() (
  chrs=( "ě" "š" "č" "ř" "ž" "ý" "á" "í" "ů" "ú" )
  repl=( "e" "s" "c" "r" "z" "y" "a" "i" "u" "u" )
  str=$1
  for i in ${!chrs[@]}
  do 
    c=${chrs[$i]}
    r=${repl[$i]}
    str=$(echo $str | sed -r "s/$c/$r/g")
  done
  echo  "$str"
)

source=$1
target=$2

echo "source $source, target $target"

if [ ! -d $source ]
then
    echo "source directory not found: $source"
    exit 1
fi

if [ ! -d $target ]
then
    mkdir $target
fi

files=($source/*.rsc)

for file in "${files[@]}"
do
    re="[a-z]{3,}-[0-9]{2,}-[0-9]{4,}\.rsc$"
    [[ $file =~ $re ]] && date=$BASH_REMATCH
    
    if [[ ${#date} -eq 0 ]]
    then
        echo "can't parse '$file'"
        continue
    fi
    
    re="^[a-z]{3,}-[0-9]{2,}-[0-9]{4,}"
    [[ $date =~ $re ]] && date=$BASH_REMATCH

    IFS='-'
    read -r month day year <<< "$date"

    filePath="$target/$year/$month/$day"

    if [ ! -d $filePath ]
    then
        echo "create directory '$filePath'"
        mkdir -p $filePath
    fi
    
    fileName=$(basename "$file")
    fileName=$(replace "$fileName")
    
    if [ -f "$filePath/$fileName" ]
    then
        echo "file already exists '$filePath/$fileName'"
    else
        echo "moving file '$file' to '$filePath'"
        mv "$file" "$filePath"
    fi
    
done

echo "done"