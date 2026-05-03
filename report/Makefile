TEX := master.tex
PDF := $(TEX:.tex=.pdf)

.PHONY: all clean

all: $(PDF)

$(PDF): $(TEX)
	pdflatex -interaction=nonstopmode -halt-on-error $(TEX)
	pdflatex -interaction=nonstopmode -halt-on-error $(TEX)
	pdflatex -interaction=nonstopmode -halt-on-error $(TEX)

clean:
	rm -rf *.aux *.log *.out *.toc *.nav *.snm *.vrb *.fdb_latexmk _minted* *.fls *.synctex.gz

delete: clean
	rm -f $(PDF)
