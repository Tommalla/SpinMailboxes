#!/bin/bash
set -x #echo on
./main.sh ../src/mailboxes-test.pml mb_at_most_once_delivery
set +x #echo off