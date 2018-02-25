sed

替换s命令
sed 's/old/new/' file

-n -p 一起使用只打印发生替换的行
sed -n 's/old/new/p' file
显示第三行
sed -n '3p' file

全部替换g命令
sed 's/old/new/g' file

删除d命令
sed '2d' file

插入i命令
追加a命令

复制 粘贴
