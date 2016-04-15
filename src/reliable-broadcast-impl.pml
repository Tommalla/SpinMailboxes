/*
 * A template for the 2016 Promela/SPIN Assignment at the University of Warsaw.
 * Copyright (C) 2016, Konrad Iwanicki.
 */
#ifndef TEST_FILE
#error This is not a test file to invoke spin on.
#endif // TEST_FILE

#warning Using reliable broadcast.


#include "basic-broadcast-impl.pml"


inline rb_pre_run_init()
{
    skip;
}


inline rb_post_run_init()
{
    skip;
}


inline rb_broadcast(sendm)
{
    bb_broadcast(sendm);
}


inline rb_deliver(m)
{
    bb_deliver(m)
    do
    :: rb_dset[m-1] -> bb_deliver(m);
    :: !rb_dset[m-1] -> break;
    od;
    rb_dset[m-1] = true;
    //post rb_continuation(msg)
}


inline rb_continuation(m)
{
    bb_broadcast(m)
}
