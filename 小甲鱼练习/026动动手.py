print('|---新建用户:N/n---|')
print('|---登录账号:E/e---|')
print('|---退出程序:Q/q---|')
data = dict()
decision = input('请输入指令代码:')

def new():
    name = input('请输入用户名:')
    
    if data[name] not in data:
        data[name] = input('请输入密码:')

        
    else:
        name1 = input('此用户名已经被使用,请重新输入:')
        data[name1] = input('请输入密码:')
        
    print('注册成功,赶紧登录试试吧:)')

if decision == 'N'or decision == 'n':
    new()
