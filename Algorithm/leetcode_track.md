https://leetcode-cn.com/problem-list/2ckc81c/

# 20201010
1 https://leetcode-cn.com/problems/3sum/
三数和为0，双指针
思路：
- 排序
- 方法1:单独挑出一个数字a，其他两个数字求和b和c【再一层循环固定b，通过指针来选c】【两层循环+一个指针】
- 方法2: 一层循环+2个指针
如何去重：
- 排序后，每次选取不同的a，每次选取不同的b

2 https://leetcode-cn.com/problems/divide-two-integers/
两数相除，不使用乘法、除法和 mod 运算符
没有学会，需要在写一遍

3 https://leetcode-cn.com/problems/implement-strstr/
返回字符串在字符串中的位置【朴素解法】
- 特殊情况：为空；后者更长
- 使用两个循环实现
看题解：KMP算法
【KMP 算法的应用范围要比 Manacher 算法广，Manacher 算法只能应用于「回文串」问题，相对比较局限，而「子串匹配」问题还是十分常见的。】
【在实际编码时，通常我会往原串和匹配串头部追加一个空格（哨兵）。】
