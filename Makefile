#==========================================
#    Makefile: makefile for sl 5.1
#	Copyright 1993, 1998, 2014
#                 Toyoda Masashi
#		  (mtoyoda@acm.org)
#	Last Modified: 2014/03/31
#==========================================

CC          := cc
CFLAGS      := -O -Wall

PREFIX      ?= /usr/local
BINDIR      := $(PREFIX)/bin
MANDIR      := $(PREFIX)/share/man
MAN1DIR     := $(MANDIR)/man1
MAN1JADIR   := $(MANDIR)/ja/man1

.PHONY: all clean distclean install uninstall

all: sl

sl: sl.c sl.h
	$(CC) $(CFLAGS) -o sl sl.c -lncurses

clean:
	rm -f sl

distclean: clean

install: sl sl.1 sl.1.ja
	install -d $(BINDIR) $(MAN1DIR) $(MAN1JADIR)
	install -m 0755 sl      $(BINDIR)/
	install -m 0644 sl.1    $(MAN1DIR)/
	install -m 0644 sl.1.ja $(MAN1JADIR)/
	mandb -q $(MANDIR) || true

uninstall:
	rm -f $(BINDIR)/sl
	rm -f $(MAN1DIR)/sl.1
	rm -f $(MAN1JADIR)/sl.1.ja
