#!/bin/bash
set -x #echo on
export SPINFLAGS="-DONE_BROADCASTER=1 -DRELIABLE_BROADCAST"
./main.sh ../src/broadcast-test.pml weak_agreement
set +x #echo off