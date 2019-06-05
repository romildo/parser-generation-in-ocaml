.PHONY: all clean exec test

DUNE       := dune
EXECUTABLE := driver.exe

all: driver

driver:
	$(DUNE) build src/$(EXECUTABLE)

exec:
	rlwrap $(DUNE) exec src/$(EXECUTABLE)

test:
	$(DUNE) runtest

clean:
	$(DUNE) clean
