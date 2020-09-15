# Latex generic makefile
# Copyright C.Langhans
# Email: chris@langhans-coding.de
#

# Main tex file
TARGET	= brief.tex

# Directories
BASEDIR = $(shell basename $(shell pwd))
OUT	= tmp
TEXDIR	= tex

# Binaries
CC		= pdflatex -file-line-error -halt-on-error --output-directory=$(OUT)
DOCKER  = docker run --rm -it -v `pwd`:/home danteev/texlive:202009150206298488ac
VIEW	= xdg-open
PDFTK	= pdftk

# misc
DATE	= $(shell date +'%Y-%m-%d')

# PHONY targets and dependecies
.PHONY: all
.PHONY: install
.PHONY: clean

# create output directory
$(OUT):
	mkdir -p $(OUT)

# generate pdf, put it in the OUT directory and display it
all: $(OUT)
	$(DOCKER) $(CC) "$(TEXDIR)/$(TARGET)"

# regenerate pdf and prepend current date
install: clean spell $(OUT)
	$(CC) $(TEXDIR)/$(TARGET)
	mv $(OUT)/$(TARGET).pdf brief-$(DATE).pdf

clean:
	rm ${TARGET}.log
	rm -rf $(OUT)
