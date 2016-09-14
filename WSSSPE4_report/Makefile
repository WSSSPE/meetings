all: WSSSPE4_review.pdf

participants.tex: participants.txt insert_participants.py
	python ./insert_participants.py > participants.tex

WSSSPE4_review.pdf: *.tex *.bib participants.tex
	pdflatex -interaction nonstopmode WSSSPE4_review.tex
	bibtex WSSSPE4_review
	pdflatex -interaction nonstopmode WSSSPE4_review.tex
	pdflatex -interaction nonstopmode WSSSPE4_review.tex
	pdflatex -interaction nonstopmode WSSSPE4_review.tex

.PHONY: clean

clean:
	rm -f *.pdf *.log *.aux *.out *.bbl *.blg *.toc *.lof *.lot *.dvi *.ps participants.tex
