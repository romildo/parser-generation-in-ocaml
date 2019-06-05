.PHONY: all clean exec

OCAMLOPT := ocamlopt
MENHIR := menhir
MENHIR_FLAGS := --dump
OCAMLLEX := ocamllex
EXECUTABLE := main.exe

all: $(EXECUTABLE)

$(EXECUTABLE): parser.mli parser.ml lexer.ml main.ml
	$(OCAMLOPT) -o $(EXECUTABLE) $^

%.ml: %.mll
	$(OCAMLLEX) $<

%.ml %.mli: %.mly
	$(MENHIR) $(MENHIR_FLAGS) $<

exec: $(EXECUTABLE)
	rlwrap ./$(EXECUTABLE)

clean:
	-rm parser.mli parser.ml parser.automaton parser.conflicts
	-rm lexer.ml
	-rm *.cmi *.cmx *.o
	-rm $(EXECUTABLE)
