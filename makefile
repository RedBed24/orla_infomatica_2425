DATE := $(shell LC_TIME="es_ES.UTF-8" date +%c)
FLAGS := --toc --metadata date="$(DATE)"
HTML_TEMPLATE := templates/default.html
CSS := templates/style.css

all: lint doc web

doc: readme.pdf
web: index.html

%.pdf: %.md
	pandoc $(FLAGS) --variable=colorlinks:True --shift-heading-level-by=-1 -o $@ $^

index.html: readme.md
	pandoc $(FLAGS) --template=$(HTML_TEMPLATE) --css=$(CSS) -o $@ $^

lint:
	npx markdownlint --disable MD013 -- readme.md

clean:
	rm *~ readme.pdf index.html

.PHONY: all doc web lint clean
