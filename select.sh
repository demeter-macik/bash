#!/bin/bash

echo Select one option:
OPTIONS=( a b c )
select CHOISE in ${OPTIONS[@]}
do
    echo "Selection: $CHOISE"
    break;
done

echo -

echo List files in current directory:
select fname in *;
do
    echo Selection $fname \($REPLY\)
    break;
done
