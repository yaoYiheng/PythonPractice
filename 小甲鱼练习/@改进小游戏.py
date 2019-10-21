temp = input('不妨猜一下小甲鱼现在心里想的是哪个数字：')
guess = int(temp)
i = 4
while guess != 8 and i > 0:
    if guess == 8:
        print('right')
    else:            
        if guess > 8:
            print('bigger,try again')
        else:
            print('smaller,try again')
    guess = int(input('please enter again:'))
    i -=1
print('game over')
