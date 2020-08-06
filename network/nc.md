### nc NetCat

+ 小巧，25k，可通过tcp，udp协议传输读写数据

+ remote copy file
  + server2: nc -l 1234 > 1234.txt
  + server1: nc -w 1 ip 1234 < a.txt
+ like qq comunication
  + test
    + one console: nc -l 1234
    + another console: nc 127.0.0.1 1234
    + input any content

+ dig 查询DNS相关信息的工具
+ DNS记录的类型
  + A记录       指定域名对应的IP地址
  + AAAA记录    指定域名对应的IPV6地址
  + CNAME记录   别名解析 域名1（CDN加速域名） -》域名2 -》IP
  + NS记录      域名服务器记录  将域名解析交给其他DNS服务器