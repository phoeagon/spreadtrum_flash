LIBUSB = 1
APPNAME = spd_dump

CFLAGS = -O2 -Wall -Wextra -std=c99 -pedantic -Wno-unused
CFLAGS += -DUSE_LIBUSB=$(LIBUSB)
CFLAGS += -I$(shell brew --prefix libusb)/include

LDFLAGS += -L$(shell brew --prefix libusb)/lib
LIBS = -lm

ifeq ($(LIBUSB), 1)
LIBS += -lusb-1.0
endif

.PHONY: all clean
all: clean GITVER.h $(APPNAME)

clean:
	$(RM) GITVER.h $(APPNAME)

GITVER.h:
	echo "#define GIT_VER \"$(shell git rev-parse --abbrev-ref HEAD)\"" > GITVER.h
	echo "#define GIT_SHA1 \"$(shell git rev-parse HEAD)\"" >> GITVER.h

$(APPNAME): $(APPNAME).c common.c
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS) $(LIBS)
