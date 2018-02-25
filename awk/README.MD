使用AWK做文本处理， 语句由模式和动作组成
+ 模式，决定动作的触发条件和时间
+ 动作
  + BEGIN， 设置计数和头部信息， 在任何动作之前进行
  + END， 输出统计结果， 在完成动作之后执行

默认分隔符为空格， 也可以-F改变为其他符号，例如冒号，-F：

例自定义日期显示
date|awk '{print "year:"$1 "month:"$2}'

自定义输出一些列
awk 'BEGIN {print "begin"} {print $1, $2, $3} END{print "end"}' file

满足某个模式的行
awk '$2>9 {print $0}' file

awk '{if($1=="kk" && $2>5) print $0}' file 
