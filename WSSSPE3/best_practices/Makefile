all: Best_Practices.pdf

Best_Practices.pdf: *.tex *.bib 
	pdflatex -interaction nonstopmode main.tex
	bibtex Best_Practices
	pdflatex -interaction nonstopmode main.tex
	pdflatex -interaction nonstopmode main.tex
	pdflatex -interaction nonstopmode main.tex

.PHONY: clean

clean:
	rm -f *.pdf *.log *.aux *.out *.bbl *.blg *.toc *.lof *.lot *.dvi *.ps 
