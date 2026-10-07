SHELL := /bin/bash

latex.tex: latex.sh
	./latex.sh < antworten.txt

test.tex: test.sh
	./test.sh

test.sh: 
	./test.sh

clean:
	rm test.tex latex.tex