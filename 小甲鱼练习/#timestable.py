for row in range(1,10):
    for col in range(1,10):
        if row*col < 10:
            print(' ',end = '')
        print('%s * %s = %s'%(row,col,row*col),' ',end = ' ')
    print()
