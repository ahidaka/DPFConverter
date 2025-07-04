#!/bin/bash
for file in `echo */*.cpp` ; do dir=`dirname ${file}` ; name=`basename ${file}`; echo ${file} ${dir} ${name} ; ${HOME}/sedx.sh ${dir} ${name} ; done

