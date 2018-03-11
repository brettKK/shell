
linux文件系统基于inode的内容， inode保存meta信息

+ inode (-不存文件名-)
  + size of file
  + device id
  + uid
  + gid
  + MODE
  + timestamps
  + pointer to data

文件系统的层次结构如下：
文件系统中找到文件名，根据文件名找到inode号，根据inode号找到数据块
Filesystem -> filename -> inode -> data

ext2 ext3
inode的大小

df -h

df -i 查看可用的inode号

ls -l
ls -i
stat file.txt
