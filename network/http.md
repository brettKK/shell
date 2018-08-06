http数据包格式
![image](net-image/http-message.png)

http响应消息中的状态码
+ 1xx 接收的请求正在处理
+ 2XX 请求正常处理完毕
  + 200 OK
+ 3XX 重定向状态码
  + 301 Moved Permanently：永久重定向
  + 302 临时性重定向
+ 4XX 客户端错误状态码
  + 400 bad request
  + 401 Unauthorized
  + 403 Forbidden
  + 404 Not Found：表明服务器上无法找到请求的资源
+ 5XX 服务器错误状态码
  + 500 Interval Server Error
  + 503 Service Unavailable

----
session（服务器端）和cookie（客户端）让http协议有状态

服务器发送的响应报文header里的set-cookie字段的信息，客户端保存cookie信息

+ session
  + 记录跟踪用户的会话状态
  + 后端http会话的无状态实现
+ cookie
  + 保存用户的信息，存在于http数据包的头部header中
  + 是实现server端session的一种方式（如果客户端禁用了cookie， URL重写方式，url中传session id进行会话的跟踪）

+ 分布式session，4种实现方式
  + session复制
  + session仅指定一台server
  + session集中管理，redis存放
  + 基于cookie的方式

![image](net-image/telnet.png)


curl -I www.google.com
(curl -I 获取http响应的头部)

![image](net-image/curl-http-header.png)

http请求与传送
+ curl
	+ X 指定request的method，如get，post
	+ H 指定请求的header
	+ d 消息体
	+ b 指定请求的cookie
	+ c set-cookie
	+ i reponse header
	+ w	 format output
+ wget 下载文件


+ http报文头部常用字段
  + content-type
    + application/x-www-form-urlencoded, (默认类型)原生form表单， key1=val1&key2=val2 的方式进行编码
    + multipart/from-data, 上传文件
    + application/json,
    + text/xml, XML格式 （post请求的4种格式）
  + connection: keep-alive, 持久连接（相对于用完就关闭的短连接而言）
  + keep-alive-time: 300, 指连接维持的时间
  + content-length: 120, 指明响应的内容有120字节 (出现等于-1，但是body有数据的情况？)
  + transfer-encoding: chunked， 响应内容采用分块传输，最后一个分块为0表示传输结束


+ http keep-alive 与 tcp keep alive 区别与联系
  + http 用于连接复用
  + tcp 用于保证连接存活，发送探测包确认连接是否存活

post请求与get请求的区别
+ ping url结果为unkown host，但是curl url可以通


+ RESTFUL api
  + 一种API设计理论
  + URL定位资源

---
https = http + SSL/TLS https的握手过程

![image](net-image/https.png)

https 流程  涉及到（非对称加密 对称加密 hash算法（MD5获取摘要） 数字证书 数字签名）

+ https 握手阶段 （确定加密算法， 获取服务器的证书 证明 服务器是client想要的）
  + 确定hash算法，对称加密算法
+ https 传输阶段
  + 使用对称算法进行数据加密(对称加密计算效率 要 高于 RSA)
+ https的body里加签sign
  + 加签方式（md5 with salt）在内容里添加“sign”=md5(content+salt)
  + 验签方式（md5 with rsa）对内容进行md5，rsa公钥解密， 对比传过来的sign与解密出来的sign是否一致
---
