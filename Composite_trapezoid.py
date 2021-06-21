import math


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


def tan(x):  # function to define str 'tan' as mathematical e() operation
    return math.tan(x)


def cot(x):  # function to define str 'cot' as mathematical e() operation
    return 1 / math.tan(x)


def arcsin(x):  # function to define str 'arcsin' as mathematical e() operation
    return math.asin(x)


def arccos(x):  # function to define str 'arccos' as mathematical e() operation
    return math.acos(x)


def arctan(x):  # function to define str 'arctan' as mathematical e() operation
    return math.atan(x)


def arccot(x):  # function to define str 'arccot' as mathematical e() operation
    return 1 / math.atan(x)


def Composite_trapezoid(m, a, b, f_string):
    h = (b - a) / m  # calculate the step size
    f_x = 0  # initialize f(xi) = 0
    f_x_array = []  # initialize the array to contains f(xi) as xi+1 = xi + h
    x = a  # the first xi to be equal to a

    for i in range(0, m - 1):  # run the loop that starts from 0 --> m-1
        x = x + h  # xi+1 = xi + h
        temp = x  # every time after getting xi, save it in temp so when we calculate xi+1, the value of xi doesnt
        # vanish away
        f_temp = eval(f_string.replace('t', 'temp'))  # calculate f(xi) now is f(temp) after saving each xi to temp
        f_x = f_x_array.append(f_temp)

    total = 0

    for i in range(0, len(f_x_array)):
        total = total + f_x_array[i]

    f_a = eval(f_string.replace('t', 'a'))  # calculate f(a)
    f_b = eval(f_string.replace('t', 'b'))  # calculate f(b)

    I = (h / 2) * (f_a + f_b + 2 * total)

    return I


f_string = " 2000 * ln(140000/(140000-2100*t)) - 9.8*t "
print(Composite_trapezoid(4, 8, 30, f_string))
