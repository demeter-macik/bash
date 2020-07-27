#!/bin/bash

echo For in:
for NUMBER in 1 2 3; do
    echo $NUMBER
done

echo Range with step:
for NUMBER in {1..10..2}; do
    echo $NUMBER
done

echo In array:
NUMBERS=(1 2 3 4 5)
for NUMBER in ${NUMBERS[@]}; do
    echo $NUMBER
done

echo Loop through indices:
for i in ${!NUMBERS[@]}; do
    echo $i
done

echo Three expressions:
for (( c=10; c<=20; c++ ))
do
    if [ "$c" -le 12 ]; then
        continue
    elif [ "$c" -gt "15" ]; then
        break
    fi
    echo $c
done