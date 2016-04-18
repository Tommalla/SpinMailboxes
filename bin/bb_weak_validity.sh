#!/bin/bash
set -x #echo on
export SPINFLAGS="-DONE_BROADCASTER=1"
./main.sh ../src/broadcast-test.pml weak_validity
set +x #echo off