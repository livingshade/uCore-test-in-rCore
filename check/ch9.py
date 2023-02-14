import base

EXPECTED = [
    # ch7b
    "pipetest passed!",
    # ch8b
    "mpsc_sem passed!",
    "philosopher dining problem with mutex test passed!",
    "race adder using spin mutex test passed!",
    "sync_sem passed!",
    "test_condvar passed!",
    "threads with arg test passed!",
    "threads test passed!",
]

NOT_EXPECTED = [
    "FAIL: T.T",
]


EXPECTED = list(set(EXPECTED) - set(["Test sbrk almost OK!"]))

if __name__ == "__main__":
    base.test(EXPECTED, NOT_EXPECTED)
