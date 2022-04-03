## 1.基础知识

1.1 空的类自带的四种函数
默认构造函数，析构函数，复制构造函数，赋值运算符

1.2 面向对象的3个特点：封装，继承，多态
- 封装：将客观事物抽象成类，每个类有自身的数据和方法。封装可以使得代码模块化，目的是为了代码重用
- 继承：子类继承父类的方法和属性，继承可以扩展已存在的代码，目的是为了代码重用
- 多态：允许将子类类型的指针赋值给父类类型的指针。它是在运行时出现的多态性通过派生类和虚函数实现。基类和派生类中使用同样的函数名，完成不同的操作具体实现。编译器在处理虚函数时使用动态联编，其他函数使用静态联编。

1.3 复制构造中的深拷贝和浅拷贝
如果一个类拥有资源，当这个类的对象发生复制过程的时候，资源重新分配，这个过程就是深拷贝，反之，没有重新分配资源，就是浅拷贝。浅拷贝可能有同一个指针析构两次的情况。

1.4 编译的过程
- 预处理：1）宏定义 #define的替换 2）文件包含 #include的替换 3）条件编译
- 编译：将预处理的结果翻译成汇编代码
- 汇编：将汇编语言翻译成目标机器指令
- 链接：例如，某个源文件中的函数可能引用了另一个源文件中定义的某个函数；在程序中可能调用了某个库文件中的函数

1.5 存储区分类
- 栈：局部变量，由编译器自动分配释放
- 自由存储区：new或者malloc， calloc， realloc，一般由程序员分配释放
- 静态存储区：全局变量，静态变量static，自动初始化为0，程序结束释放，注意static是内部链接性【什么是内部连接性：只能在一个文件中使用】
- 常量存储区：const，字符串例如“abc”，程序结束释放
- 代码存储区：存放2进制代码
- 注意堆和自由存储区的关系：https://www.cnblogs.com/QG-whz/p/5060894.html，自由存储区是抽象概念，自由存储区是堆实现的

1.6 new delete，malloc free
- new和delete：new用调用构造函数来实例化对象和调用析构函数释放对象申请的资源
- malloc和free：malloc用来申请内存和释放内存，但是申请和释放的对象只能是内部数据类型
- 同：
    - 都可以用于申请动态内存和释放内存
- 异：
    - malloc与free是C++/C语言的标准库函数，需要头文件<malloc.h>，new/delete是C++的运算符（**注意是运算符**）
    - malloc/free只能操作内部数据类型，对于非内部数据，不能执行构造和析构
    - malloc需要指定大小
    - 由于malloc/free是库函数而不是运算符，不在编译器的控制权限之内，不能够将构造和析构的任务强加于malloc/free
    - C语言只能用malloc/free
    - new出来的指针是直接带类型信息的。而malloc返回的都是void指针
    - malloc异常会返回null指针，new会抛出异常信息badalloc

1.7 头文件避免重复
```
#ifndef CH_H //意思是如果没有引用ch.h
#define CH_H //引用ch.h
...
#endif  //否则不需要引用
```

1.8 头文件的作用是什么?
- 定义接口，方便使用
- 通过头文件和二进制库给用户使用，保护源码
- 方便对类型安全进行检查

1.9 C++和C的不同
- c面向过程，c++面向对象
- c适合要求代码体积小的，效率高的场合，如嵌入式

**1.10 结构体和共同体的区别**
- 在存储信息时，struct可以存储多个成员，而union每个成员会共享一个存储空间
- 在任何时刻，union只存放被选中的那个成员，struct每个成员都在
- 对union的不同成员赋值，将会对其他成员重写，即union是对一块存储区域给了多个名称
- 联合体所有成员起始地址一样
- 大端模式：指数据的低位保存在内存的高地址中，而数据的高位，保存在内存的低地址中
- 小端模式：是指数据的低位保存在内存的低地址中，而数据的高位保存在内存的高地址中（union）

1.11 C++类和结构体的区别
- struct定义的类的缺省成员类型为公有的，而class定义的类的缺省成员为私有的
- 理论上，struct能做到的class都能做到，但class能做到的stuct却不一定做的到
- struct可以定义函数，可以继承与被继承

1.12 lambda表达式
- 可以理解为未命名的内联函数
- [capture list捕获列表](parameter list参数列表) {函数体}

1.13 typedef和define的区别
- 用法不同：typedef用来定义一种数据类型的别名，增强程序的可读性。define主要用来定义常量，以及书写复杂使用频繁的宏
- 执行时间不同：typedef是编译过程的一部分，有类型检查的功能。define在预编译处理，只是简单的进行字符串的替换，不进行类型的检查
- 作用域不同：typedef有作用域限定。define不受作用域约束，只要是在define声明后的引用都是正确的
- typedef定义是语句，因为句尾要加上分号。而define不是语句，不能加分号

1.14 静态连接与动态链接的区别
- 静态链接
在编译链接时直接将需要的执行代码拷贝到调用处，优点就是在程序发布的时候就不需要依赖库，也就是不再需要带着库一块发布，程序可以独立执行，体积会大
- 动态链接
在编译的时候不直接拷贝可执行代码，而是通过记录一系列符号和参数，在程序运行或加载时将这些信息传递给操作系统，操作系统负责将需要的动态库加载到内存中，然后程序在运行到指定的代码时，去共享执行内存中已经加载的动态库可执行代码，最终达到运行时连接的目的。优点是多个程序可以共享同一段代码，而不需要在磁盘上存储多个拷贝，缺点是由于是运行时加载，可能会影响程序的前期执行性能

1.15 类和对象的两个基本概念？
类：用来描述一组具有相似属性的对象的一种数据结构。类中有数据成员的声明和定义，有成员函数的实现代码。
对象：类的实例化

1.20 内存泄露与检查
- 用动态存储分配函数动态开辟的空间，在使用完毕后未释放，结果导致一直占据该内存单元即为内存泄露
- 内存泄漏检测：
 - 检查代码new之后是否delete
 - 长时间运行程序观察程序内存是否不断增加
 - cppcheck

1.21 iostream与iostream.h的区别
- #include <iostream.h>非标准输入输出流，C的标准库函数
- #include <iostream>标准输入输出流，C++

1.22 临时对象是什么
- 没有名字的对象
- 产生的情况：隐式类型转换，函数返回对象

1.23 常用数据类型对应字节数
- 1 byte = 8 bit
- char：1
- short int：2
- int：4
- unsigned int : 4
- float:  4
- char*: 4(32位编译器)，8（64位编译器）
- long: 4(32位编译器)，8（64位编译器）
- double:   8
- long long：8

1.24 C++里面是不是所有的动作都是main()引起的？
- 不是，比如全局变量的初始化

1.25 C++如何阻止一个类被实例化
- 将类定义为抽象基类
- 将构造函数声明为private

1.26 sizeof是运算符，在编译阶段处理
- 运算符是语言自身的特性，它有固定的语义，而且编译器也知道意味着什么
- 库函数是依赖于库的，没有库就没有它，也就是一定程度上独立于语言的

//TODO
1.27 内部链接性和外部链接性
- 编译单元：一个cpp文件就是一个编译单元，编译时单独编译，之后再进行链接
- 内部链接：那些编译单元(.cpp)中不能向其他编译单元(.cpp)展示，提供其定义的函数，变量就是内部链接，例如static函数，inline函数
  - 静态（static）全局变量，自由函数，友元函数定义（**待定**）
  - 类的定义（**待定**）
  - 内联函数定义（**待定**）
  - Union共用体定义
  - 名字空间的const常量定义（**待定**）
  - 枚举类型定义（**待定**）
  - 所有的声明（有人将声明归结为无链接）（**待定**）
- 外部链接：那些编译单元(.cpp)中能向其他编译单元(.cpp)展示，提供其定义，让其他编译单元(.cpp)使用的的函数，变量就是外部链接，例如全局变量
  - 类的非内联函数（包括成员函数和静态类成员函数）的定义
  - 类的静态成员变量的定义
  - 名字空间或全局的非静态的自由函数，非静态变量，非友元函数的定义
- 为什么会出现重定义错误：在多个cpp中定义了具有外部链接性的同名函数或者变量
- 为什么内联函数的定义要写在头文件中？因为内联函数具有内部链接性，头文件中声明并且定义，引用头文件后才能使用
- 模板的声明和定义需要写在一起

//TODO
1.28 友元

//TODO
1.29 inline
- 函数的定义和声明中需要有一个inline
- 直接定义在类内，不加inline也是内联函数

//TODO
1.30 C++类型转换（待增加）
- C语言的强制转换，主要用于基础类型：(type-id)expression//转换格式1；type-id(expression)//转换格式2
- C++新增四种类型强制转换，主要运用于继承关系类间的强制转化
- static_cast<new_type>      (expression)
- dynamic_cast<new_type>     (expression) 
- const_cast<new_type>       (expression) 
- reinterpret_cast<new_type> (expression)
- 新式转换较旧式转换更受欢迎。原因有二，一是新式转型较易辨别，能简化“找出类型系统在哪个地方被破坏”的过程；二是各转型动作的目标愈窄化，编译器愈能诊断出错误的运用。
- 尽量少使用转型操作，尤其是dynamic_cast，耗时较高，会导致性能的下降，尽量使用其他方法替代。

1.30-1 static_cast
- 用于类层次结构中基类（父类）和派生类（子类）之间指针或引用的转换
  - 进行上行转换（把派生类的指针或引用转换成基类表示）是安全的
  - 进行下行转换（把基类指针或引用转换成派生类表示）时，由于没有动态类型检查，所以是不安全的
- 用于基本数据类型之间的转换，如把int转换成char，把int转换成enum。这种转换的安全性也要开发人员来保证
- 把空指针转换成目标类型的空指针
- 把任何类型的表达式转换成void类型
- 非const转成const
- static_cast 是“静态转换”的意思，也就是在编译期间转换，转换失败的话会抛出一个编译错误
- 注意：static_cast不能转换掉expression的const、volatile、或者__unaligned属性 
- 缺点：没有运行时类型检查来保证转换的安全性

1.30-2 dynamic_cast
- dynamic_cast<type*>(e)：转换失败结果为0//**应该是空指针吧？**
- dynamic_cast<type&>(e)：转换失败，抛出std::bad_cast异常
- dynamic_cast<type&&>(e)
- type必须是一个类类型
- dynamic_cast主要用于类层次间的上行转换和下行转换，还可以用于类之间的交叉转换（cross cast）
- 在类层次间进行上行转换时，dynamic_cast和static_cast的效果是一样的
- 在进行下行转换时，dynamic_cast具有类型检查的功能，比static_cast更安全
- dynamic_cast是唯一无法由旧式语法执行的动作，也是唯一可能耗费重大运行成本的转型动作

1.30-3 const_cast
- 用于修改类型的const或volatile属性。 
- 除了const 或volatile修饰之外， new_type和expression的类型是一样的
- 常量指针被转化成非常量的指针，并且仍然指向原来的对象
- 常量引用被转换成非常量的引用，并且仍然指向原来的对象
- const_cast一般用于修改底指针。如const char *p形式**什么是底指针**

1.30-4 reinterpret_cast
- new_type必须是一个指针、引用、算术类型、函数指针或者成员指针
- 可以把一个指针转换成一个整数，也可以把一个整数转换成一个指针（先把一个指针转换成一个整数，再把该整数转换成原类型的指针，还可以得到原先的指针值）
- reinterpret_cast意图执行低级转型，实际动作（及结果）可能取决于编辑器，这也就表示它不可移植**需要再理解一下**
- reinterpret_cast 这种转换仅仅是对二进制位的重新解释，不会借助已有的转换规则对数据进行调整，非常简单粗暴，所以风险很高

//http://c.biancheng.net/cpp/biancheng/view/3297.html

1.30-5 向上类型转换和向下类型转换
https://blog.csdn.net/wangweitingaabbcc/article/details/7720979
- 向上类型转换：派生类 转 基类 **注意，基类为上**
- 向下类型转换：基类 转 派生类 （切割？）

1.31 三种访问权限
- public： 可以被任意实体访问
- protected： 只允许派生类及本类的成员函数访问
- private： 只允许本类成员函数访问
- 三种继承方式与访问权限组合后，均取最小权限

1.32 声明引用
- int &b=a；
- int (&b)[n]=a;//数组
- int* &b=a;//对指针的引用，和第一个一样
- 常引用：const int& b=a;//不能修改a的值

1.33 异常框架
异常存在于程序的正常功能之外，并要求程序立即处理。 C++ 的异常处理包括： 
- throw 表达式，错误检测部分使用这种表达式来说明遇到了不可处理的错误
- try 块，错误处理部分使用它来处理异常。try 语句块以 try 关键字开 始，并以一个或多个 catch 子句结束。在 try 块中执行的代码所抛出 （throw）的异常，通常会被其中一个 catch 子句处理
- 由标准库定义的一组异常类，用来在 throw 和相应的 catch 之间传递有关的错误信息。 
```
throw 表达式：
if (!item1.same_isbn(item2))
throw runtime_error("Data must refer to same ISBN");

try 块：
try {program-statements} 
catch (exception-specifier) {handler-statements}
 catch (exception-specifier) {handler-statements} 
```

1.34 什么时候必须重写拷贝构造函数: 有指针的情况**待定**

1.35 构造函数和析构函数是否可以被重载： 可以，不可以【什么是重载】

1.36 对象成员初始化的顺序
- 初始化列表：与构造函数中初始化成员列表的顺序无关，**只与定义成员变量的顺序有关**
- 在构造函数内初始化：与成员变量在构造函数中的位置有关

1.37 类对象间是怎样实现数据共享的**待定**
- 接口函数
- 静态成员变量
- 友元

1.38 流运算符为什么不能通过类的成员函数重载？一般怎么解决？
- https://blog.csdn.net/snowsnowsnow1991/article/details/50314961

1.39 堆栈溢出的原因
- 栈：数组变量越界访问，或者函数内局部变量使用过多，超出系统为该进程分配的栈的大小
- 堆：用户申请了资源但是没有释放

1.40 堆与栈的区别**待确认**
- 堆是静态的，由用户申请和释放; 栈是动态的，保存程序的局部变量
- 申请后系统的响应不同
  - 栈：只要栈的剩余空间大于申请空间，系统就为程序提供内存，否则将抛出栈溢出异常
  - 堆：当系统收到程序申请时，先遍历操作系统中记录空闲内存地址的链表，寻找第一个大于所申请空间的堆结点，然后将该结点从空间结点链表中删除，并将该结点的空间分配给程序
- 申请大小限制的不同
  - 栈：在windows下，栈的大小一般是2M，如果申请的空间超过栈的剩余空间时，将提示overflow
  - 堆：堆是向高地址扩展的数据结构，是不连续的内存区域。这是由于系统是用链表来存储的空闲内存地址的，自然是不连续的，而链表的遍历方向是由低地址向高地址。堆的大小受限于计算机系统中有效的虚拟内存。由此可见，堆获得的空间比较灵活，也比较大

  1.41 右值，将亡值，左值，std::move是怎么实现的

  1.42 段错误的原因
  - 段错误是指程序尝试访问一段不可访问的内存
  - 一些原因：
    - 一个函数内的数组过大，导致该函数的栈无法容纳数组，造成爆栈（递归可能造成这种情况）
    - 指针越界
    - 堆栈溢出
    - 数组越界
    - 解引用空指针
    - 访问不可访问的内存空间
    - 访问不存在的内存地址
    - 试图写一个只读的内存空间
    - 使用未初始化的指针
  - 如何避免：
    - 指针的安全使用：定义后初始化等
    - 检查数组下标是否越界
    - 检查在堆上的空间是否足够
    - 检查格式控制是否合理（？）

