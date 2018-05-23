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
	+ 以文件名查找 find . -name "xx.txt"
	+ 以文件从属关系查找 find . -user brett
	+ 以文件类型查找 find . -type f(普通文件，d目录文件，p管道文件)
	+ 以文件大小查找 find . -size -1M(小于1M的文件，+1M大于1M的文件)
	+ 以时间查找
		+ -atime 文件访问时间，天为单位
		+ -mtime 文件数据修改时间
		+ -ctime 文件元数据修改时间
	+ 指定查找深度	-maxdepth, -mindepth
	+ find与xargs结合
		+ find . -name "a.txt" | grep 'key'
		+ find . -name "a.txt" | xargs grep 'key'
		+ find . -name "a.txt" | xargs rm
	+ find -exec 与其他命令结合使用
		+ find . -name "a.txt" -exec rm {} \;
---
管道与xargs
+ 管道：将前面的标准输出作为后面的标准输入 echo "--help" | cat
+ xargs：将前面的标准输入作为后面命令的参数 echo "--help" | xargs cat

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
	+ tail -n 10 a.txt
	+ tail -f xx.log | grep hello
+ 利用head和tail查看文件中3000-5000的行
	+ cat a.txt | head -n 5000 | tail -n 2000
	+ cat a.txt | tail -n + 3000 | head -n 2000
+ sed也可以查看文件中特定的行
	+ sed -n "3000,5000p" a.txt
+ more , less(更新一点)，功能上没看到区别

+ grep -i 匹配时忽略大小写, --color
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
---
+ awk

+ sed

+ vim


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
