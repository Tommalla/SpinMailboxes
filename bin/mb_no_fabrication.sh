#!/bin/bash
set -x #echo on
./main.sh ../src/mailboxes-test.pml mb_no_fabrication1
./main.sh ../src/mailboxes-test.pml mb_no_fabrication2
./main.sh ../src/mailboxes-test.pml mb_no_fabrication3
set +x #echo off
