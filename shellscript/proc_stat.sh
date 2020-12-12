#!/bin/bash
# 统计linux进程相关数量信息
running=0
sleeping=0
stoped=0
zombie=0
#proc目录下所以以数字开头的都是所有进程的pid
for pid in /proc/[1-9]*
do
    procs=$[procs+1]
    stat=$(awk '{print $3} $pid/stat')
    case $stat in
    R)
        running=$[running+1]
        ;;
    T)
        stoped=$[stoped+1]
        ;;
    S)
        sleeping=$[sleeping+1]
        ;;
    Z)
        zombie=$[zombie+1]
        ;;
    esac
done
echo $procs
echo $running