### 读《Redis设计与实现》--黄健宏 简单笔记

#### 数据结构与对象
+ 简单动态数组 simple dynamic string SDS
    + 数组本身长度， 空余长度
    + 防止strcat 这种缓冲区溢出， o1时间获取字符串长度，减少内存分配，兼容c字符串库函数
+ 链表
    + adlist.h/listNode, list
+ 字典
    + dict.h/dictht, dict
+ 跳跃表
    + redis.h/zskiplistNode, zskiplist
+ 整数集合
    + intset.h/intset
+ 压缩列表 ziplist

+ redis未直接使用上述数据结构， 而是redisObject结构进行封装。
    + 键对象， 均为字符串对象
    + 值对象， 为字符串对象，列表对象，哈希对象，集合对象，有序集合对象
    + redisObject结构体： type, encoding, prt, refcount, lru...

#### 单机数据库的实现
+ 数据库
    + redis.h/redisServer, redisDb
    + 过期键删除
        + 懒性删除策略(db.c/expireIfNeeded) get key -> expireIfNeeded -> 删除key 并返回nil
        + 定期删除策略 (redis.c/activeExpireCycle)
        + save 生成rdb文件， 不会保存过期键
    + 数据库通知
        + 
+ RDB持久化
+ AOF持久化
+ 事件
+ 客户端
+ 服务端


#### 多机数据库的实现
+ 复制
+ sentinel
+ 集群