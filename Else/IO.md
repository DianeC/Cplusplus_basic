1 含义
- 数据的输入和输出（input/output简写为I/O），输入输出过程可以看作“流”
- 当程序与外界进行信息交换时，存在两个对象，一个是程序中的流对象，另一个是文件对象
- 程序建立一个流对象
- 指定这个流对象与文件对象连接
- 程序操作流对象
- 流对象通过文件系统对所连接的文件对象产生作用

2 I/O分类
- 对标准输入设备和标准输出设备的输入输出简称为 标准I/O**需要举例**
- 对在外存磁盘上文件的输入输出简称为 文件I/O
- 对内存中指定的字符串存储空间的输入输出简称为 字符串I/O


2.1 标准I/O
- C++为用户进行标准I/O操作定义了四个类对象： cin，cout，cerr和clog
- cin为istream流类的对象，代表标准输入设备键盘，后三个为ostream流类的对象
- cout代表标准输出设备显示器
- cerr和clog含义相同，均代表错误信息输出设备显示器**区别是什么**

- 标准I/O是ANSI C建立的一个标准I/O模型，是一个标准函数包和stdio.h头文件中的定义，具有一定的可移植性。标准I/O库处理很多细节。例如缓存分配，以优化长度执行I/O等。标准的I/O提供了三种类型的缓存
    - 全缓存：当填满标准I/O缓存后才进行实际的I/O操作。 
    - 行缓存：当输入或输出中遇到新行符时，标准I/O库执行I/O操作。 
    - 不带缓存：stderr **???**
- 标准I/O可以看成是在文件I/O的基础上封装了缓冲机制。先读写缓冲区，必要时再访问实际文件，从而减少了系统调用的次数
- 标准I/O中用FILE（流）表示一个打开的文件，通常只用来访问普通文件
- ANSI：American National Standrads Institute  美国国家标准学会

2.2 文件I/O
- 文件I/O称为不带缓存的IO（unbuffered I/O)。不带缓存指的是每个read，write都调用内核中的一个系统调用。也就是一般所说的低级I/O——操作系统提供的基本IO服务，与os绑定，特定于linux或unix平台
- 通过文件I/O读写文件时，每次操作都会执行相关系统调用
- 文件I/O中用文件描述符表现一个打开的文件，可以访问不同类型的文件如普通文件、设备文件和管道文件等
- POSIX：Portable Operating System Interface  可移植操作系统接口


2.3 字符串I/O
- istringstream，由istream派生而来，提供读string的功能
- ostringstream，由ostream派生而来，提供写string的功能
- stringstream，由iostream派生而来，提供读写string的功能


输出流概述
C++中有三个重要的输出流
ostream
ofstream
ostringstream
预先定义的三个输出流对象

cout 标准输出
cerr 标准错误输出，没有缓冲，发送给他的内容立即输出
clog 类似于cerr，但是有缓冲，缓冲区满时被输出

构造输出流对象

ofstream类支持磁盘文件输出
如果在构造函数中指定一个文件名,当构造这个文件时该文件是自动打开的
ofstream myfile(filename");
可以在调用默认构造函数之后使用open成员函数打开文件
ofstream myfile;声明一个静态文件输出流对象
myfile.open(" filename")打开文件,使流对象与文件建立联系
-在构造对象或用open打开文件时可以指定模式
-ofstream myfile("filename", ios. base out | ios base:binary);

向二进制文件输出
二进制文件流

使用ofstream构造函数中的模式参量指定二进制文件输出模式
以通常方式构造一个流，然后使用setmode成员函数，在文件打开后改变模式
通过二进制文件输出流对象完成输出

向字符串输出文件
典型应用：将数据输出到字符串可以将数据转化为字符串类型

字符串输出流

用于构造输出流（ostringstream）
功能
支持ofstream类的除open、close外的所有操作
str函数可以返回当前已构造的字符串
典型应用
将数值转化为字符串


输入流类
重要的输入流类

istream类最适合用于顺序文本模式输入，cin是它的实例
ifstream类支持磁盘文件输入
istringstream
构造输入流对象

如果在构造函数中指定一个文件名，在构造该对象时该文件自动打开。
ifstream myFile("filename");
在调用默认构造函数之后用open函数打开文件。
ifstream myFile; //建立一个文件流对象
myFile.open("filename");//打开文件“filename”
打开文件模式可以指定
ifstream myFile("filename",ios_base::in|ios_base::binary);


字符串输入流
字符串输入流（istringstream）

用于从字符串读取数据
在构造函数中设置要读取的字符串
功能
支持ifstream类的除open、close外的所有操作
典型应用
将字符串转化为数值

输入/输出流
两个重要的输入输出流

一个iostream对象可以是数据的源或目的
两个重要的I/O流类都是从iostream派生的，他们是fstream和stringstream。这些类继承了前面描述的istream和ostream类的功能
fstream类

fstream类支持磁盘文件输入或输出
如果需要在同一程序中从一个特定磁盘文件读并写到该磁盘文件，可以构造一个fstream对象
一个fstream对象是有两个逻辑子流的单个流，两个子流一个用于输入，另一个用于输出
stringstream类

stringstream类支持面向字符串的输入输出可以用与对同一个字符串的内容交替读写，同样是由两个逻辑子流构成

