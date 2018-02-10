
linux文件系统基于inode的内容， inode保存meta信息

+ inode (不存文件名)
  + size of file
  + device id
  + uid
  + gid
  + MODE
  + timestamps
  + pointer to data

Filesystem -> filename -> inode -> data
