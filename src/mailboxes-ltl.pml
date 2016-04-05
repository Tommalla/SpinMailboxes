/*
 * A template for the 2016 Promela/SPIN Assignment at the University of Warsaw.
 * Copyright (C) 2016, Konrad Iwanicki.
 */
#ifndef TEST_FILE
#error This is not a test file to invoke spin on.
#endif // TEST_FILE


ltl mb_guaranteed_delivery { 0 }

ltl mb_at_most_once_delivery { 0 }

ltl mb_no_fabrication { 0 }
