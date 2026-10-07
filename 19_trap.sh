#!/bin/bash
set -e #ERR

trap 'echo "There is an Error in #LINENO...command $BASH_COMMAND"' ERR

echo "Hello world"
echo "Good Morning Hyderbad"
echoo "Satish"
echo "Devops..Do or Die"