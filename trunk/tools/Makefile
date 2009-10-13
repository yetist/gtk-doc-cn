init:
	@(echo "正在初始化, 请稍候...")
	@(cd ../../tools; ./gadt-init)
	@(cd ../..; svn update)
	@(gadt-mkhtml --nobuild --nosgml --nohtmlhelp)
	@(echo -e "初始化成功, 要查看帮助请运行\nmake help\n")

sgml:
	gadt-mkhtml --editsgml

docs:
	gadt-mkhtml --log

merge:
	gadt-mkhtml --mergepo

commit:
	@(svn commit)

devhelp:
	gadt-mkhtml --install

reviewsgml:
	gadt-mkhtml --reviewsgml

clean:
	gadt-mkhtml --clean

allclean:
	rm -rf tmp *~ html *.tgz

help:
	@(echo "帮助：")	
	@(echo -e "\tmake sgml          翻译sgml/xml文档")
	@(echo -e "\tmake docs          生成已翻译的中文文档(要检查自己的翻译，请先运行make merge)")
	@(echo -e "\tmake merge         将自己翻译的po文件与主版本合并")
	@(echo -e "\tmake commit        提交自己的翻译工作到服务器")
	@(echo -e "\tmake devhelp       将手册安装到用户目录，并调用devhelp来浏览")
	@(echo -e "\tmake reviewsgml    检查所有的sgml/xml翻译情况(不推荐使用)")
	@(echo -e "\tmake clean         清除临时文件")
	@(echo -e "\tmake allclean      清除所有不需要的文件(请小心使用)")

release:
	@(scp *.tgz dev.osprg.org:public_html/docs)

.PHONY: sgml docs merge commit devhelp reviewsgml clean allclean release
