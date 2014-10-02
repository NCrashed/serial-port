VERSION = 0.1.0
PACK = $(wildcard $(BIN)/$(NAME))

###

DEFAULT: build
DUB = dub
BIN = bin
DSCAN = ~/d/Dscanner/dscanner
CTAGS = ~/d/d2tags/d2tags

.PHONY: build force run clean style clobber test run tags pack packsrc

build:
	$(DUB) build -q

force:
	$(DUB) build --force

run:
	$(DUB) run

test: 
	$(DUB) test

packdir:
	@mkdir -p pkg

pack: $(PACK) | packdir
	tar -jcf pkg/$(BASE_NAME)-$(VERSION).tar.bz2 $^
	zip pkg/$(BASE_NAME)-$(VERSION).zip $^

packsrc: $(SRC) | packdir
	tar -jcf pkg/$(BASE_NAME)-$(VERSION)-SRC.tar.bz2 $^

tags: tags.json 
	$(CTAGS) $^ > tags

tags.json: $(SRC)
	$(DMD) $^ $(DFLAGS) $(INCLUDES) $(LDFLAGS) $(VERSION_FLAG) -Xf$@

tagsd: $(SRC)
	$(DSCAN) --ctags -R src > tags	 

style:
	$(DSCAN) --styleCheck -R src/

clean:
	-rm -f $(BIN)/*.o
	-rm -f $(BIN)/__*

clobber:
	-rm -f $(BIN)/*
