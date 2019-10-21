def hannoi(n,x,y,z):
    if n == 1:
        print(x,"-->",z)
    else:
        hannoi(n-1,x,z,y)
        print(x,'-->',z)
        hannoi(n-1,y,x,z)
n = int(input('please enter the level of hannoi:'))
hannoi(n,'1','2','3')
