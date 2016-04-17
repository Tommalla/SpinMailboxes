/*
 * A template for the 2016 Promela/SPIN Assignment at the University of Warsaw.
 * Copyright (C) 2016, Konrad Iwanicki.
 */
#ifndef TEST_FILE
#error This is not a test file to invoke spin on.
#endif // TEST_FILE

#ifndef RELIABLE_BROADCAST
#warning Using basic broadcast.
#endif // RELIABLE_BROADCAST

#include "mailboxes-impl.pml"


inline bb_pre_run_init()
{
  // FIXME: implement
  skip
}


inline bb_post_run_init()
{
  // FIXME: implement
  skip
}


inline bb_broadcast(sm)
{
    int i;
    for (i : 1 .. NUM_PROCESSES) {
        mb_send(i - 1, sm);
        possibly_fail();
    }
}


inline bb_deliver(rm)
{
    mb_recv(rm);
}
