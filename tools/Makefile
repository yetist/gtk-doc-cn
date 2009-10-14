init:
	@(printf "\033[1;1m  正在初始化, 请稍候... \033[1;0m\n" >&2)
	@(cd ../../tools; ./gadt-init)
	@(cd ../..; svn update)
	@(gadt-mkhtml --nobuild --nosgml --nohtmlhelp)
	@(printf "\033[1;1m 初始化成功, 要查看帮助请运行make help \033[1;0m\n" >&2 )

sgml:
	gadt-mkhtml --editsgml

docs:
	gadt-mkhtml --log --browser

merge:
	gadt-mkhtml --mergepo

commit:
	@(if svn status |grep "^M";then \
		svn commit --editor-cmd=vim; \
	else \
		printf "\033[1;1m 目前没有可提交的内容，请尝试先运行make merge命令。\033[1;0m\n" >&2 ; \
	fi)

devhelp:
	gadt-mkhtml --install

reviewsgml:
	gadt-mkhtml --reviewsgml

clean:
	gadt-mkhtml --clean

allclean:
	rm -rf tmp *~ po

help:
	@(echo "命令帮助：")	
	@(echo -e "\tmake               本地初始化(无副作用，可经常运行)")
	@(echo -e "\tmake init          同make")
	@(echo -e "\tmake sgml          翻译sgml/xml文档")
	@(echo -e "\tmake docs          生成已翻译的中文文档(如果翻译了po文件，请先运行make merge)")
	@(echo -e "\tmake merge         将自己翻译的po文件与主版本合并")
	@(echo -e "\tmake commit        提交自己的翻译工作到服务器")
	@(echo -e "\tmake devhelp       将手册安装到用户目录，并调用devhelp来浏览(要查看自己的翻译，请先运行make docs)")
	@(echo -e "\tmake reviewsgml    检查所有的sgml/xml翻译情况(看起来没完，不推荐使用)")
	@(echo -e "\tmake clean         清除临时文件")
	@(echo -e "\tmake allclean      清除所有不需要的文件(请谨慎使用,可能会丢失未提交的po文件翻译)")

release:
	@(source ./build.rc; \
	if [ -f tmp/$$modname-$$pkgver.tgz ]; then \
		scp tmp/$$modname-$$pkgver.tgz dev.osprg.org:public_html/docs; \
	else \
		printf "\033[1;1m htmlhelp文件还没有生成。\033[1;0m\n" >&2 ; \
	fi)

.PHONY: sgml docs merge commit devhelp reviewsgml clean allclean release
