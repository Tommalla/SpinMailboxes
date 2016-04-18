#!/bin/bash
set -x #echo on
export SPINFLAGS="-DONE_BROADCASTER=1 -DRELIABLE_BROADCAST"
./main.sh ../src/broadcast-test.pml no_duplication1
./main.sh ../src/broadcast-test.pml no_duplication2
./main.sh ../src/broadcast-test.pml no_duplication3
set +x #echo off1