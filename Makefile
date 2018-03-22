CC	= clang
CFLAGS	= -std=gnu99 -ggdb
UNAME_M := $(shell uname -m)

.PHONY: arm

all:
ifneq (,$(findstring arm,$(UNAME_M)))
	$(MAKE) arm
endif


arm: sample-target sample-library.so
	$(CC) -marm $(CFLAGS) -DARM -o inject utils.c ptrace.c inject-arm.c -ldl

sample-library.so: sample-library.c
	$(CC) $(CFLAGS) -D_GNU_SOURCE -shared -o sample-library.so -fPIC sample-library.c

sample-target: sample-target.c
	$(CC) $(CFLAGS) -o sample-target sample-target.c

clean:
	rm -f sample-library.so
	rm -f sample-target
	rm -f inject
	rm -f sample-library32.so
	rm -f sample-target32
	rm -f inject32
