/*
 * A template for the 2016 Promela/SPIN Assignment at the University of Warsaw.
 * Copyright (C) 2016, Konrad Iwanicki.
 */
#ifndef TEST_FILE
#error This is not a test file to invoke spin on.
#endif // TEST_FILE

#define delivers_once(id) \
([](process[id]@proc_deliver -> process[id]@proc_deliver U !process[id]@proc_deliver))

#define message_delivered(id, msg) \
(process[id]@proc_deliver && process[id]:rm == msg)
#define message_broadcasted(id, msg) \
(process[id]@proc_broadcast && process[id]:sm == msg)
#define not_created(a, b, msg) \
([]<>(<>message_delivered(a, msg) -> message_broadcasted(b, msg)))
#define not_created_sym(a, b, msg) \
(not_created(a, b, msg) && not_created(b, a, msg))

#define correct(id) \
(!process[id]@end_proc_fail)
#define delivered_to_self(id) \
(not_created(id, id, id))
#define weak_valid(id) \
([](correct(id) -> delivered_to_self(id)))

//ltl no_duplication { delivers_once(1) && delivers_once(2) && delivers_once(3) }

/*ltl no_creation { not_created_sym(1, 1, 1) && not_created_sym(1, 1, 2) && not_created_sym(1, 1, 3) &&
                  not_created_sym(1, 2, 1) && not_created_sym(1, 2, 2) /* && not_created_sym(1, 2, 3) &&
                  not_created_sym(1, 3, 1) && not_created_sym(1, 3, 2) && not_created_sym(1, 3, 3) &&
                  not_created_sym(2, 3, 1) && not_created_sym(2, 3, 2) && not_created_sym(2, 3, 3)*\/ } */

ltl weak_validity { weak_valid(1) && weak_valid(2) && weak_valid(3) }

// ltl strong_validity { 0 }

// ltl weak_agreement { 0 }

// ltl strong_agreement { 0 }
