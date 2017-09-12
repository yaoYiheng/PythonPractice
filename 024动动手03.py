def age(n):
    if n == 1:
        return 10
    else:
        return age(n -1)+2

n = int(input('请输入人数:'))
age = age(n)
print('第%d个人的岁数是%d'%(n,age))
