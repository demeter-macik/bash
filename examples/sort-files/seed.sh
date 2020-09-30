#!/bin/bash

declare -a files=(
    "la-skjfsd-dec-12-2018.rsc"
    "backup-lksjdald-oct-30-2018.rsc"
    "backup-ksjsjsj-2 (lasdhqiwwk)-mar-17-2019.rsc"
    "backup-askjdlaksjdw-oct-05-2018.rsc"
)

target=~+/files

if [ ! -d $target ]
then
  mkdir $target
fi

for file in "${files[@]}"; do
  touch "$target/$file"
done