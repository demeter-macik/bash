#!/bin/bash

val=abc

echo Regular expression:
name=file.txt
pattern='\.txt'
[[ $name =~ $pattern ]] && echo match

echo Invalid expression:
name=file.txt
# This doesn't work because ' is a part of the pattern
[[ $name =~ '\.txt' ]] || echo "doesn't match"

echo Bolean operator:
name=file.txt
pattern1='\.txt'
pattern2='file\.'
[[ ($name =~ $pattern1) && ($name =~ $pattern2) ]] && echo match

echo Bracket globbing:
name=file.txt
pattern='\.txt'
[[ $name = [fgr]ile.txt ]] && echo match