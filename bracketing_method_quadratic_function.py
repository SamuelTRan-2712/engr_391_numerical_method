import math

def bracketing_method_quadratic_function(a, b, tolerance, fstr):
    c = (a + b) / 2  # mid point for every interval we cut down, c will get smaller and smaller as the interval got
    # cut down and up some point, c will be close enough to the roots with acceptable error which is less than the
    # tolerance

    f_a = eval(fstr.replace('x', 'a'))
    f_b = eval(fstr.replace('x', 'b'))
    f_c = eval(fstr.replace('x', 'c'))

    absolute_error = abs((b - a) / 2)  # calculate the absolute error after every trial

    while absolute_error >= tolerance:  # while absolute error is bigger than the given tolerance

        if (f_a * f_c) < 0:  # if f(a) * f(c) < 0, meaning there is a root some where in the new interval where a = a
            # and b = c
            b = c
        else:
            a = c

        c = (a + b) / 2  # that being said, c gets smaller and closer to the real root
        absolute_error = abs((b - a) / 2)  # absolute value also changes based on new a or new b

        f_a = eval(fstr.replace('x', 'a'))  # calculate f(a)
        f_b = eval(fstr.replace('x', 'b'))  # calculate f(b)
        f_c = eval(fstr.replace('x', 'c'))  # calculate f(c)

    return a, b, c, absolute_error  # note that a,b is the most precise interval where it contains the acceptable root c


fstr = " -x - 6*x - 5 "
x1, x2, x3, x4 = bracketing_method_quadratic_function(-2, 0, 10 ** (-8), fstr)  # x3 is the result close enough to
# the root
# with +/- absolute error

print(x3, "+/-", x4)
exit()
