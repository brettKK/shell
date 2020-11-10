
+ 深入理解jvm字节码
  + 反射
  + lambda 表达式
  + AOP
  + 热加载
  + 软件破解等

1 class文件的结构
2 字节码基础 java虚拟机栈 栈帧  for switch-case try-catch-finnally等字节码指令
3 字节码进阶 方法调用指令 范型擦出 synchronized 反射底层实现
4 javac 编译原理
5 从字节码角度看kotlin
6 asm javassist 2个重要的字节码操作工具
7 java instrumentation 原理
8 jsr 269 插件化注解的原理，掌握编译期间生成和修改代码的方法， lombok butterknife工具的实现原理
9 字节码在cglib fastjson dubbo jacoco mock等框架的应用
10 反编译 破解 防破解 逆向工程
11 APM  分布式跟踪的基本原理 opentracing 无埋点字节码插桩
12 android dex文件 android字节码于java字节码的区别， gradle字节码改写实现无侵入插桩

1  class文件由十个部分组成
    + my very cute animal turns savage in full moon areas
    +  magic,  0xCAFEBABE ，pdf png文件内都有魔数
    +  version, 生成class文件时的java版本
    +  constant pool, 
    +  access flag, 
    +  this class, 
    +  super class, 
    +  interface, 
    +  field, 
    +  method, 
    +  attribute

