import math
def dist(x,y,a,b):
    s = (x - a) ** 2 + (y - b) ** 2
    return math.sqrt(s)
def rect_area(x,y,a,b):
    width = abs(x - a)
    height = abs(y - b)
    return width * height
