## 1 重载，重写，隐藏
- 重载：方法同名，参数不同，通过参数来确定调用哪一个函数，编译时已经确定，静态绑定
- 重写（多态）：有virtual，派生类重写基类的方法，派生类抛出的异常不能超过基类的异常，函数同名同参数，通过对象带有的虚函数表确定使用哪一个函数，运行时确定，动态绑定
- 隐藏：没有virtual，同名同参会隐藏，如果时是同名不同参，可以当作不同名的函数来看待

## 2 面向对象三大特点
- 封装：
- 继承：
  - 优点：继承可以方便地改变父类的实现，可以实现多态，子类可以继承父类的方法和属性
  - 缺点：破坏封装，子类和父类可能存在耦合。子类不能改变父类的接口
- 多态：多态是指相同的操作或函数、过程可作用于多种类型的对象上并获得不同的结果。不同的对象，收到同一消息可以产生不同的结果，这种现象称为多态
  - 作用1：隐藏实现细节，使得代码能够模块化；扩展代码模块，实现代码重用
  - 作用2：接口重用，为了类在继承和派生的时候，保证使用家族中任一类的实例的某一属性时的正确调用
  - 多态是什么：一个接口，多种方法
  - 多态的作用：方便使用，面向对象编程
  - 多态的实现： 静态多态（函数重载和泛型编程-模板），动态多态（函数重写：继承+虚函数）
  - 基类指针指向不同对象，注意是基类的指针

## 3 虚函数表
- 如果一个类有虚函数，每个对象的开始都会有一个指向虚函数表的指针
- 基类的虚函数表中有所有虚函数的地址
- 派生类中增加的虚函数会按顺序增加到虚函数表中，但是是新表，不是和基类一样的表
- 派生类中重写（显然不是重载，也不是隐藏）基类的虚函数后，派生类的虚表会把对应的虚函数地址进行更新
- C++中虚函数表位于只读数据段（.rodata），也就是C++内存模型中的常量区（存疑）

## 4 继承中的访问控制
类本身的访问控制：
- public：类本身、派生类和其它类均可访问；
- protected：类本身和派生类均可访问，其它类不能访问；
- private（默认）：类本身可访问，派生类和其它类不能访问。

继承成员的访问控制规则：由父类成员的访问控制方式和继承访问控制方式共同决定
- private+public（protectd，private）=>不可访问
- pubic（protected）+public=>public（protected）
- public（protected）+protected=>protected
- public（protected）+private（默认）=>private

## 5 多重继承，虚继承和虚基类
- 虚基类： 类B、C继承类A；类D继承类B、C；按照正常的公有继承方式，类D中将包含2份类A的对象/方法。这样浪费存储空间，而且使用对象/方法时需要说明是从哪一个父类继承而来的。所以继承时将基类声明成虚基类，同一个虚基类的对象/方法，在子类中只会出现一次。
class A//声明基类A
{…};
class B :virtual public A//声明类B是类A的公用派生类，A是B的虚基类
{…};
class C :virtual public A//声明类C是类A的公用派生类，A是C的虚基类
{…};
- 多重继承的问题：1、浪费存储空间 2、存在二义性问题
- 虚继承如何解决问题：虚继承底层实现原理与编译器相关，一般通过虚基类指针和虚基类表实现，每个虚继承的子类都有一个虚基类指针（占用一个指针的存储空间，4字节）和虚基类表（不占用类对象的存储空间）（需要强调的是，虚基类依旧会在子类里面存在拷贝，只是仅仅最多存在一份而已，并不是不在子类里面了）；当虚继承的子类被当做父类继承时，虚基类指针也会被继承。实际上，vbptr指的是虚基类表指针（virtual base table pointer），该指针指向了一个虚基类表（virtual table），虚表中记录了虚基类与本类的偏移地址；通过偏移地址，这样就找到了虚基类成员，而虚继承也不用像普通多继承那样维持着公共基类（虚基类）的两份同样的拷贝，节省了存储空间。 

- 多继承二义性主要出现在：
  - 不同继承路径有同名成员：可以通过作用域限定解决
  - 不同继承路径继承共同的基类，存在多个基类子对象：可以通过作用域限定或者虚基类解决


## 6 纯虚函数和抽象基类
- 纯虚函数： virtual void Display () = 0; // 纯虚函数
- 抽象基类： 有纯虚函数，只提供接口，必须由派生类实现功能


## 7 虚析构函数 **需要更细**
new出来的是子类son的对象，采用一个父类father的指针来接收，故在析构的时候，编译器因为只知道这个指针是父类的，所以只将父类部分的内存析构了，而不会去析构子类的内存，就造成了内存泄露。基类析构函数定义为虚拟函数的时候，在派生类的对象的首地址开始会有一块基类的虚函数表拷贝，在析构基类对象的时候会删除此虚函数表，此时会调用基类的析构函数，所以此时内存是安全的。

## 8 不能被声明为虚函数的成员函数有哪些
### 8.1 构造函数
- 虚函数都对应一个虚函数表，虚函数表是存在对象内存空间的，如果构造函数是虚的，就需要一个虚函数表来调用，但是类还没实例化没有内存空间就没有虚函数表，这根本就是个死循环
### 8.2 静态成员函数
- 没有this指针，而虚函数是通过对象中的指针指向的虚标来链接的，静态成员函数没有this指针，即不是被对象来访问，因此没有办法找虚表
### 8.3 内联函数
- 因为内联函数没有地址，而虚表里面存放的就是虚函数的地址

## 9 构造函数中调用虚函数不能实现多态
- 定义一个派生类对象的时候，会首先调用基类的构造函数
- 当调用基类的构造函数的时候，此时会创建Vptr指针（也可以认为Vptr指针是属于基类的成员，所以在子类中重写虚函数的时候virtual关键字可以省略，因为编译器会识别父类有虚函数，然后就会生成Vptr指针变量），该指针会指向基类的虚函数表
- 然后再调用派生类的构造函数，此时Vptr又被赋值指向子类的虚函数表（执行父类的构造函数的时候Vptr指针指向的是父类的虚函数表，所以只能执行父类的虚函数）
- 在构造函数中调用虚函数不能实现多态，因为得指向本类得虚表，而此时对象还没有构造完全

## 10 函数模板和类模板
- **函数模板:实例化不需要显示指定，编译器会自动完成**
```
template<typename T> void Swap(T &a, T &b){
    T temp = a;
    a = b;
    b = temp;
}
```
- **类模板：实例化需要程序员在程序中显示指定**
```
#include <iostream>
#include <string>
using namespace std;
template <class T1,class T2>
class Pair
{
public:
    T1 key;  //关键字
    T2 value;  //值
    Pair(T1 k,T2 v):key(k),value(v) { };
};

int main()
{
    Pair<string,int> student("Tom",19); //实例化出一个类 Pair<string,int>
    return 0;
}
```

## 11 友元
