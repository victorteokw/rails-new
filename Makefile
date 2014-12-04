EMACS ?= emacs
CASK ?= cask

all: unittest

unittest:
	$(CASK) exec $(EMACS) -batch -Q -L . \
		-l test/test-helper.el \
		-f ert-run-tests-batch-and-exit
