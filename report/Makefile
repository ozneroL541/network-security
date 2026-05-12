TEX := master.tex
PDF := $(TEX:.tex=.pdf)

.PHONY: all clean delete all_clean

.DEFAULT_GOAL := all

all: $(PDF)

$(PDF): $(TEX)
	pdflatex -interaction=nonstopmode -halt-on-error -shell-escape $(TEX)
	pdflatex -interaction=nonstopmode -halt-on-error -shell-escape $(TEX)
	pdflatex -interaction=nonstopmode -halt-on-error -shell-escape $(TEX)

clean:
	rm -fr *.aux *.log *.out *.toc *.nav *.snm *.vrb *.fdb_latexmk _minted* *.fls *.synctex.gz

delete: clean
	rm -f $(PDF)

all_clean: delete all
