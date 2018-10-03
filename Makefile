SRC_DIR=./src
MAIN=main
MAIN_TEX=$(MAIN).tex
MAIN_PDF=$(MAIN).pdf
FINAL_PDF=./final/s3273631_Waters_M_Thesis.pdf
BIB_FILE=bibliography.bib
TEMP_DIR=./tmp

LOG=$(TEMP_DIR)/output.log

LATEX=pdflatex
BIBTEX=bibtex

MSG=latest

.PHONY: help clean _copy _latex pdf _bibtex all sub push
.DEFAULT_GOAL := help

help: ## Print this help message
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

clean:
	-rm -r $(TEMP_DIR)
	mkdir $(TEMP_DIR)
	-rm $(MAIN_PDF)

_copy:
	cp $(TEMP_DIR)/$(MAIN_PDF) ./$(MAIN_PDF)

_latex:
	cd $(SRC_DIR) && $(LATEX) -halt-on-error -output-directory=../$(TEMP_DIR) $(MAIN_TEX)

pdf: _latex _copy ## Compile to PDF with current bibliography and references
	grep -i 'Warning' ./tmp/main.log 

_bibtex:
	cp $(SRC_DIR)/$(BIB_FILE) $(TEMP_DIR)
	cd $(TEMP_DIR) && $(BIBTEX) $(MAIN)
	cp $(TEMP_DIR)/$(MAIN_PDF) ./$(MAIN_PDF)

all: clean ## Rebuild bibliography and references then compile to PDF
	make _latex
	make _bibtex
	make _latex
	make pdf
	
final: all ## Build final PDF
	-mkdir ./final
	cp ./$(MAIN_PDF) '$(FINAL_PDF)'

push: ## Commit and push all changes with default message
	git status
	@echo "Commit with message '$(MSG)'? [y/n]" && read ans && [ $${ans:-N} = y ]
	git add .
	git commit -m "$(MSG)"
	git push