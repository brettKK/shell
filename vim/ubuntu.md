#learn vim

+ vim 基本模式
	+ normal模式 每个字符被当作命令
		+ other mode -- esc --> normal模式
		+ + command-line模式
		+ normal模式 -- /，？，：--》 command-line mode --enter--> normal mode
		+ normal模式 --：command-line mode --set nu --> normal mode
		+ visual模式
			+ normal mode -- V--> visual line
	+ insert模式 每个字符被当作文本内容
		+ normal mode -- a, A, i, I, o, O --> insert mode
+ vim -o file1 file2
+ :sp    :vsp
+ hjkl 代替光标 10h 12k
	+ ctl + b  ctl + f 向上 向下 翻页
+ u 撤销 ctrl+v 重复
+ vim 配置
	+ 
+ 进入终端全屏
	+ ctrl + alt + f1
	+ ctrl + alt + f2
	+  ...
	+ ctrl + alt + f6
+ 推出终端全屏
	+ ctrl + alt + f7
+ 进入，退出终端全屏
	+ ctrl + alt + f7
+ 打开终端
	+ ctrl + alt + t
+ terminal  分屏	同时看多台服务器上的日志

-----
+ /etc/profile
	+ 为系统中每个用户设置环境信息，只在用户第一次登陆时，被执行
	+ 并从/etc/profile.d目录中搜索shell的配置
+ /etc/bashrc
	+ bash shell被打开，就被执行
+ ～/.bashrc
	+ 每次打开shell时，被执行
+ ~/.bash_profile
	+ 用户登陆时仅执行一次，执行用户的bashrc

![image](linux-bash.png)
-----

+ getconf PAGE_SIZE
	+ 4096
+ getconf PAGESIZE



+ ~/.vimrc
+ .bashrc
+ bundle
+ vimscript

+ 重定向
	+ runApp < data.in > results.out
	+ > /dev/null 丢弃输出信息
	+ 2>&1 错误输出重定向到标准输出中
	+ >> a.log  追加写文件
	+ &>a.log  将标准输出和错误输出的组合重定向到a.log里
	+ 单独的 & 将任务发送到shell后台执行
		+ jobs 列出在后台执行的所有任务
		+ fg 任务编号 将任务带回前台
		+ ctrl+z 暂停进程， bg 将任务继续带回后台执行


+ 查找某个字符串
  + 命令模式:／strings ，光标位置向下查找
  + :?strings, 光标位置向上查找
+ 在整个文件中替换特定字符串
  + :%s/old_word/new_word/g // %s/old_word/new_word/gc  每次替换会确认一下
  + g/old_word/s//new_word/g

active and inactive list LRU
grep -i active /proc/meminfo


+ linux 性能调优工具
	+ CPU Mem disk network
	+ 综合top htop
	+ cpu
		+ vmstat
		+ uptime
		+ mpstat
	+ Mem
		+ free
		+ smem
	+ disk
		+ iotop
		+ iostat
	+ network
		+ ping
		+ nslookup
		+ traceroute
		+ mtr