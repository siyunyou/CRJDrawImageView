//
//  main.m
//  CRJArithmeticTest
//
//  Created by apple on 2018/10/15.
//  Copyright © 2018年 JZJY. All rights reserved.
//

#import <Foundation/Foundation.h>

int swapCount = 0;
int layer1Count = 0;
int layer2Count = 0;

void Swap(int A[], int i, int j){
    
    int temp = A[i];
    A[i] = A[j];
    A[j] = temp;
    
    swapCount ++;
    
}


//冒泡排序
void BubbleSort(int A[], int n){
    
    printf("n = %d \n",n);
    
    for (int i=0; i<n-1; i++){
        layer1Count ++;
        for (int j=0; j<n-1-i;j++){
            layer2Count ++;
            if(A[j] > A[j+1]){
                Swap(A, j, j+1);
            }
        }
    }
}

//鸡尾酒排序
void CocktailSort(int A[], int n){
    
    int left = 0;
    int right = n-1;
    
    while (left < right) {
        layer1Count++;
        for (int i = left; i < right; i++){
            layer2Count ++;
            if(A[i] > A[i+1]){
                Swap(A, i, i+1);
            }
        }
        right--;
        for (int i = right; i > left; i--) {
            layer2Count++;
            if(A[i] < A[i-1]){
                Swap(A, i, i-1);
            }
        }
        left++;
    }
}

//选择排序
void SelectionSort(int A[], int n){
    
    for(int i = 0; i < n; i++){
        layer1Count ++;
        int min = i;
        for(int j = i+1; j<n; j++){
            layer2Count++;
            if(A[min] > A[j]){
                min = j;
            }
        }
        if(i != min){
            Swap(A, i, min);
        }
    }
}

//插入排序
void InsertionSort(int A[], int n){
    
    for (int i = 1; i<n; i++){
        layer1Count++;
        int get = A[i];
        int j = i - 1;
        while (j>=0 && get < A[j]) {
            layer2Count++;
            A[j+1] = A[j];
            j--;
        }
        A[j+1] = get;
    }
}

//二分插入排序
void InsertionSortDichotomy(int A[], int n){
    
    for(int i=1; i<n; i++){
        layer1Count++;
        int get = A[i];
        int left = 0;
        int right = i-1;
        while (left<=right) {
            layer2Count++;
            int min = (left+right)/2;
            if(get<A[min]){
                right = min - 1;
            }else{
                left = min + 1;
            }
        }
        
        for (int j = i-1; j>=left; j--) {
            layer2Count++;
            A[j+1] = A[j];
        }
        A[left] = get;
    }
}

//希尔排序
void ShellSort(int A[], int n)
{
    int h = 0;
    while (h <= n)                          // 生成初始增量
    {
        h = 4 * h + 1;
    }
    printf("初始增量 = %d \n",h);
    while (h >= 1)
    {
        for (int i = h; i < n; i++)
        {
            int j = i - h;
            int get = A[i];
            while (j >= 0 && A[j] > get)
            {
                A[j + h] = A[j];
                j = j - h;
            }
            A[j + h] = get;
        }
        h = (h - 1) / 4;                    // 递减增量
    }
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        int array[] = {6, 5, 3, 1, 8, 7, 2, 4};
        int n = sizeof(array)/sizeof(array[0]);
        
        //冒泡排序
//        BubbleSort(array,n);
        
        //鸡尾酒排序
//        CocktailSort(array, n);
        
        //选择排序
//        SelectionSort(array, n);
        
        //插入排序
//        InsertionSort(array, n);
        
        //二分插入排序
//        InsertionSortDichotomy(array, n);
        
        //希尔排序
        ShellSort(array, n);
        
        //输出排序结果
        for(int i = 0; i<n; i++){
            printf("%d\n",array[i]);
        }
        
        //输出交换次数
        printf("swapCount = %d\n",swapCount);
        //输出第一层循环次数
        printf("layer1Count = %d\n",layer1Count);
        //输出第二层循环次数
        printf("layer2Count = %d\n",layer2Count);

    }
    return 0;
}



