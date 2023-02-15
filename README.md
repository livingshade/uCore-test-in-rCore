Currently we only support ch8

usage: (you may refer to github workflow)

```shell
# suppose this rCore-Tutorial-Code-2023S is cloned to .
git clone git@github.com:livingshade/uCore-test-in-rCore.git ci-user
git clone git@github.com:LearningOS/uCore-Tutorial-Test-2023S.git ci-user/ucore
cd ci-user
bash move.sh
cd ../os
make run CHAPTER=8 BASE=1
```

Attention: 
- you need to delete/change `ch6b_filetest.c` otherwise it won't compile.cd
- currently this will panic, working on it.