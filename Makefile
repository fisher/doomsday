# supress lazy evaluation (needed to use it as a dependency for 'all')
OUTFILES != echo `for i in src/*.f; do echo bin/$$(basename $$i .f); done`

# well actually in OpenBSD there is no 'f77' symlink by default
COMPILER := gfortran

OPTS := -time -x f77

.PHONY: clean
.SUFFIXES: .f

all: bin $(OUTFILES)

bin:
	mkdir -p bin

# bsd make complains about $< being GNUism here
$(OUTFILES):
	$(COMPILER) -o $@ $(OPTS) src/`basename $@`.f

clean:
	rm -f *.o a.out
	rm -f $(OUTFILES)
