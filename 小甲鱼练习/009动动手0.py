password = input('please the password:')
i = 3
while password != "Fish.com":
    if "*" in str(password):
        print('"*" cannot in the password! You have'+str(i)+' chances!')
        input('please enter the password:')
    else:
        print('wrong password! You have'+str(i)+' chances!')
        input('please enter the password:')
    i -=1
print('right,loggin..')
