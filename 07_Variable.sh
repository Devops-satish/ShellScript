#!/bin/bash

echo "all args passed to the script:: $@"
echo "Number of arguments passed to the script:: $#"
echo "script Name: $0"
echo "present directory: $pwd"
echo "who is running user: $USER"
echo "home directory of current user: $HOME"
echo "PID of the script: $$"
sleep 100 &
echo "PID of the Recently executed background process: $!"
echo "All args passed to the script: $*"
