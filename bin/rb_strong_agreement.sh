#!/bin/bash
set -x #echo on
export SPINFLAGS="-DONE_BROADCASTER -DRELIABLE_BROADCAST"
./main.sh ../src/broadcast-test.pml strong_agreement
set +x #echo off