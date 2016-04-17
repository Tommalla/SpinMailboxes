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
(!<>process[id]@end_proc_fail)
#define delivered_to_self(id) \
(not_created(id, id, id + 1))
#define weak_valid(id) \
([](correct(id) -> delivered_to_self(id)))

#define correct_received(id, msg) \
(correct(id) -> <> process[id]@proc_deliver && process[id]:rm == msg)
#define strong_valid(id) \
([]<>((<>(correct(id) && message_broadcasted(id, id + 1))) -> (correct_received(0, id + 1) && correct_received(1, id + 1) && correct_received(2, id + 1))))

//ltl no_duplication { delivers_once(0) && delivers_once(1) && delivers_once(2) }

/*ltl no_creation { delivered_to_self(0) && delivered_to_self(1) && delivered_to_self(2) &&
                  not_created_sym(0, 1, 1) && not_created_sym(0, 1, 2) && not_created_sym(0, 1, 3) /*&&
                  not_created_sym(1, 3, 1) && not_created_sym(1, 3, 2) && not_created_sym(1, 3, 3) &&
                  /*not_created_sym(2, 3, 1) && not_created_sym(2, 3, 2) && not_created_sym(2, 3, 3) } */

//ltl weak_validity { weak_valid(0) && weak_valid(1) && weak_valid(2) }

//ltl strong_validity { strong_valid(0) && strong_valid(1) && strong_valid(2) }

ltl weak_agreement { (correct(2) && (<>message_delivered(2, 1))) -> (correct_received(1, 1) && correct_received(3, 1)) }

//ltl strong_agreement { (<>message_delivered(2, 1)) -> correct_received(3, 1) }