#include <iostream>
#include <stack>
#include <cstdlib>
#include <cstdio>

using namespace std;

stack<int> dataStack;
stack<int> minStack;

int main() 
{
    int n;
    while(cin>>n)
    {
        if(!minStack.empty() && minStack.top() <= n)
        {
            dataStack.push(n);
            minStack.push(minStack.top());
        }
        else
        {
            dataStack.push(n);
            minStack.push(n);
        }
        
        printf("当前栈的最小元素为：%d\n",minStack.top());
    }
    return 0;
}