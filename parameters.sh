#!/bin/bash

echo Declare shell parameter:
declare var=a
echo parameter value is $var

echo Append string:
num=666
num+=34
echo String $num

echo Append integer:
declare -i num=666
num+=34
echo Integer $num

echo: Declare reference variable:
declare -n ref=num
num+=13
ref+=10
echo original value: $num reference: $ref
