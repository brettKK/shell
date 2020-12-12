# Linux
 debian/ubuntu
+ redhat/fedora/centos
+ uname -a 查看系统的版本

各种源码协议
+ 必须开源： LGPL Mozilla  GPL（不允许将 GPL 代码用于商业产品）
+ 可以闭源： BSD MIT Apache（宽松）
---
+ ls = list
	+ ls -a (display all files)
	+ ls -l (more infomation)
	+ ls -lh (file size k)

---
磁盘相关的命令
+ du 显示某个目录或者文件占用的磁盘空间
+ df 显示整个磁盘的使用情况

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
有显示功能的命令
+ cat
+ cut 按列分文件
+ head -n 5 a.txt
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
+ sort
	+ -k  (按某一个列排序)
	+ -n （按数值降序排序， 不加-n可以出现10小于2的情况）
	+ -nr （按数字逆序排序）
	+ 文件A， B 差集（A - B） sort a.csv b.csv|uniq -u > c.csv
+ uniq = unique
	+ uniq -c  (相同行爱在一起 所以前面是sort命令)
+ wc = word count
	+ wc -c
	+ wc -l 	
---
+ awk， sed见文件夹shellscript
---
网络常用工具命令（文件夹network）
+ host
+ nc 网络发包工具
	+ telnet
+ netstat
	+ netstat -an
+ tcpdump
	+ ..

+ 二叉树两个节点之间的距离

+ 读文件时系统和硬盘的过程

+ tcp 如何做错误处理

---
进程与系统，见文件夹operating-system
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
+ 查某个进程打开的端口号
	+ lsof -p pid|grep LISTEN
	+ netstat -nltp |grep pid
+ kill 发信号给进程
	+ kill -l 查看所有信号类型
	+ kill -9 pid 	强制杀死进程 SIGKILL
	+ kill -2  SIGINT  ctrl+c
	+ kill -15 (kill的默认选项) SIGTREM
	+ kill -l  中断 正常退出 暂停 继续
+ crontab 定时任务
	+ crontab	-e file


+ kernel bypass 绕过内核
	+ 解决内核网络栈和存储栈性能问题的一种思路：内核用来处理控制流，用户态处理数据流
	+ 避免内核：包拷贝，系统调用，线程调度等性能损耗，（poll, cpu pin, lock-free queue）(DPDK, NETMAP, SPDK, PF_RING, RDMA)
+ 无锁环形缓冲区
	+ dpdk ring buffer 
		+ array (内存连续存储，对cpu cache line友好)
		+ size power of 2 for convinient calculate
		+ padding struct obj for cache line 对齐
		+ CAS (ABA 问题 额外增加stamp，类似version判断是否出现ABA)
		+ memory barrier
	+ NIC ring buffer , ethtool, struct sk_buff
	+ disruptor ring buffer
+ 高级链表