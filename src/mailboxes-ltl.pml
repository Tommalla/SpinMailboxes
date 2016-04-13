/*
 * A template for the 2016 Promela/SPIN Assignment at the University of Warsaw.
 * Copyright (C) 2016, Konrad Iwanicki.
 */
#ifndef TEST_FILE
#error This is not a test file to invoke spin on.
#endif // TEST_FILE

#define is_sending(id) \
(proc[id]@proc_send)
#define is_sending_to(a, b) \
(is_sending(a) && proc[a]:tp == b)
#define guaranteed_delivery(a, b) \
([] (is_sending_to(a, b) -> <>(proc[b]@proc_receive)))
#define guaranteed_delivery_sym(a, b) \
(guaranteed_delivery(a, b) && guaranteed_delivery(b, a))

ltl mb_guaranteed_delivery { guaranteed_delivery_sym(0, 1) && guaranteed_delivery_sym(0, 2) && guaranteed_delivery_sym(1, 2) }

//ltl mb_at_most_once_delivery { true }

//ltl mb_no_fabrication { true }
