shell script

执行shell脚本的3个方法
1 ./a.sh 2 绝对路径/test/a.sh 3 bash a.sh

set列出所有的变量
unset 变量，删除变量


+ 单引号，双引号，反引号区别
	+ 单引号之间的内容原封不动的输出
	+ 双引号取消空格的作用， 特殊符号含义会保留
	+ 反引号，用来包装命令的结果，多用$()
```
	将一个命令的执行结果赋给变量
	A=`date` 将date的执行结果赋值给变量A
	B=$(ls -l) 将ls -l这个命令给变量B
```
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
冥想五分钟可以作出正确确定

+ ps 查看进程，查看指定进程的线程
+ top load，memory, cpu使用率，kill 强制杀死top的进程

+ 查看服务器正在使用的网络端口，一共有哪些状态，代表什么意思

---
+ curl指定header的参数是什么

1 文件检测和目录创建
如果某路径不存在，创建目录；else，输出其是目录还是文件

2 文本行统计

	+ 传递两个文本文件给脚本
	+ 输出空行数较多的文件名以及其空行的个数
	+ 输出总行数较多的文件以及其总行数

3 将指定目录下大于10k的文件转移到／tmp下， find

4 定时任务
	+ crontab
	+ 实现周一到周五，从早上10点到晚上7点，每个2小时提示休息
	+ ubuntu可以使用notify-send发送通知消息


5 分析网站日志，找出所有在一分钟请求次数超过60次的ip

awk '{split($4, a, ":"); print $1, a[2]":"a[3]}' sample_access.log | sort | uniq -c | awk '{if($1>60) print $2}' | uniq

---
awk删除重复行

---
查询日志中访问次数最多的10个IP
cat access.log|cut -d ' ' -f 1|sort|uniq -c|sort -nr|awk '{print $0}'|head -n 10|less

cat access.log|awk '{print $0}'|sort|uniq -c|sort -nr|head -n 10

一天中某个ip访问了哪些页面
grep 'xx.xx.xx.xx' access.log|awk '{print $1,$7}'|sort|uniq -c

一天中某个页面被访问了多少次
grep '/xx.html' access.log|wc -l

有多少ip访问了服务
	awk '{print $1}'|sort|uniq -c|wc -l

查询日志中出现100次以上的IP
cat access.log|cut -d ' ' -f 1|sort|uniq -c|sort -nr|awk '{if ($1>100) print $0}'|sort -nr|less

---
