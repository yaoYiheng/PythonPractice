def sents(n):
    list1 = list(n)
    list2 = reversed(list1)
    if  list1 == list(list2):
        return'是回文联'
    else:
        return'不是回文联!'
n = input('请输入一句话:')
print(sents(n))
