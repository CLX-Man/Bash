SHELL := /bin/bash

latex.tex: latex.sh
	./latex.sh

test.tex: test.sh
	./test.sh

test.sh: 
	./test.sh

clean:
	rm test.tex latex.tex