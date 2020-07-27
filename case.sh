#!/bin/bash
NAME=john
case $NAME in
    john | John | JOHN)echo "John";;
    jan | "Jan Jan") echo "Jan";;
    # Default
    *) echo "Not found";;
esac

echo "-"

# Case plus next case
NAME=b
case $NAME in
  a | b | c) echo "abc";&
  b | a | c) echo "bac";;
  c | a | b) echo "cab";;
  c | b | a) echo "cab";;
esac

echo "-"

# Case plus next case
NAME=b
case $NAME in
  a | b | c) echo "abc";;&
  b | a | c) echo "bac";;
  c | a | b) echo "cab";;
  c | b | a) echo "cab";;
esac