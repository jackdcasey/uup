prefix ?= /usr/local
bindir = $(prefix)/bin

build:
	swift build -c release --disable-sandbox

install: build
	install ".build/release/uup" "$(bindir)"

uninstall:
	rm -rf "$(bindir)/uup"

clean:
	rm -rf .build

.PHONY: build install uninstall clean
