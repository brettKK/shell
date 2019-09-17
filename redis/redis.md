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
+ RDB持久化
    + 
+ AOF持久化
+ 事件
    + 文件事件 ae_select.c , ae_epoll.c, ae_kqueue.c reactor模式
    + 时间事件 (定时事件， 周期性事件)
        + 定义为 id， when， timeProc(函数的返回类别 区分 是周期还是定时)
        + 一般情况下 只会有serverCron 一个周期时间事件
+ 客户端
+ 服务端
    + 初始化服务器状态， 载入服务器配置，初始化服务器数据结构，还原数据库配置，执行事件循环
    + serverCron  默认100ms执行一次。


#### 多机数据库的实现
+ 复制
+ sentinel 哨兵系统
    + 集群状态监控
    + raft协议 选新主
+ 集群
    + cluster meet ip port 把ip+port加入到cluster中
    + 16384个槽的分配 moved错误 （请求a到机器上，但机器存放该key对应的槽，所以返回集群中正确的机器地址）  ask错误（刚好负责这个槽，所以暂时无数据的临时措施）
    + 消息（集群内通过发送和接受消息来通讯 5种类型的消息） cluster.h/clusterMsg, clusterMsgData
        + meet消息 加入cluster的信号
        + ping消息 pong消息
        + fail消息 
        + publish消息 

#### 独立功能的实现
+ 发布与订阅
+ 事务
    + multi, exec, watch
    + redis单线程处理事件，所以事务执行是串行的，所以满足隔离性。
+ lua脚本
+ 排序
+ 二进制位数组
+ 慢查询日志 slowlog get
+ 监视器 monitor 命令 客户端变为监视器

--- 
redis in action
..