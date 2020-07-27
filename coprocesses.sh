#!/bin/bash

# Replace a -> b

# COPROC default name
coproc { tr a b; }
echo "PID: $COPROC_PID"
echo aaa >&"${COPROC[1]}" # standard input [1]
exec {COPROC[1]}>&-
cat <&"${COPROC[0]}" # standard output [0]

echo -

coproc name { tr [:lower:] [:upper:]; }
echo "PID: $name_PID"
echo aAa >&"${name[1]}"
exec {name[1]}>&-
cat <&"${name[0]}"