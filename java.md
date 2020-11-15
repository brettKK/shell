
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

1  class文件由十个部分组成 javap查看字节码文件
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

2 字节码指令
+ switch-case的两种字节码指令的实现
   + tableswitch , case间隔紧密时使用 o(1)
   + lookupswitch , case间隔稀疏时使用  o(lgn)
+ try-catch 字节码分析
   + code属性里有异常表 表项4元组：from, to, target, exception type
   + 在from,to 范围内的字节码发生指定的exception type时跳转到target字节码的位置
   + finally 字节码分析
      + 为什么finally一定执行： javac生成字节码时在try和catch中所有退出之前加入invokevirtual 调用finally里代码块
      + finally语句中有return语句时，javac生成字节码时会将try 和catch里的return语句的值临时放入局部变量表里，只返回finally里的return语句
+ 对象相关的字节码
   + <init> 方法 ，类的构造方法，非静态变量的初始化，对象初始化代码块 
      + 创建对象需要三条指令： new, dup, invokespecial 
   + <clinit> 类的静态初始化方法 ， 类静态初始化块 静态变量初始化
      + static {};
      + new, getstatic, putstatic, invokestatic 触发

3 字节码进阶 （方法调用 反射 invokedynamic 线程同步）
+ 5条方法调用指令的联系和区别 （以invoke开头的指令）
   + invokestatic 调用static静态方法
      + 不需要将对象加载到操作数栈上，仅参数入栈，执行invokestatic就行
   + invokespecial  调用私有实例方法，构造器方法
   + invokevirtual 调用非私有实例方法
      + 
   + invokeinterface 调用接口方法
   + invokedynamic 调用动态方法
+ JVM方法分配机制与vtable,itable原理
+ HSDB查看jvm运行时数据
+ invokedynamic指令，lambda表达式中的作用
+ 从字节码角度理解范型擦出
+ synchronized 关键字的字节码原理
+ 反射的底层实现原理
+ 