TARGET=paper
all: pdf

pdf:
	GS_OPTIONS=-dPDFSETTINGS=/prepress rubber -f --pdf -Wrefs -Wmisc $(TARGET)

clean:
	rm -f *.aux *.log *.out *.bbl *.blg *.brf *~ *.bak $(TARGET).pdf $(TARGET).ps $(TARGET).toc $(TARGET).lot $(TARGET).lof $(TARGET).idx $(TARGET).ilg $(TARGET).ind

cleanall: clean
	rm -f $(TARGET).pdf

ps: pdf
	GS_OPTIONS=-dPDFSETTINGS=/prepress pdftops -level1 $(TARGET).pdf

embed: paper.pdf
	gs -o paper-embedded.pdf -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress paper.pdf
	@echo "\nWrote paper with embedded fonts to: paper-embedded.pdf\n"
