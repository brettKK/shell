elf格式的文件
+ core dump file
+ 可执行文件
+ 共享文件
+ 重定向文件

从linker的角度看elf文件 （sections like .text,.data, .bss,...）

![image](elf.png)

从exec的角度看elf文件
sections 与 segments的区别


readelf看elf文件的头
elf头记录地址，大小等记录  

.bss段不存在程序文件中，仅存在与内存中

存放为初始化的全局变量和局部静态变量。
目的是为这些为初始化的数据项预留内存空间
bss中的实际内容在程序运行时才产生，起初并无意义

中断向量表

段基址 段内偏移量
