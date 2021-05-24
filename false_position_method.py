import math

def sin(x):
    return math.sin(x)

def cos(x):
    return math.cos(x)

def ln (x):
    return math.log(x)

def log (x):
    return math.log10(x)

def e(x):
    return math.exp(x)

def false_position_method (a, b, relative_tolerance, f_string):

    f_a = eval(f_string.replace('x', 'a')) # calculate f(a)
    f_b = eval(f_string.replace('x', 'b'))  # calculate f(b)

    c = ( (a * f_b) - (b * f_a) ) / (f_b- f_a) # calculate c based on f(a) & f(b)

    f_c = eval(f_string.replace('x', 'c')) # calculate f(c)

    relative_error = ( (b-a) / 2 ) / c  # calculate relative error

    while relative_error >= relative_tolerance: # this loop will stop when relative_error is less than the given tolerance

        if (f_a * f_c) < 0: # if f(a)*f(b) < 0, b1 = c0 (This is to narrow down the upper bound --> smaller interval)
            b = c
        else:   # vice versa
            a = c

        f_a = eval(f_string.replace('x', 'a')) # calculate f(a) so we can calculate c
        f_b = eval(f_string.replace('x', 'b'))  # calculate f(b) so we can calculate c

        c = ( (a * f_b) - (b * f_a) ) / (f_b- f_a) # calculate c so we can calculate relative error

        f_c = eval(f_string.replace('x', 'c'))

        relative_error = ( (b-a) / 2 ) / c  # calculate relative error so we know if it's less than the tolerance

        return a, b, c, relative_error

f_string = "sin(2*x) - log(x)" # f(x) has to have the format like this, remember trigonometry hasn't worked yet, also log, e,...
x1, x2, x3, x4 = false_position_method(0.5, 1.8, 0.0000000001, f_string)

print(x3, "+/-", x4) # return result +- relative error
exit()
