#使用说明，在工程根目录下使用，自动检索文件，并且用cscope生成对应数据库
#!/bin/sh  
PRO_PATH=$(pwd)
find ${PRO_PATH} -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.java" > cscope.files  
        cscope -bkq -i cscope.files  
        ctags -R 
