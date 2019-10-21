#!/usr/bin/python
## -*- coding: UTF-8
print('|---欢迎进入通讯录程序---|')
print('|---1:查询联系人资料 ---|')
print('|---2:插入新的联系人 ---|')
print("|---3:删除已有联系人 ---|")
print('|---4:退出通讯录程序 ---|')
print()

contact = dict()

while True :   
    n = int(input("\n请输入相关指令代码:"))
    
    if n == 1:
        name = input('请输入联系人姓名:')
        if name in contact:
            print(name + ':' +contact[name])
        else:
            print('您输入的姓名不在通讯录中!')
            
    if n == 2:
        name = input('请输入联系人姓名:')
        if name in contact :
            print('您输入的姓名在通讯录中已存在-->',end ='')
            print(name +' : '+contact[name])
            if input('是否修改用户资料(YES/NO):') == 'YES':
                contact[name] = input('请输入用户联系电话:')
        else:
            contact[name] = input('请输入用户联系电话:')
            
    if n == 3:
        name = input('请输入联系人姓名:')
        if name in contact:
            del contact[name]
        else:
            print('您输入的联系人不存在')

    if n == 4:
        break

print("|--- 感谢使用通讯录程序 ---|")
        
