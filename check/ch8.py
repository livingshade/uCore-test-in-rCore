import base

EXPECTED = [
    # ch8b_mpsc_sem.c
    "mpsc_sem passed!",

    # ch8b_mut_race.c
    "race adder blocking mutex passed!",
    # ch8b_spin_mut_race.c
    "race adder spinning mutex passed!",

    # ch8b_sync_sem.c
    "sync_sem passed!",
    # ch8b_test_condvar.c
    "test_condvar passed!",

    # ch8b_threads.c
    "threads test passed!",
    # ch8b_threads_arg.c 
    "threads with arg test passed!",

    # ch8b_mut_phi_din.c
    "philosopher dining problem with mutex passed!",

    # ch8_mut1_deadlock.c
    # "deadlock test mutex 1 OK!",
    # ch8_sem1_deadlock.c
    # "deadlock test semaphore 1 OK!",
    # ch8_sem2_deadlock.c
    # "deadlock test semaphore 2 OK!",
]

NOT_EXPECTED = [
    "FAIL: T.T",
]

TEMP = [
    # ch8b_usertest.c
    "ch8b Usertests passed!",

    # ch8_usertest.c
    # "ch8 Usertests passed!"
]

if __name__ == '__main__':
    base.test(EXPECTED, NOT_EXPECTED)
