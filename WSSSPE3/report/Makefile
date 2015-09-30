all: WSSSPE3_review.pdf

registrants.tex: registrants.txt insert_registrants.py
	python ./insert_registrants.py > registrants.tex

WSSSPE3_review.pdf: *.tex *.bib registrants.tex
	pdflatex -interaction nonstopmode WSSSPE3_review.tex
	bibtex WSSSPE3_review
	pdflatex -interaction nonstopmode WSSSPE3_review.tex
	pdflatex -interaction nonstopmode WSSSPE3_review.tex
	pdflatex -interaction nonstopmode WSSSPE3_review.tex

.PHONY: clean

clean:
	rm -f *.pdf *.log *.aux *.out *.bbl *.blg *.toc *.lof *.lot *.dvi *.ps registrants.tex

