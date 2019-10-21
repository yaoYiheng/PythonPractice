password = input('请输入需要检查的密码组合:')
special_code = "!@#$%^&*()_=/,.?<>;:\[]{}"
special_code1 = special_code.split()
if (password[0].isalpha() and password.isalnum() and len(password) >= 16) and (password in special_code1):
    print('您的密码安全级别评定为:高')
    print('请继续保持')
else:
    if (password.isalnum() or password in special_code1) and len(password) >= 8 :
        print('您的密码安全级别评定为:中')
    elif password.isalnum() or len(password) <= 8:
        print('您的密码安全级别评定为:低')
    print('请按一下方式提升您的密码安全级别:')
    print('\t1.密码必修由数字,字母以及特殊字符三种组合\n\t2.密码只能由字母开头\n\t3.密码长度不能低于16位')
