class Person():
    """Class to represent a person"""

    def __init__(self,name = '',age = 0):
        self.name = name
        self.age = age

    def display(self):
        print("Person('%s',%s)" %(self.name,self.age))

    def fun(self):
        print('Hello,My name is"%s" I am %s years old'%(self.name,self.age))
