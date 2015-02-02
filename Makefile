A2X=a2x --doctype=manpage --format=manpage -D man/

.PHONY: all

all:
	$(shell find src -type f -name "*.txt" -exec ${A2X} \{\} \;)


.PHONY: clean
clean:
	rm -f man/*
	rm -f *.tar.gz

.PHONY: dist
dist:
	make all
	gzip -fq man/*.7
	[[ -f RZL_User_Manual.tar.gz ]] || tar cfz RZL_User_Manual.tar.gz man
