import math
def area_triangle_sss(side1,side2,side3):
    """
    Return area of a triangle, given the lenths of its three sides.
    """
    #Heron's formula
    semi_perim = (side1 + side2 + side3)/2.0
    return math.sqrt(semi_perim *
                     (semi_perim - side1) *
                     (semi_perim - side2) *
                     (semi_perim - side3))
