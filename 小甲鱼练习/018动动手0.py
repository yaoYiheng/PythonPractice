str1 = input('请输入目标字符串:') 
str2 = input('请输入子字符串:')
count = 0 #初始计数
for each in str2 : #
    if each in str1 :
        count += 1
print('子字符串在目标字符串中共出现'+str(count)+'次')
