#!/bin/bash

echo Brace expansion:
echo 1{a,b,c}
echo {01..10..2}

echo
echo Tilde expansion:
echo '$HOME:' ~
echo '$PWD:' ~+
echo '$OLDPWD:' ~-
# push to direcotry stack
pushd ~/temp
echo directory stack: ~+0 ~+1

echo
echo Shell parameter expansion:
echo basic: ${HOME}
echo without optional braces: $HOME

echo
echo Indirect expansion:
var=value
varName="var"
declare -n varRef=var
echo variable: ${!varName}
echo "variables starting with 'va':" ${!va*}
echo "variables starting with 'va' expanded to separate words:" ${!va@}
array=(a b c)
echo expand array indices: ${!array[*]}
echo expand array indices to separate words: ${!array[@]}
echo variable reference: ${!varRef}

echo
unsetVar="unsetValue"
unset unsetVar
nullVar=
defVar=defaultValue
echo ignore default value: ${var:-$defVar}
echo use default instead of the null: ${nullVar:-$defVar}
echo use default instead of the unset: ${unsetVar:-otherDefaultValue}

echo
echo ignore setting default value: ${var:=$defVar}
echo set default value if null: ${nullVar:=$var} ${nullVar}
echo set default value if unset: ${unsetVar:=$var} ${unsetVar}
# Invalid usage
#echo set default positional to parameter: ${1:=$var} $1

echo
nullVar=
unset unsetVar
echo ignore validation: ${var:='Invalid var'}
echo validate null: ${nullVar:='Null var'}
echo validate unset: ${unsetVar:='Unset var'}

echo
echo always set default: ${var:+defVar}
echo always set default: ${nullVar:+defVar}
echo always set default: ${unsetVar:+defVar}

echo
echo Substring expansion:
echo string: ${var:1:1}
echo string: ${var:1:-1}
echo string: ${var: -3}
array=(a b c d e)
echo array: ${array[@]:1:2}
echo array: ${array[*]:1:2}
f() (
    echo function parameters: ${@:2:2}
    echo function parameters: ${*:2:2}
    echo last function parameter: ${*: -1}
)
f a b c d e

echo
echo Length expansion:
echo string length: ${#var}
echo array length: ${#array[*]}
echo array length: ${#array[@]}
array=(aaa bb c)
echo array element length: ${#array[-1]} ${#array[-2]} ${#array[-3]}
echo array element length: ${#array[0]} ${#array[1]} ${#array[2]}

echo
echo Pattern expansion:
var='home/user/app.log'
array=('home/user/app.log' 'home/user/srv.log' 'home/user/svc.log')
echo match shortest beginning: ${var#*/}
echo match shortest beginning: ${array[@]#*/}
echo match longest beginning: ${var##*/}
echo match longest beginning: ${array[@]##*/}

echo
echo match shortest ending: ${var%/*}
echo match shortest ending: ${array[@]%/*}
echo match longest ending: ${var%%/*}
echo match longest ending: ${array[@]%%/*}

echo Replace substring:
echo replace longest: ${var/user/john}
echo replace longest beginning: ${var/#home/etc}
echo replace longest ending: ${var/%log/txt}

echo Case expansion:
# var=useruser
echo first char to upper case: ${var^} same as ${var^?}
echo first char to upper case: ${var^s}
echo all matches to upper case: ${var^^s}
var=USeruSer
echo first char to lower case: ${var,U}
echo all matches to lower case: ${var,,S}

echo Transformation/Information expansion:
var='\"value'
echo input: ${var@Q}
echo escape: ${var@E} same as $'\"value'
var='\"value\h'
echo prompt: ${var@P}
var='newValue'
echo evaluate: ${var@A} ${var}
var='newValue'
declare -i var=1
echo expand declaration: ${var@A}
echo expand flags: ${var@a}