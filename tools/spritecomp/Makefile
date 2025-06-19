HAS_GXX_10 := $(shell command -v g++-10 2>/dev/null)

ifneq ($(HAS_GXX_10),)
CXX := g++-10
else
CXX := g++
endif

CXXFLAGS := -std=c++20 -O2 -Wall -Wno-switch -Werror

SRCS := spritecomp.cpp

HEADERS := spritecomp.h

ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

.PHONY: all clean

all: spritecomp$(EXE)
	@:

spritecomp$(EXE): $(SRCS) $(HEADERS)
	$(CXX) $(CXXFLAGS) $(SRCS) -o $@ $(LDFLAGS)

clean:
	$(RM) spritecomp spritecomp.exe
