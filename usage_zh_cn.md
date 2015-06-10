#使用说明

# 使用说明 #

进入项目目录（项目目录位于zh\_CN目录下，里面包含有Makefile文件）

翻译po文件的大致流程:
```
make            初始化, 可经常运行(首次初始化完成后待翻译的po文件将位于po目录下)
make merge      合并自己翻译的po文件到项目主po文件
make docs       生成已翻译的中文文档(要检查自己的翻译，请先运行make merge)
make devhelp    使用devhelp查看生成的文档
make commit     提交自己的翻译结果到服务器(相当于svn ci/commit)
```

翻译sgml/xml文件的大致流程:
```
make            初始化, 可经常运行
make sgml       使用vim的对照方式来翻译文档，左侧为英文原文，右侧为中文
make docs       生成已翻译的中文文档
make devhelp    使用devhelp查看生成的文档
make commit     提交自己的翻译结果到服务器(相当于svn ci/commit)
```

# 命令参考： #
```
make               本地初始化(无副作用，可经常运行)
make init          同make
make help          显示命令帮助
make sgml          翻译sgml/xml文档
make docs          生成已翻译的中文文档(如果翻译了po文件，请先运行make merge)
make merge         将自己翻译的po文件与主版本合并
make commit        提交自己的翻译工作到服务器
make devhelp       将手册安装到用户目录，并调用devhelp来浏览(要检查自己的翻译，请先运行make docs)
make reviewsgml    检查所有的sgml/xml翻译情况(看起来没完，不推荐使用)
make clean         清除临时文件
make allclean      清除所有不需要的文件(请谨慎使用,可能会丢失未提交的po文件翻译)
```

# 项目联系方式 #

网上论坛：http://groups.google.com/group/gtk-doc-cn

邮件列表：[gtk-doc-cn@googlegroups.com](mailto:gtk-doc-cn@googlegroups.com)

要参与翻译或跟踪翻译进度，请加入邮件列表或在线浏览google网上论坛。

# 在线浏览地址 #

**gnome开发手册中文站 http://dev.osprg.org/docs** (链接已失效)

**目前已有的中文手册**

  * gdk-pixbuf: http://dev.osprg.org/docs/book.xul.php?book=gdk-pixbuf (链接已失效)
  * libgksu:  http://dev.osprg.org/docs/book.xul.php?book=libgksu (链接已失效)
  * glib: http://dev.osprg.org/docs/book.xul.php?book=glib (链接已失效)

# 如何开始 #

1. 首先你需要告知管理员加入项目组成员，从而获得svn的提交权限。

2. 然后使用以下命令取出代码：
```
svn checkout https://gtk-doc-cn.googlecode.com/svn/trunk/ gtk-doc-cn --username yourname
```
yourname应换成你自己的gmail帐户名(@之前的部分)

这个命令运行之后会要求输入密码，你的密码可以在这里找到并修改： http://code.google.com/hosting/settings

3. 进入项目目录，并初始化。
```
cd gtk-doc-cn/zh_CN/glib
make
```
首次初始化，会要求输入用户名：
```
  正在初始化, 请稍候... 
  ==> 说明：请在下面输入您的用户名,当前可供选择的用户名如下：
  NULL
  cnkilior
  kovchou
  lerosua
  wzssyqa
  yetist
  请输入:yetist
  您输入的用户名为==> yetist 
  以后可以通过修改 ~/.gtkdocpo 文件来改变。
  版本 163。
  ==> 正在下载源文件...
    -> 正在使用 tar 解压缩文件 /home/yetist/OSProjects/gadt/zh_CN/glib/tmp/glib-  2.20.4.tar.bz2
  >>> ./glib-2.20.4.po
  初始化成功, 要查看帮助请运行make help 
```
如果你被分配的任务中有po文件需要翻译，则会看到类似下面的输出：
```
  ==> 正在下载源文件...
    -> 正在使用 tar 解压缩文件 /home/yetist/OSProjects/gadt/zh_CN/glib/tmp/glib- 
2.20.4.tar.bz2
  ==> 正在初始化您的po文件...
    -> 正在调用google为您生成模糊翻译内容...
    -> 文件:gerror.po (0 条已翻译消息，32 条模糊消息.)
  >>> ./glib-2.20.4.po
  初始化成功, 要查看帮助请运行make help 
```
初始化成功之后，可参照sgml/xml或po文件的翻译流程开始翻译。