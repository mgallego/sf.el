PREFIX=$(HOME)
EMACSDIR=$(PREFIX)/.emacs.d

install: install-all

install-all:
	install -m 755 sf.el $(EMACSDIR)/sf.el