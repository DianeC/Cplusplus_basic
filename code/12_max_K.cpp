void heapifymin(int Array[],int i,int size)
 {
    if(i<size)
 {
  int left=2*i+1;
  int right=2*i+2;
  int smallest=i;//假设最小的节点为父结点
  //确定三个结点中的最大结点
  if(left<size)
  {
   if(Array[smallest]>Array[left])
    smallest=left;
  }
  if(right<size)
  {
          if(Array[smallest]>Array[right])
    smallest=right;
  }
 
  //开始交换父结点和最大的子结点
       if(smallest!=i)
    {
     int temp=Array[smallest];
     Array[smallest]=Array[i];
     Array[i]=temp;
     heapifymin(Array,smallest,size);//对调整的结点做同样的交换
    }
 }
 }
 
//建堆过程，建立最小堆,从最后一个结点开始调整为最小堆
void min_heapify(int Array[],int size)
 {
  int i;
  for(i=size-1;i>=0;i--)
   heapifymin(Array,i,size);
  
 }
 //k为需要查找的最大元素个数，size为数组大小，kMax存储k个元素的最小堆
void FindMax(int Array[],int k,int size,int kMax[])
{
 
  for(int i=0;i<k;i++)
   kMax[i]=Array[i];
 //对kMax中的元素建立最小堆
   min_heapify(kMax,k);
 printf("最小堆如下所示 : \n");
for(i=0;i<k;i++)
printf("%4d",kMax[i]);
printf("\n");
 
 for(int j=k;j<size;j++)
  {
     if(Array[j]>kMax[0]) //如果最小堆的堆顶元素，替换
  {
        int temp=kMax[0];
  kMax[0]=Array[j];
     Array[j]=temp;
  //可能破坏堆结构，调整kMax堆
  min_heapify(kMax,k);
  }
  
 
  }
 
 
 
}
 
int main()
{
    
 int a[]={10,23,8,2,52,35,7,1,12};
 int length=sizeof(a)/sizeof(int);
 
    //最大四个元素为23,52,35,12
/***************查找数组中前K个最大的元素****************/
 int k=4;
 int * kMax=(int *)malloc(k*sizeof(int));
 FindMax(a,k,length,kMax);
 
   printf("最大的%d个元素如下所示 : \n",k);
    for(int i=0;i<k;i++)
        printf("%4d",kMax[i]);
 printf("\n");
 return 0;
}
 