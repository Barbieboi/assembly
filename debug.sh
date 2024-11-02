#!/bin/bash


PURPLE='\033[00;35m'
RESTORE='\033[0m'

PORT='12345'


printf "Starting on localhost:$PORT\n"
echo "qemu-arm -g $PORT $@ &" 
sleep 1
qemu-arm -g $PORT $@ &
echo "starting gdb in arm reading from $1 on port $PORT"
sleep 1
gdb-multiarch -q --nh -ex "set architecture arm" -ex "file $1" -ex "target remote localhost: $PORT" -ex "b main" -ex "continue" -ex "tui reg general" 
#silent killall
killall -9 qemu-arm &> /dev/null

