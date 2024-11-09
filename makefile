DATE := $(shell date +%c)
FLAGS := --toc --metadata date="$(DATE)"

all: doc web

doc: readme.pdf
web: index.html

%.pdf: %.md
	pandoc $(FLAGS) -o $@ $^

index.html: readme.md
	pandoc $(FLAGS) --standalone -o $@ $^

clean:
	rm *~ readme.pdf index.html

.PHONY: all doc web clean
