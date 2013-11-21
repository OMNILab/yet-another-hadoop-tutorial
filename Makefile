SRC = $(wildcard *.mkd)
SRC_NAME = $(SRC:%.mkd=)
OUT_PDF = $(SRC:%.mkd=%.pdf) 
OUT_WIKI = $(SRC:%.mkd=%.wiki) 

# Document Class
DOCCLASS := hpcmanual
# LATEX_OPT = -xelatex -silent -f
LATEX_OPT = -gg -xelatex -f
PANDOC_DIR := pandoc
PANDOC_TEX := -f markdown -t latex --template=$(DOCCLASS).latex --toc --listings --smart --standalone
PANDOC_WIKI := -f markdown -t mediawiki --smart --standalone
REPOURL = https://raw.github.com/weijianwen/hpc-manual-class/master/pandoc
# pdf viewer: evince/open
VIEWER = open

.PHONY : all clean distclean release
.PRECIOUS : %.tex

all: $(OUT_PDF) $(OUT_WIKI)

%.pdf : %.tex $(DOCCLASS).cls $(DOCCLASS).cfg Makefile
	-@latexmk $(LATEX_OPT) $*

%.wiki : %.mkd Makefile
	@pandoc $(PANDOC_WIKI) $*.mkd -o $@

%.tex : $(DOCCLASS).latex %.mkd Makefile
	@pandoc $(PANDOC_TEX) $*.mkd -o $@

$(DOCCLASS).% :
	cp pandoc/$@ ./

clean :
	-@rm *.tex *.toc *.aux *.fls *.fdb_latexmk *.out *.cfg *.cls *.latex *.log

update :
	@wget -q $(REPOURL)/$(DOCCLASS).cls -O pandoc/$(DOCCLASS).cls
	@wget -q $(REPOURL)/$(DOCCLASS).cfg -O pandoc/$(DOCCLASS).cfg
	@wget -q $(REPOURL)/$(DOCCLASS).latex -O pandoc/$(DOCCLASS).latex

distclean : clean
	-@rm $(OUT_WIKI) $(OUT_PDF)

release :
	git push gitlab
	git push github
