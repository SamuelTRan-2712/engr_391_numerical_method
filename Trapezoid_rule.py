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


def trapezoid(a, b, f_string):  # function demonstrating the integration of f_x using Trapezoid rule
    f_a = eval(f_string.replace('x', 'a'))  # calculate f(a)
    f_b = eval(f_string.replace('x', 'b'))  # calculate f(b)
    I = (b - a) * ((f_a + f_b) / 2)  # calculate the results
    return I


f_x = " ln(x) "  # write the functions you wanna use in here

print(trapezoid(1, 2, f_x))
