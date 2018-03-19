# Linux
---

+ debian/ubuntu
+ redhat/fedora/centos

+ uname -a 查看系统的版本

+ 包管理
	+ apt, yum/dnf, yast, pacman, port,...

---
+ ls = list
	+ ls -a (display all files)
	+ ls -l (more infomation)
	+ ls -lh (file size k)
	+ ls -lsrt ()

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
+ iostat
+ ip addr show
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
	+ -L ps -L pid , 查特定进程pid的线程
	+ -C ps -C java, 通过进程名查找进程
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
+ lsof
	+ lsof -p pid 进程打开的文件
	+ lsof -i:8080 打开某端口的进程
+ kill 发信号给进程
	+ kill -9 pid 	强制杀死进程
	+ kill -l  中断 正常退出 暂停 继续
+ crontab 定时任务
	+ crontab	-e file
+ rsync 文件同步
+ iostat
+ vmstat
+ atnodes 集群上运行
+ tonodes 上传到集群
