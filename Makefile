figs:
	for img in pics/*.eps; do\
		cat "$$img" | epstopdf --filter | pdfcrop - "$${img%.eps}.pdf";\
	done;

report:
	latexmk

partOne:
	libreoffice --invisible --convert-to pdf partOne.docx

final: figs partOne report
	gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sOutputFile=final.pdf partOne.pdf report.pdf

