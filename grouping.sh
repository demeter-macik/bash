#!/bin/bash

echo 'Grouping without side effects ():'
counter=1
f1() ( ((counter++)); echo "local: $counter" )
f1
echo "global: $counter"

echo 'Grouping with side effects {}:'
counter=1
f2() { ((counter++)); echo "local: $counter"; }
f2
echo "global: $counter"