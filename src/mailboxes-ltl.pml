/*
 * A template for the 2016 Promela/SPIN Assignment at the University of Warsaw.
 * Copyright (C) 2016, Konrad Iwanicki.
 */
#ifndef TEST_FILE
#error This is not a test file to invoke spin on.
#endif // TEST_FILE

#define received(id, msg) \
(proc[id]@proc_receive && proc[id]:rm == msg)
#define is_sending_msg(id, msg) \
(is_sending(id) && proc[id]:sm == msg)

#define is_sending(id) \
(proc[id]@proc_send)
#define is_sending_to(a, b) \
(is_sending(a) && proc[a]:tp == b && proc[a]:sm == a)
#define guaranteed_delivery(a, b) \
([] (is_sending_to(a, b) && []<>(proc[b]@proc_receive) -> <>received(b, a)))
#define guaranteed_delivery_sym(a, b) \
(guaranteed_delivery(a, b) && guaranteed_delivery(b, a))

#define delivered_once(id, msg) \
([](proc[id]:rm == msg -> (!proc[id]@proc_send U proc[id]:rm != msg)))
#define delivered_all_once(id) \
(delivered_once(id, 1) && delivered_once(id, 2) && delivered_once(id, 3))

#define no_fabrication_msg(id, msg) \
([](<>(<>received(id, msg) -> (is_sending_msg(1, msg) || is_sending_msg(2, msg) || is_sending_msg(3, msg)))))
#define no_fabrication(id) \
(no_fabrication_msg(id, 1) && no_fabrication_msg(id, 2) && no_fabrication_msg(id, 3))

ltl mb_guaranteed_delivery_self { guaranteed_delivery(1, 1) && guaranteed_delivery(2, 2) && guaranteed_delivery(3, 3) }
ltl mb_guaranteed_delivery { guaranteed_delivery_sym(1, 2) && guaranteed_delivery_sym(1, 3) && guaranteed_delivery_sym(2, 3) }

ltl mb_at_most_once_delivery { delivered_all_once(1) && delivered_all_once(2) && delivered_all_once(3) }

ltl mb_no_fabrication1 { no_fabrication(1) }
ltl mb_no_fabrication2 { no_fabrication(2) }
ltl mb_no_fabrication3 { no_fabrication(3) }
