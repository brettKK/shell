### 读《Redis设计与实现》--黄健宏 简单笔记

+ 简单动态数组 simple dynamic string SDS
    + 数组本身长度， 空余长度
    + 防止strcat 这种缓冲区溢出， o1时间获取字符串长度，减少内存分配，兼容c字符串库函数
+ 链表
    + adlist.h/listNode, list
+ 字典
    + dict.h/dictht, dict