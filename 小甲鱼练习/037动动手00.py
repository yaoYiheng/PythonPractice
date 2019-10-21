class Ticket:
    weekday = 100
    weekend = 1.2 * weekday
    children = 0.5 * weekday
    
    def adult(self):
        print("请输入成人人数:")
        self.adult = int(input('人数为:'))
        
    def children(self):
        print('请输入小孩人数')
        self.children = int(input('人数为:'))

    def getPrice(self):
        return 100 * self.adult + 50 * self.children
