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


def Composite_simpson_one_third(m, a, b, f_string):
    h = (b - a) / m  # calculate the step size
    x = a  # set the first xi = a
    f_x_array = []  # initialize the array that contains f(xi) as xi+1 = xi + h

    for i in range(0, m - 1):  # run the loop from 0 --> m-1
        x = x + h  # xi+1 = xi + h
        temp = x  # every time after getting xi, save it in temp so when we calculate xi+1, the value of xi doesnt
        # vanish away
        f_temp = eval(f_string.replace("t", "temp"))  # calculate f(xi), which is f(temp) now after saving each xi
        # to temp
        f_x_array.append(f_temp)  # save f(xi) in the array f_x_array where the first index of f_x_array = 0. That
        # mean, f(x1) = f_x_array[0]

    total_odd = 0  # set the total of f(xi) where i is odd number to 0

    for j in range(0, len(f_x_array)):  # run the loop from 0 --> the length of the array, which is equal to the
        # number of elements it has

        if j % 2 == 0:  # if j is an even number, meaning that f(xi) where i is odd
            total_odd = total_odd + f_x_array[j]  # total of f(xi) where i is odd = the last calculated one +
            # f_x_array[j]

        if j % 2 != 0:  # skip if otherwise
            continue

    total_even = 0  # # set the total of f(xi) where i is even number to 0

    for k in range(0, len(f_x_array)):  # run the loop from 0 --> the length of the array, which is equal to the
        # number of elements it has

        if k % 2 != 0:  # if k is an odd number, meaning that f(xi) where i is even
            total_even = total_even + f_x_array[k]  # total of f(xi) where i is even = the last calculated one +
            # f_x_array[j]

        if k % 2 == 0:  # skip if otherwise
            continue

    f_a = eval(f_string.replace('t', 'a'))  # calculate f(a)
    f_b = eval(f_string.replace('t', 'b'))  # calculate f(b)

    I = (h / 3) * (f_a + f_b + 4 * total_odd + 2 * total_even)  # return the integral I

    return I


f_string = " 2000 * ln(140000/(140000-2100*t)) - 9.8*t "
print(Composite_simpson_one_third(4, 8, 30, f_string))
