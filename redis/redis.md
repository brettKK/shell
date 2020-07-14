### 读《Redis设计与实现》--黄健宏 简单笔记 http://redisbook.com/

#### 数据结构与对象
+ 简单动态数组 simple dynamic string SDS (面向对象的code的思想，空间换时间)
    + sds.h sds.c
    + 数组本身长度， 空余长度
    + 防止strcat 这种缓冲区溢出， o1时间获取字符串长度，减少内存分配，兼容c字符串库函数
+ 链表
    + adlist.h/listNode, list
    + 列表对象的encoding类型，可以是ziplist或linkedlist
+ 字典
    + dict.h/dictht, dict
    + 哈希对象的encoding类型，或者说实现方式有ziplist , hashtable
+ 跳跃表 有序集合的实现
    + redis.h/zskiplistNode, zskiplist
    + server.h/
+ 整数集合
    + intset.h/intset
+ 压缩列表 ziplist
    + 组成<zlbytes, zltail, zllen, entry1,entry2,...entryN, zlend>
    + 整体长度-字节 == 指向tail的偏移量 == entry的个数 == entry... == 标记结尾0xff 一字节
    + entry的结构<previous_entry_length, encoding(content的类型), content>, previous_entry_length 支持从尾到头

+ redis未直接使用上述数据结构， 而是redisObject结构进行封装。
    + 键对象， 均为字符串对象
    + 值对象， 为字符串对象，列表对象(ziplist, linkedlist)，哈希对象(ziplist, hashtable)，集合对象（intset, hashtable），有序集合对象(ziplist, skiplist)
    + redisObject结构体： type, encoding, prt, refcount, lru...
+ 类型的检查和命令的多态
    + 字符串键： set get append strlen
    + 列表键： rpush lpop linsert llen
    + 哈希键： hdel hset hget hlen
    + 集合键： sadd spop sinter scard
    + 有序集合键： zadd zcard zrank zscore
    + 类型的检查， 检查key对应的值类型 与命令是否匹配
    + 命令的多态
        + 基于类型的多态 ： 一个命令处理不同类型的键 del expire type
        + 基于编码encoding的多态： 一个命令处理不同编码方式 例如llen 对于列表键来说，底层为ziplist ,ziplistlen返回长度; 底层为linkedlist, listLength返回长度

```
typedef strcut redisObject {
    unsigned type:4; // 对象类型 string list hash set zset
    unsigned encoding:4; // 实现方式 
    unsigned lru:REDIS_LRU_BITS; // 对象的空转时长
    int refcount;
    void *ptr;  //encoding方式实现的承载者的地址
}

```

#### 单机数据库的实现
+ 数据库
    + redis.h/redisServer（dbnum 数据库数量, redisDb 表示数据库）
    + redisClient结构体（redisDb 记录客户端正在使用的数据库） select命令切换数据库
    + redisDb结构里（dict字典保存了数据库里所有的kv）
    + 最好补个图描述上述结构
    + 设置过期key
        + expire 设置key的ttl秒， pexpire 设置key的ttl毫秒
        + expireat 设置key的过期时间 秒，pexpireat 设置key的过期时间 毫秒
        + 底层均有pexpireat实现
        + redistDb结构里 expires过期字典，store所有key的过期时间
    + 过期键删除
        + 定时删除
            + 创建定时器添加到时间事件的链表中，cpu不友好
        + 懒性删除策略(db.c/expireIfNeeded) get key -> expireIfNeeded -> 删除key 并返回nil
        + 定期删除策略 (redis.c/activeExpireCycle)
        + save 生成rdb文件， 不会保存过期键
    + 数据库通知
+ RDB持久化
+ AOF持久化
+ 事件
    + 文件事件 ae_select.c , ae_epoll.c, ae_kqueue.c reactor模式
    + 时间事件 (定时事件， 周期性事件)
        + 定义为 id， when， timeProc(函数的返回类别 区分 是周期还是定时)
        + 一般情况下 只会有serverCron 一个周期时间事件
+ 客户端
    + redisClient里的属性来展开  补图
+ 服务端
    + 初始化服务器状态， 载入服务器配置，初始化服务器数据结构，还原数据库配置，执行事件循环
    + set命令的执行过程
        + 客户端发送set命令，转为redis协议格式的内容sending
        + 服务端读取命令，解析命令和参数
        + 服务端根据命令名在命令表中找执行命令的实现函数，执行结果写入redisClient的输出缓冲区
        + 服务端将命令的回复sending给客户端
    + serverCron  默认100ms执行一次 执行内容
        + 管理数据库状态信息
        + 处理sigterm信号
        + 执行持久化操作
    + redisServer 初始化
        + initServerConfig 初始化一般属性
        + initServer 初始化数据结构
+ 客户端与服务端的交互
    + 交互模式： 
        + 串行的请求/响应 
        + 双工的请求/响应pipeline 
        + 原子化的批量请求/响应（事务） 
            + multi 开启事务，客户端将命令发送到服务端入队列（出错不会执行exec）， exec一次性执行 （执行失败后继续执行）结果返回数组。感觉只是保证了multi阶段的事务，执行阶段不是事务
            + 
        + 发布/订阅模式，脚本模式
    + 交互协议分2部分： 网络协议（tcp连接）和序列化协议
        + 序列化协议 内容均以‘\r\n’结尾
            + inline command: 首字符以Redis开头的字符 例EXIST空格key1\r\n
            + simple string:  首字符以+开头， 例+OK\r\n
            + bulk string: 字符串本身包含了\r and \n,  解法有两种：加转义字符 or 长度自描述（redis是后者）. 例$12\r\nhello\rxxxx\r\n 
            + error string: 首字符以-开头，例-ERR unkown command\r\n
            + integer: 首字符以：开头， 例 ":13\r\n"
            + array: 首字符以*开头， 例 *2\r\n+abc\r\n:9\r\n => ["abc", 9]
        + 客户端发送服务端的类型： 数组  inline command , bulk string组成
        + 服务端的返回根据客户端请求类型来确定

#### 多机数据库的实现
+ 复制
+ sentinel 哨兵系统
    + 集群状态监控
    + raft协议 选新主
+ 集群
    + cluster meet ip port 把ip+port加入到cluster中
    + 16384个槽的分配 
    + moved错误 （请求a到机器上，但机器存放该key对应的槽，所以返回集群中正确的机器地址）  
    + ask错误（刚好负责这个槽，所以暂时无数据的临时措施）
    + 消息（集群内通过发送和接受消息来通讯 5种类型的消息） cluster.h/clusterMsg, clusterMsgData
        + meet消息 加入cluster的信号 （gossip由meee ping pong 三种消息实现）
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


----

+ 应用场景 能解决哪些问题
    + 排行榜 前200名  zset
    + 任务列表 list 定时任务 推送
    + 关注列表 关注列表 粉丝列表

+ https://redis.io/
+ redis 关键技术

+ 事件循环
+ 过期和逐出
+ 持久化
+ 主从复制
+ pipeline mget
+ redis 集群
+ redis 客户端
+ 延迟删除 & 双机房删除