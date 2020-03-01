
linux performance analysis -- perf

makes use of data from Performance Monitoring Unit(PMU) on CPUS

common command
 stat perf stat 运行的程序的整体情况

 record perf record 记录函数级别的统计信息

 list perf list 显示可以触发perf采样点的事件

 report

 trace

 common options
 -e -a -p -t


---

hardware event 由PMU硬件产生的事件，cache命中

software event 由软件产生的事件，进程切换

tracepoint event 内核静态tracepoint触发的事件