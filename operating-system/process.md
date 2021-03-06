task_struct结构体对应与进程相关的信息

可执行文件的结构 （size查看）

进程的内存结构

+ 进程的凭证，证书 进程的uid，euid，suid。
+ 进程的real uid，gid 在/etc/password 第三列第四列里
+ 
euid是为了控制访问资源的
euid一般与uid保持一致，当执行二进制程序时，若程序设置了setuid, 那么进程的euid更改为程序的宿主uid
/usr/bin/passwd



![image](process-PCB.jpg)

进程控制块PCB （即数据结构task_struct）
+ 进程状态，运行，或者等待
+ 进程号
+ PC指针
+ 栈指针
+ CPU寄存器信息
+ 内存信息
+ 打开的文件表
+ 所有者用户
+ 状态队列指针 （OS用进程状态队列去管理进程以及PCB， 就绪队列， 阻塞队列等等）

进程的打开的文件描述符
进程的页目录表: 第0-767个页目录项属于用户空间，指向用户页表； 768-1023指向内核页表；表中最后一项为用户进程的页目录表的物理地址


进程上下文切换 context switch
+ 保存运行进程到上一个进程的PCB， 加载下一个进程的PCB


+ 创建进程 fork 子进程从父进程上继承了哪些内容？子进程与父进程的区别与联系
	+ fork 父进程中返回子进程的pid，子进程返回0
	+

pstree命令显示整个进程树

+ cat /proc/stat 系统进程整体的统计信息
	+ intr interrupts数
	+ ctxt 系统上下文切换次数
	+ btime Epoch开始到现在
	+ processes 进程数量
	+ proc_running run的进程数
	+ procs_blocked 等IO的进程数
+ /proc/pid
	+ cat /proc/pid/stat 某个进程的统计信息
	+ cat /proc/pid/task 某个进程包含的所有线程(其他方法，pstree， ps，top -H)
	+ cat /proc/pid/maps 进程的内存模型

+ cat /proc/sys/kernel/pid_max 查看系统支持最多的进程数，32768 （2-32768）
	+ 记录进程能够访问的地址集合virt，即虚拟地址空间virtual memory areas 
	+ 代码段 起始地址 结束地址 权限。 read exe
	+ rodata read only
	+ 数据段 .bss , .data read write
	+ 堆 
	+ 栈
	+ 文件映射 page cache 磁盘io
	+ 匿名映射  一段VMA后没文件和heap，就是匿名映射，主要是一次申请较多内存时 用户存放未用的地址空间

+ fork() pthread_create() 最后在linux中都是调用do_fork， copy_process方法
	+ linux中创建线程与进程均需要走到copy——process方法
	+ 进程与线程，对于系统来说都是task， 与task_struct对应
 	+ do_fork
		+ copy_process
		+ 复制的内容与参数flag相关

pid=1的进程为init进程，其他所有进程最开始均是通过init进程的fork来创建的

fork+exec 创建子进程，执行新程序
+ 在shell中vim， shell进程会去fork和exec vim。

---
进程通信：

信号signals：

+ SIGALRM:  timer time out
+ SIGABRT： 丢弃执行进程  调用abort函数生成的信号
+ SIGHUP： 挂起 终端退出时同时在终端运行的进程，不在与终端关联的信息 wget能捕获SIGHUP信号，并忽略它
+ SIGINT: 进程中断， ctrl+C可以产生
+ SIGKILL: 杀死进程， kill -9 pid， 不能忽略 uncatchable
+ SIGTERM: 进程终止， kill pid
+ SIGPIPE: 非法写管道
+ SIGQUIT： 进程退出，ctrl+\  产生coredump文件
+ SIGSTOP: 终止进程， 不能忽略 uncatchable
+ SIGTSTP: 终止进程， ctrl+z
+ SIGCHLD: 当子进程退出时，发送给父进程的信号
+ SIGSEGV: 段错误
+ SIGTRAP： 由断点指令或其它陷阱（trap）指令产生. 由debugger使用
+ 用户自定义信号

kill -l 显示可用的信号

信号的来源图
![image](signal_source.png)

---

进程退出
+ exit系统调用
+ kill
+ 僵尸进程：子进程退出，父进程没有调用wait，waitpid获取子进程的状态信息，那么子进程的pid仍然保留在系统中，称为zombie
+ 孤儿进程：父进程退出，子进程还在运行，子进程为孤儿进程，被pid=1的init进程收养

进程协作
生产者进程与消费者进程， 通过共享数据结构进行协作

---
让进程在后台可靠的运行
+ 用户注销或者网络中断时，终端会收到HUP信号从而关闭所有子进程。
+ 让进程忽略HUP信号 nohup
+ 让进程在新的会话中，从而不成为此终端的子进程 setsid, 让运行的程序在新的session中


