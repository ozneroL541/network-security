TEX := master.tex
PDF := $(TEX:.tex=.pdf)

.PHONY: all clean

all: $(PDF)

$(PDF): $(TEX)
	pdflatex -interaction=nonstopmode -halt-on-error $(TEX)
	pdflatex -interaction=nonstopmode -halt-on-error $(TEX)
	pdflatex -interaction=nonstopmode -halt-on-error $(TEX)

clean:
	rm -f *.aux *.log *.out *.toc *.nav *.snm *.vrb

delete: clean
	rm -f $(PDF)
