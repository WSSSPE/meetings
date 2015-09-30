all: WSSSPE3_review.pdf

WSSSPE3_review.pdf: *.tex *.bib
	pdflatex -interaction nonstopmode WSSSPE3_review.tex
	bibtex WSSSPE3_review
	pdflatex -interaction nonstopmode WSSSPE3_review.tex
	pdflatex -interaction nonstopmode WSSSPE3_review.tex
	pdflatex -interaction nonstopmode WSSSPE3_review.tex

.PHONY: clean

clean:
	rm -f *.pdf *.log *.aux *.out *.bbl *.blg *.toc *.lof *.lot *.dvi *.ps

