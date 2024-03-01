TARGET = test
ARLIB = lib$(TARGET).a

SRC_FILES := a.c
OBJ_FILES := $(filter-out $(NOT_OBJ_FILES), $(SRC_FILES:.c=.o))

override CFLAGS += -g -fwrapv -fPIC -Wl,--export-dynamic

CFLAGS_OPT_LEVEL = -O3
override CFLAGS += $(CFLAGS_OPT_LEVEL)

AR := $(or $(AR),ar) rs
RM = rm -f
ECHO = echo

CC ?= cc

all:	build

build:  $(ARLIB)

clean:
	-@ $(RM) $(ARLIB) $(OBJ_FILES)

.PHONY: all clean build 

.c.o:
	env |grep ming
	@$(ECHO) compiling $(<)
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -c $<

$(ARLIB): $(OBJ_FILES) Makefile
	$(AR) $@ $(OBJ_FILES)
