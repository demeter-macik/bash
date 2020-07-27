#!/bin/bash

echo Positional parameters:
f() (
  shift 1
  echo parameters: $# first: $1 second: $2
)
f a b c

echo Print all shell vars and funcs:
set

echo Set positional parameters:
f() (
  set x y z
  echo parameters: $# first: $1 second: $2 third: $3
)
f a b c



# $*	$1 $2 $3...
# $@	$1 $2 $3...
# "$*"	"$1 $2 $3..."
# "$@"	"$1" "$2" "$3"...
echo Expands positional parameters:
f() (
  echo parameters: $*
  echo parameters: $@
  echo number: $#
  echo last exit code: $?
  echo current options flags: $-
  echo process id: $$
  cat&
  echo last background process: $!
  echo name of the shell: $0
  echo startup: $_
)
f aaa bbb ccc