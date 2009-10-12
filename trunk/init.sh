#!/bin/sh

if [ `id -u` -eq 0 ];then
	cp tools/gtkdocpo /usr/bin/
	cp tools/gadt-mkhtml /usr/bin
	cp tools/autotrans /usr/bin
else
	[ -d $HOME/bin ] || mkdir $HOME/bin
	echo $PATH|grep "~/bin" || $( echo "export PATH=~/bin:$PATH" >> ~/.bashrc; source ~/.bashrc)
	cp tools/gtkdocpo ~/bin/
	cp tools/gadt-mkhtml ~/bin
	cp tools/autotrans ~/bin
fi
