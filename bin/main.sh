#!/bin/bash
FLAGS="$SPINFLAGS -DNOREDUCE -DNUM_PROCESSES=3"
spin -a $FLAGS $1
if [ $? -eq 0 ];
then
   gcc $FLAGS -o pan pan.c
   ./pan -a -f -N $2
   if [ -e $1.trail ];
   then
      spin -a -t -p $FLAGS  $1
      mv $1.trail $2.trail
   fi
fi
