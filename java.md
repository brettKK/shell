
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
    +  constant pool,  javap -v Helloworld
    +  access flag, 2字节 标识一个类为final, abstract, public 之类的
    +  this class,  确定类的继承关系 指向常量池的索引
    +  super class, 确定类的继承关系
    +  interface,   确定类的继承关系
    +  field, 字段表
       +  变长
       +  field_info结构 
          +  access_flags 字段访问标识
          +  name_index 字段名索引 指向常量池的字符串常量
          +  descriptor_index  字段类型描述符的索引  引用类型“L;” -> “Ljava/lang/String;” 指向常量池的字符串常量
          +  attributes_count 属性个数
          +  attribute_info  属性集合
             +  ConstantValue
             +  Synthetic
             +  Signature
             +  Deprecated
             +  Runtime-Visible Annotationns
             +  Runtime-Invisible Annotations
    +  method, 类中定义的方法存储在这里
       +  变长
       +  method_info
          +  access_flags
          +  name_index
          +  decriptor_index 方法描述符 指向常量池类型为constant_uft8_innfo的字符串常量项，表述(参1的类型，参2的类型...) 返回值类型
          +  attributes_count
          +  attribute_info
    +  attribute 属性表
       +  attribute_info 
          +  attribute_name_index 属性名索引 指向常量池的字符串常量
          +  attribute_length info 数组长度
          +  info
             +  ConstantValue属性
             +  Code属性 重要的部分 包含了方法的字节码
                +  

