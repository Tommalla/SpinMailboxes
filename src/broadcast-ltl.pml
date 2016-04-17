/*
 * A template for the 2016 Promela/SPIN Assignment at the University of Warsaw.
 * Copyright (C) 2016, Konrad Iwanicki.
 */
#ifndef TEST_FILE
#error This is not a test file to invoke spin on.
#endif // TEST_FILE

#define message_delivered(id, msg) \
(process[id]@proc_deliver && process[id]:rm == msg)

#define delivers_once(id, msg) \
([](message_delivered(id, msg) -> [](process[id]@proc_await_message -> !<>(message_delivered(id, msg)))))

#define message_broadcasted(id, msg) \
(process[id]@proc_broadcast && process[id]:sm == msg)
#define not_created(a, b, msg) \
([]<>(<>message_delivered(a, msg) -> message_broadcasted(b, msg)))
#define not_created_sym(a, b, msg) \
(not_created(a, b, msg) && not_created(b, a, msg))

#define correct(id) \
(!(<>(process[id]@end_proc_fail)))
#define delivered_to_self(id) \
(not_created(id, id, id))
#define weak_valid(id) \
([](correct(id) -> delivered_to_self(id)))

#define correct_received(id, msg) \
(correct(id) -> <>message_delivered(id, msg))
#define strong_valid(id) \
([]<>((<>(correct(id) && message_broadcasted(id, id))) -> (correct_received(1, id) && correct_received(2, id) && correct_received(3, id))))

#define single_weak_agreement(id, msg) \
((correct(id) && (<>message_delivered(id, msg))) -> (correct_received(1, msg) && correct_received(2, msg) && correct_received(3, msg)))

#define single_strong_agreement(id, msg) \
((<>message_delivered(id, msg)) -> ((correct_received(1, msg) && correct_received(2, msg) &&correct_received(3, msg))))

ltl no_duplication1 { delivers_once(1, 2) && delivers_once(1, 3) }
ltl no_duplication2 { delivers_once(2, 1) && delivers_once(2, 3) }
ltl no_duplication3 { delivers_once(3, 1) && delivers_once(3, 2) }

ltl no_creation_self { delivered_to_self(1) && delivered_to_self(2) && delivered_to_self(3) }
ltl no_creation12 { not_created_sym(1, 2, 1) && not_created_sym(1, 2, 2) && not_created_sym(1, 2, 3) }
ltl no_creation13 { not_created_sym(1, 3, 1) && not_created_sym(1, 3, 2) && not_created_sym(1, 3, 3) }
ltl no_creation23 { not_created_sym(2, 3, 1) && not_created_sym(2, 3, 2) && not_created_sym(2, 3, 3) }

ltl weak_validity { weak_valid(1) && weak_valid(2) && weak_valid(3) }

ltl strong_validity { strong_valid(1) && strong_valid(2) && strong_valid(3) }

ltl weak_agreement { single_weak_agreement(1, 1) && single_weak_agreement(2, 1) && single_weak_agreement(3, 1) }

ltl strong_agreement { single_strong_agreement(1, 1) && single_strong_agreement(2, 1) && single_strong_agreement(3, 1) }