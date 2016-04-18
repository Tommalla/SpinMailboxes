#!/bin/bash
set -x #echo on
./main.sh ../src/mailboxes-test.pml mb_guaranteed_delivery_self
./main.sh ../src/mailboxes-test.pml mb_guaranteed_delivery
set +x #echo off
