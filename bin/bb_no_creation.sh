#!/bin/bash
set -x #echo on
./main.sh ../src/broadcast-test.pml no_creation_self
./main.sh ../src/broadcast-test.pml no_creation12
./main.sh ../src/broadcast-test.pml no_creation13
./main.sh ../src/broadcast-test.pml no_creation23
set +x #echo off