# include <iostream>

struct ListNode{
int val;
ListNode *next;
ListNode(int x):val(x),next(NULL){}//构造函数
};

ListNode* deleteNode(ListNode* head)
{
    if(head==nullptr)
    {
        return head;
    }

    ListNode* temp=head->next;
    while(temp->next!=nullptr)
    {
        if(temp->val==temp->next->val)
        {
            ListNode* pToBeDeleted = temp->next;
            temp->next=temp->next->next;
            delete pToBeDeleted;
            pToBeDeleted = nullptr;
        }
        temp=temp->next;
    }

    return head;
}