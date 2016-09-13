TTP					:= pdflatex
TTPFLAGS			:=

SOURCES 			:= $(shell find tex -type f -regex '.*\.tex')
SOURCES 			:= $(SOURCES:./%=%)
PDF 				:= $(SOURCES:tex/%.tex=pdf/%.pdf)
SHOULD_DEFINE		:= TTP TTPFLAGS
UNDEF_VARS			:= $(foreach var,$(SHOULD_DEFINE),$(if $(shell echo $(origin $(var)) | grep undefined),$(var),))

ifneq "$(strip $(UNDEF_VAR))" ""
$(error Define this variables in Makefile: $(UNDEF_VARS))
endif

TTPCOMPILE	:= $(strip $(TTP) $(TTPFLAGS))


print_vars:
	@echo PDF = $(PDF)
	@echo SOURCES  = $(SOURCES)
	@echo UNDEF_VARS = $(UNDEF_VARS)
	@echo TTPCOMPILE = $(TTPCOMPILE)

$(PDF:pdf/%.pdf=%):
	@mkdir -pv $(dir pdf/$@) 2>/dev/null
	@mkdir -pv $(dir out/$@) 2>/dev/null
	cd tex; $(TTPCOMPILE) -output-directory $(dir ../out/$@) $(@:%=%.tex)
	ln -f out/$@.pdf pdf/$@.pdf

clean:
	rm -rf out pdf

$(PDF:pdf/%.pdf=view-%):
	chromium $(@:view-%=pdf/%.pdf)

dist: clean
	tar -zcvf /tmp/$(PWD).tar.gz .
	cp /tmp/$(PWD).tar.gz .

.PHONY: clean print_vars dist
