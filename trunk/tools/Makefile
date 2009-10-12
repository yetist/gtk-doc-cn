all: check
	gadt-mkhtml -L

sgml: check
	gadt-mkhtml -t

clean: check
	gadt-mkhtml -c

allclean:
	rm -rf tmp *log* *~ html *.tgz

check: 
	@(if which gadt-mkhtml >/dev/null 2>&1; then \
		echo "";\
	else	\
		printf "\033[1;31m==> "ERROR:"\033[1;0m\033[1;1m  Please run init.sh in the topdir first!!!\033[1;0m\n" >&2; \
	fi)

release:
	@(scp *.tgz dev.osprg.org:public_html/docs)

install:
	gadt-mkhtml -i

.PHONY: check all allclean clean sgml release install
