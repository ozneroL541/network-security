TEX := master.tex
PDF := $(TEX:.tex=.pdf)

.PHONY: all clean delete all_clean

.DEFAULT_GOAL := all

all: $(PDF)

$(PDF): $(TEX)
	pdflatex -interaction=nonstopmode -halt-on-error $(TEX)
	pdflatex -interaction=nonstopmode -halt-on-error $(TEX)

clean:
	rm -fr *.aux *.log *.out *.toc *.nav *.snm *.vrb *.fdb_latexmk *.fls *.synctex.gz */*.aux

delete: clean
	rm $(PDF)

all_clean: delete all
