all: WSSSPE4_report.pdf

participants.tex: participants.txt insert_participants.py
	python ./insert_participants.py > participants.tex

program_committee.tex: program_committee.txt insert_program_committee.py
	python ./insert_program_committee.py > program_committee.tex

WSSSPE4_report.pdf: *.tex *.bib participants.tex program_committee.tex
	pdflatex -interaction nonstopmode WSSSPE4_report.tex
	bibtex WSSSPE4_report
	pdflatex -interaction nonstopmode WSSSPE4_report.tex
	pdflatex -interaction nonstopmode WSSSPE4_report.tex
	pdflatex -interaction nonstopmode WSSSPE4_report.tex

.PHONY: clean

clean:
	rm -f *.pdf *.log *.aux *.out *.bbl *.blg *.toc *.lof *.lot *.dvi *.ps participants.tex program_committee.tex
