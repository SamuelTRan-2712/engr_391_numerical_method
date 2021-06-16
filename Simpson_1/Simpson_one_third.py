import math


# NOTE: The shorter the distance between a & b are, the more correct the result will
# be since integral is calculated as the area below the curve
def sin(x):  # function to define str 'sin' as mathematical sin() operation
    return math.sin(x)


def cos(x):  # function to define str 'cos' as mathematical cos() operation
    return math.cos(x)


def ln(x):  # function to define str 'ln' as mathematical ln() operation
    return math.log(x)


def log(x):  # function to define str 'log' as mathematical log() operation
    return math.log10(x)


def e(x):  # function to define str 'e' as mathematical e() operation
    return math.exp(x)


def simpson_one_third(a, b, f_string):  # function to evaluate an integral using Simpson 1/3
    f_a = eval(f_string.replace('x', 'a'))  # calculate f(a)
    f_b = eval(f_string.replace('x', 'b'))  # calculate f(b)
    c = (a + b) / 2  # use the variable c as a midpoint
    f_c = eval(f_string.replace('x', 'c'))  # calculate f(c) or f(midpoint)
    I = ((b - a) / 6) * (f_a + 4 * f_c + f_b)  # Integrals are then calculated as follow
    return I


f_x = " ln(x) "
print(simpson_one_third(1, 2, f_x))
