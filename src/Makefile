CC=nim
OPTS=
PREFIX=/usr/local

compile: k.nim version.nim helpers.nim
	$(CC) $(OPTS) c k.nim

install: k
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp $< $(DESTDIR)$(PREFIX)/bin/k

.PHONY: uninstall
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/k
