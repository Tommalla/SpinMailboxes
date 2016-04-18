#!/bin/bash
set -x #echo on
export SPINFLAGS="-DONE_BROADCASTER=1"
./main.sh ../src/broadcast-test.pml strong_validity
set +x #echo off