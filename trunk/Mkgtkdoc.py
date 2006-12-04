#!/usr/bin/env python
#-*- encoding:utf-8 -*-
# Filename: mkgtkdoc.py
# Author(s): yetist
# Description:_______
# Version: 0.1

import os
import common

class MakeHtml:
    def __init__(self):
        cwd=os.getcwd()
        for dir in os.listdir(cwd):
            if os.path.isdir(dir):
                newdir=os.path.join(dir,"html")
                lodir=os.path.join(cwd,newdir)
                self.process(lodir)
                os.chdir(cwd)

    def process(self,dir):
        os.chdir(dir)
        dirlst=dir.split("/")
        modlst=dirlst[-2].split("-")

        module="-".join(modlst[0:-1])
        if len(modlst) > 2:
            file = module+".sgml"
        else:
            file = module+"-docs.sgml"

        prompt="\aMaking gtkdoc for %s (Y/N):" % module
        val=common.timeout_input(prompt,5)
        if val.startswith("N") or val.startswith("n"):
            return
        os.system("gtkdoc-mkhtml %s ../%s" % (module, file))

if __name__=="__main__":
    a=MakeHtml()
