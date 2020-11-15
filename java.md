
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
+ try-catch 字节码分析 JVM的异常处理是通过编译期间确定下来的异常表，在运行时利用异常表来实现的
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
      + 调用的方法在编译期间确定，静态绑定
      + 不需要将对象加载到操作数栈上，仅参数入栈，执行invokestatic就行
   + invokespecial  调用特殊的实例方法，构造器方法
      + 调用的方法在编译期间确定，效率比invokevirtual高
      + 实例构造器方法<init>, private修饰的私有方法， super关键词调用的父类方法
   + invokevirtual 运行时根据对象的实际类型，执行具体子类的实现方法。 vtable
      + 调用的方法在运行时才能根据对象的实际类型确定
      + 需要将对象应用，参数入栈
   + invokeinterface 调用接口方法  itable
      + 调用的方法在运行时根据对象的类型确定目标方法
      + invokeinterface从itbale表找对应的方法
   + invokedynamic 调用动态方法
      + 前4条指令的分派规则固化在jvm中
      + invokedynamic 是把如何查找目标方法的决定权给了具体的用户代码中

+ JVM方法分配机制与vtable,itable原理， 方法分派
   + vtable, itable是java实现多态的基础
   + 对象的继承与多态
   + 子类继承父类的vtable。 一个没有方法的类的vtable也有5条来自Object类
   + final, static, private 方法不能被继承和重写，所以不会出现在vtable中
   + itable = offset table + method table 去支持invokeinterface指令 
+ HSDB（hotspot debugger）查看jvm运行时数据
   + 启动HSDB： sudo java -cp sa-jdi.jar sun.jvm.hotsport.HSDB
+ invokedynamic指令，lambda表达式中的作用
   + java8中出现的lambda表达式才第一次使用上这条指令
   + 匿名内部类是在编译期间生成新的class文件来实现的
   + asm在运行时生成class对象
+ 从字节码角度理解范型擦除
   + 范型类型会被擦除为Object类型
   + ArrayList<int> 不允许，因为原始类型不能存储到Object类型上
+ synchronized 关键字的字节码原理
   + 插入monitorenter (获取栈顶对象的锁)， 插入monitorexit(释放锁，一定插入至少2个，原因是正常退出和异常退出均会插入）
   + 一定会在code属性里生成异常处理的描述表，即在所有退出的地方插入monitorexit 保证锁在任何退出的节点均被释放（try-catch-finaly monitorexit）
+ 反射的底层实现原理
   + inflation机制，默认前15次用native的方式调用。超过15次，使用ASM生成新类去调用
   + 阿里的arthas工具， dump类文件，查看类的字节码  


4 javac