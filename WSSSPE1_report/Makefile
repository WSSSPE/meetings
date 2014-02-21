TARGET = WSSSPE1_summary_report
FIGURES = 

# override the following two in your local checkout, or on the commandline,
# like so: $ make TEXBINPATH=/your/own/path/to/pdflatex/bin/
# Path must end with a slash. Defaults to using the shell's PATH variable.
TEXBINPATH  =
pdflatex    = $(TEXBINPATH)pdflatex
bibtex      = $(TEXBINPATH)bibtex

all: ${TARGET}.pdf

clean: 
	rm -f ${TARGET}.log ${TARGET}.bbl ${TARGET}.log ${TARGET}.d 
	rm -f ${TARGET}.blg ${TARGET}.out ${TARGET}.aux
	rm -f ${TARGET}.pdf

%.pdf : %.tex $(FIGURES) 
	$(pdflatex) $*
	$(bibtex) $(TARGET)
	$(pdflatex) $*
	$(pdflatex) $*

force_look:
	true
