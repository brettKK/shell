+ MySQL
+ MariaDB
+ PERCONA

存储引擎-是创建表时设置的，所以存储引擎是表级别的使用
+ innodb: 只有数据文件即时索引文件，一个表对应一个文件              
+ mysiam: 既有数据文件，又有索引文件
---
+ SQL
	+ DML
		+ select  join ，左连接，右连接值做联合查询时结果以哪边为准； inner join ，left join，right join
		+ insert
			+ insert into tb_name(a,b,c) values(1,2,3)
			+ insert into tb_name(a,b,c) values(1,2,3),(4,5,6),(7,8,9);
			+ insert into tb_name(a,b,c) select a,b,c from tb_name1;
			+ unique constraint
		+ update
			+ update tb_name set b = b+1 where name='aaa'
		+ delete
	+ DDL (implicit commit and cannot be roll back)
		+ create
		+ drop, 删除表
		+ truncate，清空表
		+ rename, only table name
		+ alter
			+ alter table tt add column city varchar(50)
			+ add, modify/change, drop

delete, drop, truncate区别
+ drop,truncate属于DDL， 不能回滚
+ drop删除表结构，delete用于删除某些行，truncate用于清空所有行

---
+  字段类型
	+	数字 （int(tinyint, smallint,...bigint), decimal(金钱), float, double）
	+	字符类 (char,varchar,text,blob)
		+ varchar(50)表示最大存放50个字符, char
		+ int(10)表示最大显示宽度为10,存储还是占4字节
	+ 时间日期类
		+ date, '1000-01-01' to '9999-12-31'
		+ datetime, '1000-01-01 00:00:00' t0 '9999-12-31 00:00:00',范围广
		+ timestamp, '1970-01-01 00:00:01' UTC to '2038-01-19 03:14:07' UTC

---

+ Master-Slave 原理 （Binlog, Relay log）
	+ 异步复制
		+ 主库
			+ 当从库连接式，binlog dump thread发送binlog event,并持有event的lock
			+ IO thread 读完后释放lock 	 
		+ 从库
			+ IO thread读binlog event，生成relay log
			+ SQL thread 读relay log，执行
	+ Binlog, Relay log
		+ SQL(增删改查，DDL)语句按 提交顺序 生成的日志，用于数据回滚，异步复制
		+ Relay log通过异步复制Master中的binlog，生成slave的执行日志
		+ Binlog的3种存储格式：binlog_format(row, statement, mixed)
			+ statement格式： 每一条会修改数据的sql都会记录在binlog中
			+ row： 不记录sql语句上下文相关信息，仅保存哪条记录被修改
			+ mixed： 混合	（Binlog记录数据库发生的变化,用于replication）
---
#### sql优化
+ 为搜索字段建索引
+ 避免select * ,  这样杜绝去使用覆盖索引
	+ 在innodb引擎下，select a,b,c 可以走辅助索引找到所有的数据，避免走到聚集索引上，减少一次聚集索引查询过程
	+ 减少数据传输量，limit 好习惯
+ 不在索引字段上使用函数
+ 不使用like ‘%xx’, 多用区间操作, 能用 between 就不要用 in 	
+ 复合索引最左前缀 (不是指SQL语句的where顺序要和复合索引一致)
	+ 复合索引底层存储也是一颗B+树，只不过排序key=（a,b,c）, 这样是复合索引使用时需要满足最左前缀的原理
+ 避免大事务（避免夹杂rpc）
+ 避免使用子查询， 子查询产生的临时表再扫描无索引可走，会全表扫描
+ explain 显示select语句的执行计划
	+ select_type: simple等
	+ type： 判断查询是否高效，const, ref, range, index,all
	+ extra： using index, using filesort(不能通过索引达到排序), using temporary(使用了临时表)

---

+ 事务的产生动机 （数据库的并发访问，失败时数据的可靠性）
+ mysql transaction
	+ mysql 事务特性
		+ ACID
	+ 隔离级别 可在终端进行模拟
		+ read uncommited （tranx will read dity data）
			+ 读脏数据
		+ read committed (no repeatable read)
			+ 不可重复读（事务中两次读的结果不一致）
		+ repeatable read (default mode)
			+ 事务在运行时看到相同的数据，可重复读
			+ 存在幻读（innodb的间隙锁解决）
		+ seriablizable
	+ mvcc
		+ 增加2列，一列保存行的创建时间，一列保存行的删除时间
		+ 实现了读写不冲突，可重复读，提高了性能  
+ innodb重要的日志，undo logs, redo logs
	+ undo logs: 记录某数据被修改前的值，可以用来在事务失败时进行rollback
	+ redo logs: 保证事务的持久性
+ undo+redo log
	+ 为保证事务的持久性，事务提交前先写redo log持久化（WAL）
	+ 数据不需要在事务提交前写入磁盘，而是在内存的缓存中
	+ redo log保证事务的持久性， undo log保证事务的原子性
----
+ mysql 锁
	+ mysql锁类型，锁机制 （InnoDB 检索数据走索引是行锁，不走索引，是表锁）
		+ 行级锁
			+ Record Lockx 对索引项加锁，锁定一条记录
			+ Gap Lockx 锁定一个范围，不包含记录本身
			+ Next-Key Lock = gap + record lock
		+ 表级锁 （不会出现死锁）MyISAM 读写，写写都是串行的 另 页面锁
---

数据库死锁分析

+ 分析简单死锁信息
+ 理解InnoDB的死锁原理和类型
+ 可以复现InnoDB死锁过程
+ 避免死锁的方法

+ 死锁的必要条件
	+ 互斥
	+ 请求并保留
	+ 不剥夺
	+ 循环等待

+ InnoDB 检测死锁 2种情况
	+ 2行记录交叉申请互斥锁
	+ 同一张表存在主键索引锁冲突

+ 死锁的注意事项：
	+ InnoDB的行锁是加在索引上的
	+ InnoDB的索引的修改会锁定更多的行
	+ InnoDB加锁是边查询边加锁，逐行获得锁
	+ InnoDB表的并发过多，会达到锁的最大深度，或者锁的最大
	+ 锁的升级也会导致死锁，建议事务开始就获得所有资源

---
+ InnoDB表中数据按行存储 类似网络协议栈，由页头，区头，段头，表头
+ 一个页面大小为16k，包含多行
+ 一个区由64个页组成，为1M
+ 一个段由多个区组成，构成表空间文件ibd （数据段、索引段、回滚段）

+ mysql innodb存储引擎的文件结构
	+ 共享表空间文件（ibdata1）
	+ 独占表空间文件（ibd）
	+ 表结构文件（user.frm， 表名 + .frm组成整个名称），与具体存储引擎无关
	+ 日志文件（redo文件等）

数据库自增主键可能的问题
+ 分库分表时，会出现主键重复的情况

---
