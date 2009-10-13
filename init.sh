#!/bin/sh

if [ ! -f ~/.gtkdocpo ];then
    printf "\033[1;31m==> "说明："\033[1;0m\033[1;1m  请在下面输入您的googlecode用户名：\033[1;0m\n" >&2;
    read username
    echo "username=$username" > ~/.gtkdocpo
fi

if [ `id -u` -eq 0 ];then
	cp tools/gtkdocpo /usr/bin/
	cp tools/gadt-mkhtml /usr/bin
	cp tools/gadt-autotrans /usr/bin
else
	[ -d $HOME/bin ] || mkdir $HOME/bin
	echo $PATH|grep "~/bin" || $( echo "export PATH=~/bin:$PATH" >> ~/.bashrc; source ~/.bashrc)
	cp tools/gtkdocpo ~/bin/
	cp tools/gadt-mkhtml ~/bin
	cp tools/gadt-autotrans ~/bin
fi
