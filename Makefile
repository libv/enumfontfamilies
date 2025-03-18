WATCOM_RELEASE = /home/libv/wine/open-watcom-v2/rel

export WATCOM := $(WATCOM_RELEASE)
export PATH := ${WATCOM_RELEASE}/binl64:${WATCOM_RELEASE}/binl:$(PATH)
export INCLUDE := ${WATCOM_RELEASE}/h/win:${WATCOM_RELEASE}/h

WCC = wcl
WCCFLAGS = -q -bt=windows -l=windows

all: enumfontfamilies16.exe

enumfontfamilies16.exe: enumfontfamilies16.c
	$(WCC) $< $(WCCFLAGS)

clean:
	rm -f *.o
	rm -f *.exe
