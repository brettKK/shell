shell script
执行shell脚本的3个方法
1 ./a.sh 2 绝对路径/test/a.sh 3 bash a.sh

将一个命令的执行结果赋给变量
A=`date` 将date的执行结果赋值给变量A
B=$(ls -l) 将ls -l这个命令给变量B

set列出所有的变量
unset 变量，删除变量


单引号，双引号区别
+ 单引号之间的内容原封不动的输出
+ 双引号取消空格的作用， 特殊符号含义会保留


+ shell 数组
	+ 定义数组	array_name=(v0 v1 v2 v3)
	+ 读取数组 value1=${array_name[1]}
	+ 获取所有元素	@，*
	+ 获取数组长度 echo ${#array_name[ * ]}

+ shell 传递参数
	+ $n 位置变量
		+ n为一个数字，0为执行的文件，1位第一个参数，类推
	+ 特殊字符
		+ $# 传递到脚本的参数个数
		+ $* 以字符串的显示参数 “$1..$n”
		+ $@ 与$* 类似 加引号
		+ $$ 这个程序的pid
		+ $! 执行上一个后台程序的pid
		+ $? 执行上一个指令的返回值

```
#!/bin/bash
echo "$* 程序的所有参数"
echo "$# 程序的参数个数"
touch /tmp/a.txt
echo "$$ 这个程序的pid"

touch /tmp/b.txt &
echo "$! 执行上一个后台指令的pid"
echo "$$ 程序的pid"
```

```
#从控制台读数据,交互
read first second third
echo "first:$first"
echo "second:$second"
echo "third:$third"
```
expr 命令 运算
 expr 1 + 2

```
#！/bin/bash
if [ -x /etc/passwd ] ; then
	/bin/ls
else
	pwd
fi
```
xargs，有一些命令不支持管道 | 传递参数， 所以会使用xargs， 一个命令的输出作为另一个命令的输入

```
find -name '*.c' | xargs rm
```
