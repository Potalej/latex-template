FILE=main

.PHONY: clean fast clean

fast:
	pdflatex -interaction=nonstopmode -halt-on-error -shell-escape $(FILE).tex 
	pdflatex -interaction=nonstopmode -halt-on-error -shell-escape $(FILE).tex
	biber $(FILE)
	pdflatex -interaction=nonstopmode -halt-on-error -shell-escape $(FILE).tex
	pdflatex -interaction=nonstopmode -halt-on-error -shell-escape $(FILE).tex
	make clean
	
clean:
	rm -rf main-blx.bib
	rm -rf *.aux *.bbl *.toc *.out *.log *.nls *.nlo *.bcf *.xml \
               *.lof *.lot *.blg *.ilg *.synctex.gz
	rm -rf */*.aux */*.bbl */*.toc */*.out */*.log   \
               */*.nls */*.nlo */*.lof */*.lot */*.blg */*.ilg */*.synctex.gz
	rm -rf *~ */*~