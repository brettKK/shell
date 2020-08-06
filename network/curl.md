# curl command

+ 不带参数 curl  xx.com 发get请求
+ curl -X POST xx.com 发post请求
+ 下载单个文件，print到stdout
	+ curl baidu.com
+ -o/O 保存下载文件到本地
	+ -o
		+ curl -o mytext.html baidu.com
	+ -O 将文本保存到本地，以web名称存在
		+ curl -O www.gnu.org/aa.html
+ -L curl 调整到新地址
+ -i 显示response header and html
+ -I only response header
+ -v 显示http通信过程 --trace
  + curl -v http://www.example.com/index.html
  + > 发送的请求， <接收的响应
  + RFC2616

+ curl -u username :password URL
+ curl 查询单词
	+ curl dict://dict.org/d:xxx 查询xxx的含义
	+ curl dict://dict.org/show:db 列出可用的词典
	+ curl dict://dict.org/d:xx:foldoc 利用foldoc查询xx的含义
+ 给curl 设置代理
	+ curl -x proxyserver.test.com:9090 google.com
+ 将cookie保存到本地
	+ curl -D localCookie google.com
	+ curl -b localCookie google.com 使用上次的cookie
	+ curl -c cookie url 保存cookie到文件
+ 默认curl使用get方式 发送表单
	+ curl -u username github.com
+ 可以通过--data/-d方式使用post
	+ curl -u username --data "param1=value1&param2=value2" github.com
	+ curl --data @filename github.com 将文件中的数据传给服务器
+ User Agent (-A , -H)
	+ curl --user-agent "user-agent" url
+ cookie (-b)
	+ curl --cookie "name=xx" url
	+ cookie值可以从response header的·Set-Cookie·字段得到
+ 自行加request header信息
	+ curl --header "" url

-------
常用的例子,向某个网址发送post请求，http请求的body为json格式

+ curl -d '{"key1":"value1", "data":{"data1":"value1", "data2":"value2"}}' 'https://xxx.com/a/b'
+ curl -F 'business_type=one' -F 'data=@/Users/kk/a.csv'  x.x.x.x:xx/a/b curl发送文件
+ curl -G -d 'q=xx' xx.com -d ''//xx.com?q=xx

---
+ practice
	+ visit homeweb
	+ check header in response
	+ check interactive process of request, response header and content
	+ save result into files
	+ sent get/post request
	+ 提交表单
	+ 带指定的cookie to sent request
	+ 存储server返回的cookie到本地文件
	+ 使用存储在本地的cookie提交
	+ 设置请求header

+ wget 下载安软软件或者文件

+ ping icmp协议 封装在IP包里
	+ 类型0 8 请求与响应
	+ 3是不可达 后面有代码号 5种情况 ( ip中的网络号-网络不可达 ip中的主机号-主机不可达 防火墙不允许tcp连接-协议不可达 端口没有进程监听-端口不可达 mtu大小的问题 )
