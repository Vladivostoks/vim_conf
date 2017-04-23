对于一个工程来说，使用之前要在工程根目录用到cscope创建工程数据库以及使用ctag来创建标签库，并且工程数据库在vi打开之后需要添加进去,现在直接在工程目录用脚本创建即可
然后在工程根目录里 用vi  .的方式访问整个工程

Vim配置文件说明
常用函数跳转
Ctrl+i 前进
Ctrl+o 后退
cscope 
	cscope -Rbkq
	cscope -Rbq -f path/xxx.out    cs add path/xxx.out  
	0或者s   —— 查找这个C符号
	                            1或者g  —— 查找这个定义 等于ctag快捷键
	                            2或者d  —— 查找被这个函数调用的函数（们）
	                            3或者c  —— 查找调用这个函数的函数（们）
	                            4或者t   —— 查找这个字符串
	                            6或者e  —— 查找这个egrep匹配模式
	                            7或者f   —— 查找这个文件
	                            8或者i   —— 查找#include这个文件的文件（们）
	Ctrl+[
	Ctrl+[ ctrl+[
	Ctrl+\
Ctag
	Ctrl+] 来进行跳转
	Ctrl+t 返回
	
tag标签 F8打开
o 在一个新打开的窗口中显示光标下tag
显示光标下tag的原型定义
u 更新taglist窗口中的tag
s 更改排序方式，在按名字排序和按出现顺序排序间切换
x taglist窗口放大和缩小，方便查看较长的tag
	• 打开一个折叠，同zo
	• 将tag折叠起来，同zc
	• 打开所有的折叠，同zR= 将所有tag折叠起来，同zM[[ 跳到前一个文件]] 跳到后一个文件q 关闭taglist窗口
	
目录标签 F9打开
t标签打开
	回车直接打开
	
	
撤销分支打打开 ,.
文件快速索引 ctrl+p
	切换路径 ：ctrlp + path
	T 标签打开
高亮
	F2
标记
	输入模式下 mk 出todo
	Tl 打开标记栏
Youcompleteme 补全配置
	补全开关F7
	静态检查 F6 ctrl ww 关闭
	F5 手动检查
Tab 标签切换F3

通用快捷键
Ctrl+t 标签页打开,或者t
Ctrl+w 同页下不同栏光标切换
简单查找 ／+字符串
二进制转换
：%！Xxd 转换成二进制	映射ba
：%！Xxd -r 转换回二进制映射	ab

