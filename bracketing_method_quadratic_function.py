import math


def bracketing_method_quadratic_function(a, b, tolerance, n, m, l):
    c = (a + b) / 2  # mid point for every interval we cut down, c will get smaller and smaller as the interval got
    # cut down and up some point, c will be close enough to the roots with acceptable error which is less than the
    # tolerance

    f_a = n * (a ** 2) + m * a + l  # calculate f(a)
    f_b = n * (b ** 2) + m * b + l  # calculate f(b)
    f_c = n * (c ** 2) + m * c + l  # calculate f(c)
    absolute_error = abs((b - a) / 2)  # calculate the absolute error after every trial

    while absolute_error >= tolerance:  # while absolute error is bigger than the given tolerance

        if (f_a * f_c) < 0:  # if f(a) * f(c) < 0, meaning there is a root some where in the new interval where a = a
            # and b = c
            b = c
        else:
            a = c

        c = (a + b) / 2  # that being said, c gets smaller and closer to the real root
        absolute_error = abs((b - a) / 2)  # absolute value also changes based on new a or new b

        f_a = n * (a ** 2) + m * a + l  # calculate f(a)
        f_b = n * (b ** 2) + m * b + l  # calculate f(b)
        f_c = n * (c ** 2) + m * c + l  # calculate f(c)

    return a, b, c, absolute_error  # note that a,b is the most precise interval where it contains the acceptable root c


x1, x2, x3, x4 = bracketing_method_quadratic_function(-2, 2, 0.005, 2, 0, -3)  # x3 is the result close enough to
# the root
# with +/- absolute error

print(x3, "+/-", x4)
