#!/bin/bash

NUM=$1

if [ $NUM -gt 20 ]; then
    echo "given number is greater than 20"
elif [ $NUM -eq 20 ]; then
    echo "given number is equal to 20"
else
    echo "given number is less than 20"
fi
