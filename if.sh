#!/bin/bash

echo If condition:
NUM=5
if [[ "$NUM" -eq 5 ]]; then
    echo true
else
    echo false
fi