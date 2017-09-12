def hanoi(n,a,b,c):
    if n == 1:
        print(a,'-->',c)
    else:
        hanoi(n-1,a,c,b) #将前 n - 1个盘子从a移动到b上
        print(a,'-->',c) #将最底下的最后一个盘子从a移动到c上
        hanoi(n-1,b,a,c) #将y上的n-1个盘子移动到c上

n = int(input('请输入汉诺塔的层数:'))
hanoi(n,'A','B','C')
