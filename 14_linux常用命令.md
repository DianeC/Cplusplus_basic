## 1.linux命令

- ls： stat 显示指定文件的详细信息，比ls更详细
- mkdir
- touch
- echo: 创建带有内容的文件
- cat： 查看文件内容
- cp
- mv
- rm：-r 递归删除， -f 强制删除
- find：搜索文件，具体命令怎么写？
- wc：统计文本中的行数，字数，字符数
- grep：在文本文件中查找一个字符串
- rmdir：删除空目录
- tree：树形结构显示目录，需要安装tree包
- pwd
- ln：创建链接文件
- more，less：分页显示文本
- head，tail：显示文件头尾内容
- ctrl+alt+f1: 命令行全屏
- who：显示在线登陆用户
- whoami：当前操作用户
- hostname：主机名
- uname：系统信息
- top：动态显示当前消耗资源最多的进程
- ps：显示瞬间进程状态
- du：查看目录大小
- df：查看磁盘大小
- ifconfig：查看网络情况
- ping：测试网络是否联通
- netstat：显示网络状态信息
- man：命令不会用的时候，例如 man ls
- kill：杀死进程
- alias：重命名

## 2.文件权限管理
- R：读 4
- W：写 2
- X：执行 1
- 文件权限显示： -rw-rw-r--
- 第一位：“-”表示普通文件，其他：“l”链接，“d”表示目录
- 二三四位：当前用户的权限，可读写？
- 五六七位：所属组的权限，可读写
- 八九十位：其他用户的权限
- sudo chmod ［u所属用户 g所属组 o其他用户 a所有用户］ ［+增加权限 -减少权限］ ［r w x］ 目录名

例如：有一个文件filename，权限为“-rw-r----x” ，将权限值改为“-rwxrw-r-x”，用数值表示为765
```
sudo chmod u+x g+w o+r filename
```
上面的例子可以用数值表示
```
sudo chmod 765 filename
```

## vscode 快捷键
- alt+上下键：移动当前行的位置