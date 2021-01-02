**注意：这篇整理没有进行验证**

### 1.memcpy
- memcpy函数用于资源内存（src指向的内存）拷贝到目标内存（desc指向的内存）；拷贝的个数size
```
void *memcpy(void *dest, const void *src, size_t count)
{
	char *tmp = dest;//转换类型,第一步没有判断count是不是大于0的原因是size_t是无符号整形
	const char *s = src;

	while (count--)
		*tmp++ = *s++;
	return dest;//注意类型是void
}
```


#### 1.1 memcpy内存重叠的解决及其实现？
- 内存重叠：拷贝的目的地址在源地址范围内。所谓内存重叠就是拷贝的目的地址和源地址有重叠//https://my.oschina.net/zidanzzg/blog/812887
- 在函数strcpy和函数memcpy都没有对内存重叠做处理的，使用这两个函数的时候只有程序员自己保证源地址和目标地址不重叠，或者使用memmove函数进行内存拷贝
- 当源字节串和目标字节串重叠是，bcopy能够正确处理，但是memcpy的操作结果不得而知，这种情况必须改用ANSI C的memmove函数[网络编程]。故该函数实现过程中要考虑src 和dst是否有重叠的情况
- 内存重叠出现问题的情况：目标地址把源地址覆盖了，导致一开始操作就修改了源内存，需要从后往前开始操作

#### 1.2 简述strcpy与memcpy的区别
- 操作对象不同，strcpy的两个操作对象均为字符串,memcpy的两个对象就是两个任意可操作的内存地址
- 执行效率不同，memcpy高于strcpy
- 实现功能不同，strcpy主要实现字符串变量间的拷贝，memcpy主要是内存块间的拷贝。

#### 1.3 memmove
- 只要目标地址大于源地址，就从后往前复制
```
void *memmove(void *dest, const void *src, size_t count)
{
	char *tmp=dest;
	const char *s=src;

	if (dest <= src)
    {
	while (count--)
		*tmp++ = *s++;
	} 
    else 
    {
	tmp += count;
	s += count;
	while (count--)
		*--tmp = *--s;
	}

	return dest;
}
```


### 2.strcpy
```
char *(char *strDest, const char *strSrc)
{
    if ( strDest == NULL || strSrc == NULL)
        return NULL ;
    if ( strDest == strSrc)
        return strDest ;
    char *tempptr = strDest ;//为什么要这个量，感觉不是必要
    while( (*strDest++ = *strSrc++) != '\0');
    
    return tempptr ;
}
```


### 3.strcat
```
char * strcat(char * dest, const char * src)
{
    char *tmp = dest;//为什么需要

    while (*dest)
            dest++;
    while ((*dest++ = *src++) != '\0')
            ;

    return tmp;
}
```

### 4.strlen
```
int mystrlen(const char *StrDest)
{
	int i=0;
	while((*StrDest++)!='\0')
	{ 
		i++;
	}
	return i;
}
```

```
//指针加减法
int strlen(char *s)
{
	char *p = s;
	while (*p != '\0')
		p++;
	return p - s;
}
```

### 5.memset
```
/*将s所指向的某一块内存中的前n个字节的内容全部设置为ch指定的ASCII值，返回s*/
void* memset(void* dst,int val, size_t count)
{
    if (dst == NULL)
    {
        return NULL;
    }

    char* temp = dst;
    while(count--)
    {
        *temp++ = (char)val;
    }

    return dst;
}
```
 
### 6.字符串大小比较 
```
int mystrcmp(const char* str1, const char* str2)
{
    while (*str1 && *str2 && *str1++ == *str2++)
     ;
    return *str1 - *str2;
}
```

### 7.字符串输入
- cin>> : cin>>a;//然后就可以用了，接受一个字符串，或者数字，遇“空格”、“TAB”、“回车”都结束
- cin.get() : ch=cin.get(); //只能获取一个字符
- cin.get(字符数组名,接收字符数目)//用来接收一行字符串,可以接收空格
- cin.getline() : cin.getline(m,5)//用来接收一行字符串,可以接收空格，最后一个是'\0'
- getline() : string str;getline(cin,str);//和cin.getline()类似，但是cin.getline()属于istream流，而getline()属于string流，是不一样的两个函数
- gets() : gets(m);//接受一个字符串，可以接收空格并输出，需包含“#include<string>”
- getchar() : ch=getchar();////getchar()是C语言的函数，接受一个字符