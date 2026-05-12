MASTER := master lorenzo marco
TEX := $(addsuffix .tex, $(MASTER))
PDF := $(addsuffix .pdf, $(MASTER))

.PHONY: all clean delete all_clean

.DEFAULT_GOAL := all

all: $(PDF)

%.pdf: %.tex
	pdflatex -interaction=nonstopmode -halt-on-error -shell-escape $<
	pdflatex -interaction=nonstopmode -halt-on-error -shell-escape $<
	pdflatex -interaction=nonstopmode -halt-on-error -shell-escape $<

clean:
	rm -fr *.aux *.log *.out *.toc *.nav *.snm *.vrb *.fdb_latexmk _minted* *.fls *.synctex.gz *.minted

delete: clean
	rm -f $(PDF)

all_clean: delete all
