#!/bin/bash

echo Shell function:
f1() (
  echo "Arguments: $#"
)
f1 a b c

echo "With reserved word 'function':"
function f2 {
  echo "Third argument: $3";
}
f2 a b c

echo Remove shell function:
unset -f f2 && echo removed

echo Using local variables:
loc=initial
f2() (
  local loc=local
  glo=global
  echo $loc
)
f2
echo $loc
echo $glo

echo Print function declaration:
declare -f f2

# export function
export -f f1
./function2.sh

counter=5
f3 () (
  echo Call recursivelly: $counter
  if [[ "$counter" -gt 1 ]]; then
    ((counter--))
    f3
  fi
)
f3