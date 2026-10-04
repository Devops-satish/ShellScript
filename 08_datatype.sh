#!/bin/bash

NUM1=100
NUM2=satish

SUM=$(($NUM1+$NUM2))

echo "sum is: $SUM"

#Array
FRUITS=("Apple","Banana","cherry")
echo "Fruits are: ${FRUITS[@]}"
echo "First Fruit is: ${FRUITS[0]}"
echo "second Fruit is: ${FRUITS[1]}"
echo "Third Fruit is: ${FRUITS[2]}"

