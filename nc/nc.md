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
