#!/bin/bash

echo 'Returns 0 if result is grether than 0'
if ((5)); then
  echo True
else
  echo False
fi

echo Returns 1 if result is equal 0
if ((0)); then
  echo False
else
  echo True
fi