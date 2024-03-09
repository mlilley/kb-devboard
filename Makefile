.PHONY: git-install git-update ergogen-clean ergogen-build ergogen-open

all: install

clean: ergogen-clean

install: git-install ergogen-build

open: ergogen-open

git-install:
	git submodule update --init --recursive --remote

git-update:
	git submodule update --recursive --remote

ergogen-clean:
	rm -rf build/

ergogen-build: ergogen-clean
	mkdir build/
	cd ergogen; ergogen . -o ../build/

ergogen-open: ergogen-build
	open build/pcbs/tester.kicad_pcb
