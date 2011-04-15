PATH := ${HOME}/bin:${PATH}

init:
	@(printf "\033[1;1m正在初始化, 请稍候... \033[1;0m\n" >&2)
	@(../../tools/gadt-init)
	@(cd ../..; svn update)
	@(gadt-mkhtml --nobuild --nohtmlhelp)
	@(printf "\033[1;1m初始化成功, 要查看帮助请运行make help \033[1;0m\n" >&2 )

sgml:
	@gadt-mkhtml --editsgml

docs:
	@gadt-mkhtml --log --browser

merge:
	@gadt-mkhtml --mergepo --mergexml

commit:
	@(if svn status |grep "^M";then \
		svn commit --editor-cmd=vim; \
	else \
		printf "\033[1;1m目前没有可提交的内容，如果翻译了po文件，请先运行make merge命令。\033[1;0m\n" >&2 ; \
	fi)

devhelp:
	@gadt-mkhtml --install

reviewsgml:
	@gadt-mkhtml --reviewsgml

clean:
	@gadt-mkhtml --clean

allclean:
	@rm -rf tmp *~ po

help:
	@(echo "命令帮助：")	
	@(echo -e "\tmake               本地初始化(无副作用，可经常运行)")
	@(echo -e "\tmake init          同make")
	@(echo -e "\tmake help          显示此命令帮助信息")
	@(echo -e "\tmake sgml          翻译sgml/xml文档")
	@(echo -e "\tmake merge         将自己翻译的po文件与主版本po文件合并")
	@(echo -e "\tmake docs          生成已翻译的中文文档(如果翻译了po文件，请先运行make merge)")
	@(echo -e "\tmake devhelp       将手册安装到用户目录，并调用devhelp来浏览(要查看自己的翻译，请先运行make docs)")
	@(echo -e "\tmake commit        提交自己的翻译工作到服务器")
	@(echo -e "\tmake reviewsgml    检查所有的sgml/xml翻译情况(看起来没完，不推荐使用)")
	@(echo -e "\tmake clean         清除临时文件")
	@(echo -e "\tmake allclean      清除所有不需要的文件(请谨慎使用,可能会丢失未提交的po文件翻译)")
	@(echo -e "\t如果分配了po翻译任务，po文件将位于当前的po目录下。\n")
	@(echo -e "\n翻译po文件的大致流程:")
	@(echo -e "\tmake            初始化, 可经常运行(首次初始化完成后待翻译的po文件将位于po目录下)")
	@(echo -e "\tmake merge      合并自己翻译的po文件到项目主po文件")
	@(echo -e "\tmake docs       生成已翻译的中文文档(要检查自己的翻译，请先运行make merge)")
	@(echo -e "\tmake devhelp    使用devhelp查看生成的文档")
	@(echo -e "\tmake commit     提交自己的翻译结果到服务器(相当于svn ci/commit)")
	@(echo -e "\n翻译sgml/xml文件的大致流程:")
	@(echo -e "\tmake            初始化, 可经常运行")
	@(echo -e "\tmake sgml       使用vim的对照方式来翻译文档，左侧为英文原文，右侧为中文")
	@(echo -e "\tmake docs       生成已翻译的中文文档")
	@(echo -e "\tmake devhelp    使用devhelp查看生成的文档")
	@(echo -e "\tmake commit     提交自己的翻译结果到服务器(相当于svn ci/commit)")

synchtml:
	@(source ./build.rc; make_release;)

release: tarball
	tarfile=tmp/*-docs.tar.gz; \
	  bname=`basename $$tarfile`; \
	  googlecode-upload.py -s $$bname -p gtk-doc-cn -u yetist@gmail.com -l Featured,Type-Source,OpSys-Linux $$tarfile

tarball:
	@gadt-mkhtml --tarball

#	@(source ./build.rc; \
#	if [ -f tmp/$$modname-$$pkgver.tgz ]; then \
#		scp tmp/$$modname-$$pkgver.tgz dev.osprg.org:public_html/docs; \
#	else \
#		printf "\033[1;1mhtmlhelp文件还没有生成。\033[1;0m\n" >&2 ; \
#	fi)

.PHONY: init sgml docs merge commit devhelp reviewsgml clean allclean release synchtml tarball
