total = 0
while True:
    s = input('Enter a number (or "done"):')
    if s =="done":
        break
    num = int(s)
    total = total + num
print('The sum is '+str(total))
