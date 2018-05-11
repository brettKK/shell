http数据包格式
![image](net-image/http-message.png)

session（服务器端）和cookie（客户端）让http协议有状态

+ session
  + 记录跟踪用户的会话状态
  + 后端http会话的无状态实现
+ cookie
  + 保存用户的信息，存在于http数据包的头部header中
  + 是实现server端session的一种方式（如果客户端禁用了cookie， URL重写方式，url中传session id进行会话的跟踪）

![image](net-image/telnet.png)


curl -I www.google.com
(curl -I 获取http响应的头部)

![image](net-image/curl-http-header.png)

---
https
