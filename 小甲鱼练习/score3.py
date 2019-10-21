s = input('type any score to begin:')
while s != "done":
    s = int(s)
    if 100 >s >=90:
        result = 'A'
        print(result)
        s = input('enter your score or"done":')
    elif 80 <=s<90:
        result = "B"
        print(result)
        s = input('enter your score or"done":')
    elif 70 <= s <80:
        result = 'C'
        print(result) 
        s = input('enter your score or "done:"')
    elif 60 <= s < 70:
        result ='D'
        print(result)
        s = input('enter your score or "done:"')
    else :
        result = 'not passed'
        print(result)
        s = input('enter your score or"done"')
print('finish')

