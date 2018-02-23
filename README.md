# Linux
---

+ debian/ubuntu
+ redhat/fedora/centos

+ 包管理
	+ apt, yum/dnf, yast, pacman, port,...

---
+ ls = list
	+ ls -a (display all files)
	+ ls -l (more infomation)
	+ ls -lh (file size k)
	+ ls -lsrt ()

---
+ ln = link
	+ 硬链接 软链接
	+ ln -s
	+ ln -f

---
+ du = disk usage
+ df = disk free

---
+ find
	+ find . -name "xx.xml"
	+ find /home/q/logs/ -mtime -type f | xargs ls -lh
+ whereis
	+ whereis ls
+ which ls

---
权限管理

+ 文件特殊权限
	+ suid
	+ sgid
	+ sticky

+ 用户权限-文件
	+ chown = change owner
	+ chgrp = change group
	+ chmod = change mode

---

+ cat
+ head
+ tail
	+ tail -f xx.log | grep hello
+ more
+ less

+ grep
	+ -i 匹配时忽略大小写
	+ -v
	+ -E
	+ --color
+ atnodes
	+ atnode 'grep 'xx' /home/g/www/a.log' a-b[1-8].c.d

+ sort
	+ -k  (the colume sort)
	+ -n
	+ -r (reverse)
+ uniq = unique
	+ uniq -c  (相同行爱在一起)
+ wc = word count
	+ wc -c
	+ wc -l 	
+ awk
	+
+ sed

+ vim

+ tar

---
http请求与传送

+ curl
	+ X 指定request的method，如get，post
	+ H 指定请求的header
	+ d 消息体
	+ b 指定请求的cookie
	+ c set-cookie
	+ i reponse header
	+ w	 format output
+ wget 下载文件

---
网络常用工具命令

+ ping
+ host
+ nc 网络发包工具
	+ nc -t www.baidu.com 80
	+ telnet
+ netstat
	+ netstat -an
+ tcpdump
	+ ..

---
远程命令

+ ssh
+ scp

---
进程与系统

+ ps
	+ -e 显示所有进程
	+ -f 全格式
	+ -l 长格式
	+ -a 显示终端上的所有进程
	+ -r 显示正在运行的进程
	+ -u 以用户为主的格式显示
	+ -x 显示所有程序，不区分终端
	+ ps -ef
		+ UID PID PPID C(cpu) STIME TTY TIME(占用cpu的时间) CMD
	+ ps -lf pid  （显示线程）
+ free 查看内存使用情况
	+ free -m (以mb为单位显示)
	+ free -h ()
+ kill 发信号给进程
	+ kill -9 pid 	强制杀死进程
	+ kill -l  中断 正常退出 暂停 继续

---
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
+ xargs

+ crontab 定时任务
	+ crontab	-e file
+ rsync 文件同步
+ iostat
+ vmstat
+ atnodes 集群上运行
+ tonodes 上传到集群
