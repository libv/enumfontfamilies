WATCOM_RELEASE = /home/libv/wine/open-watcom-v2/rel
MINGW_PATH = /usr/bin/i686-w64-mingw32-

export WATCOM := $(WATCOM_RELEASE)
export PATH := ${WATCOM_RELEASE}/binl64:${WATCOM_RELEASE}/binl:$(PATH)
export INCLUDE := ${WATCOM_RELEASE}/h/win:${WATCOM_RELEASE}/h

WCC = wcl
WCCFLAGS = -q -bt=windows -l=windows

CFLAGS += -O0 -g -Wall
LDFLAGS += -lgdi32 -mwindows

CROSS_COMPILE ?= $(MINGW_PATH)
CC = $(CROSS_COMPILE)gcc
LD = $(CROSS_COMPILE)ld

all: enumfontfamilies16.exe enumfontfamilies32.exe

enumfontfamilies16.exe: enumfontfamilies.c
	$(WCC) -fe=$@ $< $(WCCFLAGS)

enumfontfamilies32.exe: enumfontfamilies.c
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f *.o
	rm -f *.exe
