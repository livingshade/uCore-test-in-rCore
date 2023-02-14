RAND := $(shell awk 'BEGIN{srand();printf("%d", 65536*rand())}')
DIR := workplace

ifdef GITHUB_ACTIONS
# do not define LAB in github action
else ifeq ($(CHAPTER), 3)
	LAB := 1
else ifeq ($(CHAPTER), 4)
	LAB := 2
else ifeq ($(CHAPTER), 5)
	LAB := 3
else ifeq ($(CHAPTER), 6)
	LAB := 4
else ifeq ($(CHAPTER), 7)
	LAB := 4
else ifeq ($(CHAPTER), 8)
	LAB := 5
endif

randomize:
	find $(DIR)/user/src -name "*.c" | xargs sed -i 's/OK/OK$(RAND)/g'
	find check -name "*.py" | xargs sed -i 's/OK/OK$(RAND)/g'

test: randomize
	mkdir -p $(DIR)/os
	cp ../os/* $(DIR)/os/
	cp overwrite/Makefile $(DIR)/Makefile
ifeq ($(shell test $(CHAPTER) -ge 6; echo $$?),0)
	cp overwrite/Makefile-nfs $(DIR)/Makefile
	mkdir -p $(DIR)/nfs
	cp ../nfs/* $(DIR)/nfs/
endif
ifeq ($(CHAPTER), 1)
	echo `no ci for ch1`
else ifeq ($(CHAPTER), 2)
	echo `no ci for ch2`
else ifeq ($(CHAPTER), 5)
	make -C $(DIR) clean
	# make -C $(DIR) test CHAPTER=5 BASE=0 INIT_PROC=ch5_usertest | tee stdout-ch5
	make -C $(DIR) test CHAPTER=5 BASE=1 INIT_PROC=ch5b_usertest | tee stdout-ch5
	python3 check/ch5.py < stdout-ch5

	# make -C $(DIR) clean
	# make -C $(DIR) test CHAPTER=5t BASE=0 INIT_PROC=ch5t_usertest | tee stdout-ch5t
	# python3 check/ch5t.py < stdout-ch5 #t

else
	make -C $(DIR) clean
	make -C $(DIR) test CHAPTER=$(CHAPTER) BASE=1 INIT_PROC=ch$(CHAPTER)b_usertest | tee stdout-ch$(CHAPTER)
	python3 check/ch$(CHAPTER).py < stdout-ch$(CHAPTER)
endif

ifdef LAB
	@for i in $(shell seq $(LAB)); do \
	if ! [ -f ../reports/lab$$i.pdf -o -f ../reports/lab$$i.md ]; then \
		echo "Report for lab$$i needed. Add your report to reports/lab$$i.pdf or reports/lab$$i.md" ; \
		exit 1 ; \
	else \
		echo "Report for lab$$i found." ; \
	fi; \
	done
endif

.PHONY: test
