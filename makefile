DATE := $(shell LC_TIME="es_ES.UTF-8" date +%c)
FLAGS := --toc --metadata date="$(DATE)"

all: lint doc web

doc: readme.pdf
web: index.html

%.pdf: %.md
	pandoc $(FLAGS) -o $@ $^

index.html: readme.md
	pandoc $(FLAGS) --standalone -o $@ $^

lint:
	npx markdownlint --disable MD013 -- readme.md

clean:
	rm *~ readme.pdf index.html

.PHONY: all doc web lint clean
