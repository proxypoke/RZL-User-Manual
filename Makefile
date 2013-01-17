A2X=a2x --doctype=manpage --format=manpage -D man/

.PHONY: all
all:
	[[ -d man ]] || mkdir man
	${A2X} src/*.txt

.PHONY: clean
clean:
	rm -f man/*
	rm -f *.tar.gz

.PHONY: dist
dist:
	make all
	gzip -fq man/*.7
	[[ -f RZL_User_Manual.tar.gz ]] || tar cfz RZL_User_Manual.tar.gz man
