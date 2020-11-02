.PHONY: FORCE_MAKE

all: cv-shpark.pdf

#pdf:   clean $(PDFS)
#html:  clean $(HTML)

%.pdf: %.tex FORCE_MAKE
	latexmk -dvi- -pdf $*

%.md: %.yaml
# Pandoc can't actually read YAML, just YAML blocks in
# Markdown. So I give it a document that's just a YAML block,
# while still editing a straight YAML file which has a bunch of advantages.
	cat $< > $@

%.tex: template-%.tex %.md
# Pandoc does the initial compilation to tex; we then latex handle the
# actual bibliography and pdf creation.
	pandoc --template=$< -t latex cv-shpark.md -o $@
# Citekeys get screwed up by pandoc which escapes the underscores.
# Years should have en-dashes, which damned if I'm going to do it
# on my own.
	perl -pi -e 'if ($$_=~/cite\{/) {s/\\_/_/g}; s/(\d{4})-(\.|[Pp]resent|\d{4})/$$1--$$2/g' $@;

%-scholar.tex: FORCE_MAKE
	rm -f $@
	for cids in `grep 'scholar =' zach.bib|sed 's/^[^0-9]*//;s/[^0-9]*$$//'` ; do \
#	 	sleep 8m ;\
		cidss=`echo $$cids | sed 's/,/ /g'` ;\
		cites=`./citecount $$cidss` ;\
		echo "$$cites citations for $$cidss" ;\
		if [ "$$cites" -gt "0" ] ; then \
			echo "\defscholar{$$cids}{$$cites}" >> $@ ;\
		fi ;\
	done
%.md: template-%.md yaml-cv.md zach.bib publication-list.csl
	sed 's/-[0-9][0-9]-[0-9][0-9]//g;s/\\\\emph{\([^}]*\)}/_\1_/g;' yaml-cv.md | pandoc --template=$< -t markdown | pandoc --filter pandoc-citeproc --bibliography=zach.bib -t markdown > $@

%.html: %.md
	pandoc -f markdown -t html $< > $@

clean:
	rm -f *.aux *.bcf *.log *.out *.run.xml *.pdf *.bbl *.blg *yaml-cv.md

