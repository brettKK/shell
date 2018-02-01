linux top命令（mac top结果显示有一些区别）

以ubuntu top命令结果为2类信息
+ 5行统计信息
  + 任务队列信息，uptime类似
  + 进程统计信息
  + CPU状态
  + 内存信息
  + swap交换区信息
+ 各进程的状态监控信息
  + 进程pid， 拥有者， 进程优先级PR， NI nice值， VIRT 占有的虚拟内存总量， RES 物理内存
  + SHR 共享内存， s 进程状态（D不能中断的睡眠， R运行， S睡眠，T跟踪/停止， Z僵尸）
  + %CPU，%MEM， TIME， COMMAND
