CHAPTER ?=

ifeq ($(CHAPTER), 3)
	LAB := 1
else ifeq ($(CHAPTER), 4)
	LAB := 2
else ifeq ($(CHAPTER), 5)
	INITPROC := 1
	LAB := 3
else ifeq ($(CHAPTER), 6)
	INITPROC := 1
	LAB := 4
else ifeq ($(CHAPTER), 7)
	INITPROC := 1
	LAB := 4
else ifeq ($(CHAPTER), 8)
	INITPROC := 1
	LAB := 5
else ifeq ($(CHAPTER), 9)
	INITPROC := 1
	LAB := 6
endif

utest:
	bash move.sh
ifdef INITPROC
	cp -f user/build/elf/ch$(CHAPTER)b_usertest.elf user/build/elf/ch$(CHAPTER)b_initproc.elf
endif
	make -C ../os run | tee stdout-ch$(CHAPTER)
	python3 check/ch$(CHAPTER).py < stdout-ch$(CHAPTER)


.PHONY: test
