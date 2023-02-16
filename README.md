# uCore-test-in-rCore

Test uCore test(in C), in rCore OS(in Rust)
## Usage

Currently we only support ch8

This repo should be combined with rCore-Tutorial-Code-2023S.

usage: (you may refer to github workflow)

```shell
# suppose this rCore-Tutorial-Code-2023S is cloned to .
git clone git@github.com:livingshade/uCore-test-in-rCore.git ci-user
git clone git@github.com:LearningOS/uCore-Tutorial-Test-2023S.git ci-user/ucore
cd ci-user
make utest CHAPTER=8
```

## Notes 

- you need to delete/change `ch6b_filetest.c` otherwise it won't compile.
- you need to add linker flag `-no-pie` in uCore-Tutorial-Test-2023S's CMakeLists.txt
- you need to modify some syscall id, to make sure uCore is algined with rCore.
- you needs to modify `run_tests` in `usertest.h`, this file is totally broken, because: 
    - `waitpid` seems to act differently in uCore and rCore. uCore does not yield when child procs is still running, but rCore do.
    - rCore lacks a null-pointer check in `exec`, so it will panic when a C program calls `exec(..,NULL)`.
    - there are many more, I believe.
- you might need to change `user.ld` in uCore-Tutorial-Test-2023S to `linker.ld` in rCore-Tutorial-Test-2023S, optional.


