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
  // FIXME: implement
  skip
}


inline bb_deliver(rm)
{
  // FIXME: implement
  skip
}
