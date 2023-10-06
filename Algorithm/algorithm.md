## 1 动态规划
- 将复杂的问题分解成简单的子问题来解决
- 子问题中解决的结果可以存储下来供后续使用
- 一般用递归或者for循环
- 一般是自底向上的吗
- 主要为找到递推公式，例如打家劫舍（II可以拆解成1），路径数量推导
- 或者进行问题转化，例如【目标和】问题，需要转化成01背包问题
- 股票买入卖出： 状态转换关系 https://leetcode.cn/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/?envType=study-plan-v2&envId=leetcode-75
- //求最大值的情况下，初值一定要设置成理论最大/最小值INT_MIN

背包：组合问题；最大最小问题；true和false的问题

剪绳子的数学推导：
1. 只有剪的等长乘积才会更大
l = 2a；
res = a^2;

l = (a+x)+(a-x)
res = (a+x)*(a-x) = a^2 -x^2

同理可以证明分成n段时也是这样

2. 3越多乘积越大
res = x^l/x
即转化为
y = x^(1/x) 的极大值
两边求对数： lny = (1/x)*lnx
两边求导数（转化为求导数的0值）：y‘ = 1/ x^2 - lnx/x^2
当 y‘==0时，可以求得 lnx=1
即此时x=e

## 2 dfs+回溯法
1. 对于需要暴力搜索所有满足条件的结果的情况，使用dfs+回溯法；动态规划只需要一个最优结果即可
标准模版：可以应对排列和组合问题
全局结果res
dfs()
{
    //剪枝和是否满足要求判断

    //回溯：组合问题使用begin，排列问题每次从头搜索
    //注意看是一层循环还是两层循环
    for()
    {
        //是否有防重逻辑等
        //全排列是否满足要求判断
        //特征符进1
        dfs();//如果本层可以重复，begin；如果本层不能重复，begin+1
        //特征符回退
    }
}

2. bfs 与 dfs
- 钥匙问题：https://leetcode.cn/problems/keys-and-rooms/solutions/18826/7xing-dfs-8xing-bfs-liang-chong-fang-fa-san-chong-/?envType=study-plan-v2&envId=leetcode-75
- 腐烂的橘子：https://leetcode.cn/problems/rotting-oranges/?envType=study-plan-v2&envId=leetcode-75

3. backtrace：数组和问题
- https://leetcode.cn/problems/combination-sum-iii/?envType=study-plan-v2&envId=leetcode-75

单调栈是啥？？
## 3 并查集
1. 省份数量：https://leetcode.cn/problems/number-of-provinces/solutions/?envType=study-plan-v2&envId=leetcode-75

## 4 位运算
1. ^异或：相同为0，不同为1，0^n=n, **异或^运算具有交换、结合性质**
2. &与：相同为1，不同为0
3. |或：0｜0=0.否则为1
4. ~取反：0变1，1变0
5. << 左移
6. >> 右移
7. 同或：
7. 求1的个数：n = n&(n-1) 多少次为0
8. 求只出现一次的数字：异或
9. 求最后一位的方法 &1
10. 如何判断全为1: +1后为100000则 n&(n+1) == 0

然后异或等同于加法mod2，与等同于乘法??
(a ^ b) & (a ^ c) == a & (b ^ c)

## 5 链表

## 1 进制转换

## 2 栈
### 2.1 最小栈的实现
- 很简单，在普通栈的结构基础上增加一个 最小栈
- 即，维护两个栈，一个用来正常存取，一个用来更新当前的最小值
- 详解：https://www.cnblogs.com/linkstar/p/6114416.html
- [code](code/12_min_stack.cpp)

### 2.2 单调栈
- 单调栈：https://leetcode.cn/problems/daily-temperatures/?envType=study-plan-v2&envId=leetcode-75


## 3 最大最小堆
### 3.1 求一个数组中的最大的K个数
- 很简单，建一个元素为k个的最小堆
- 每次插入新元素的时候，与最小值进行比较，如果大于最小值，删除当前最小值并且插入新的元素