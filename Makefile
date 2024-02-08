# Output directories
BIN = bin
OBJ = obj

VERSION = 1A
NAME_SHORT = IA

OUTPUT = $(NAME_SHORT)_$(VERSION)

MAKE_NAME = 'NAME="TESTBENCH"'
MAKE_VERSION = 'VERSION="$(VERSION)"'

# Append OBJ and BIN directories to output filename
BIN_NAME := $(OUTPUT).bin
OUTPUT := $(BIN)/$(OUTPUT)

CC = g++
CFLAGS += -D$(MAKE_NAME)
CFLAGS += -D$(MAKE_VERSION)
CFLAGS += -std=c++17 
CFLAGS += -Wall 
CFLAGS += -g 
CFLAGS += -Wno-narrowing 
CFLAGS += -Wno-comment 
CFLAGS += -Wno-unused
CFLAGS += -lpthread
CFLAGS += -pthread 
CFLAGS += -D'stdvt=std'
# CFLAGS += -ftime-report

ROOT_LIB = 

# font lib
#C_SRCS += ***.c


SRCS += main.c


INCLUDES += -I .
# INCLUDES += -I Data/

LDFLAGS +=

LIBS += -lm

PROGRAM = TESTBENCH.exe

C_OBJS = $(C_SRCS:.c=.o)
CPP_OBJS = $(SRCS:.cpp=.o)

.PHONY: clean

all: $(PROGRAM)

%.o: %.cpp
	$(CC) -c -o $@ $< $(CFLAGS) $(INCLUDES) 

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS) $(INCLUDES) 
		
$(PROGRAM): $(CPP_OBJS) $(C_OBJS)
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS) $(LIBS)
			
clean:
		$(RM) $(wildcard *.o) $(wildcard *~) $(PROGRAM)
#find ./ -name '*.o' -delete

debug:
	gdb ./$(PROGRAM)