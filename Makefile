TYPESCRIPT=node_modules/typescript
TSC=node $(TYPESCRIPT)/bin/tsc.js
TYPESCRIPT_LIB=$(TYPESCRIPT)/bin/
TEST_SCRIPTS=tests/*.script
TEST_SOURCES=tests/*.ts
VERSION=$(shell git describe --tags)

build: bin/tss.js bin/lib.d.ts tests/script.diff package.json tests/script.results

bin/tss.js: tss.ts harness.ts $(TYPESCRIPT)/bin/typescript.d.ts $(TYPESCRIPT)/bin/typescript_internal.d.ts
	$(TSC) tss.ts -target ES5 -m commonjs --noEmitOnError -outDir bin 2>&1 | tee build.log
	test ! -s build.log

bin/lib.d.ts: $(TYPESCRIPT)/bin/lib.d.ts
	cp $(TYPESCRIPT)/bin/lib.d.ts bin/lib.d.ts

tests/script.out2: $(TEST_SCRIPTS) $(TEST_SOURCES) tests/tsconfig.json tests/script.js tests/script.out bin/tss.js bin/lib.d.ts
	cd tests;\
	node script.js >script.out2;

tests/script.diff: tests/script.out tests/script.out2
	cd tests;\
	diff --strip-trailing-cr script.out* 2>&1 | tee script.diff

tests/script.results: tests/script.diff
	grep '^[0-9]' tests/script.diff  >script.results;\
	grep -n '//.*script' tests/script.out >>script.results;\
	sort -n script.results

package.json: .git/refs/heads/master
	node -e "var pj=require('./package.json'); \
					 pj.version='$(VERSION)';\
					 require('fs').writeFileSync('package.json',JSON.stringify(pj,null,'  '));"

eols:
	find . -wholename './.git' -prune -o -wholename './node_modules' -prune -o -exec file \{\} \; | grep CRLF
