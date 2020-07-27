#!/bin/bash

echo 'Grouping without side effects ():'
counter=1
( ((counter++)); echo "local: $counter" )
echo "global: $counter"

echo 'Grouping with side effects {}:'
counter=1
{ ((counter++)); echo "local: $counter"; }
echo "global: $counter"