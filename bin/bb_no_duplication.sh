#!/bin/bash
set -x #echo on
./main.sh ../src/broadcast-test.pml no_duplication1
./main.sh ../src/broadcast-test.pml no_duplication2
./main.sh ../src/broadcast-test.pml no_duplication3
set +x #echo off