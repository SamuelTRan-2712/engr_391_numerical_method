import math


# #  PLS, IF USE ^ FOR EXPONENTIAL, USE ** INSTEAD # THIS PROGRAM WORKS WITH ITERATION, NOT WITH GIVEN TOLERANCE #
# REQUIRE THE CHANGE OF F(x) & G(x) BECAUSE IT IS SO HARD TO CODE A FUNCTION WHERE IT DYNAMICALLY RETURNS X = G(X)
# FROM F(X) = 0


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


def fix_point_method(xi, relative_error, number_of_iteration,
                     f_x):  # define the first guessed value, given relative error and number of iterations required

    count = 1  # set counter to 1
    g_xi = 1 / math.sqrt(1 + xi)  # compute the first g(xi) where xi is the initial educated guess

    while count < number_of_iteration:  # while counter is less than number of iterations

        xi_plus_1 = g_xi  # assign the temp values xi+1 = g(xi)
        xi = xi_plus_1  # assign the value xi = the temp value xi+1
        g_xi = 1 / math.sqrt(1 + xi)  # compute g(xi) where xi = temp value xi+1. In the other word, xi = g(xi-1)
        count = count + 1  # increment counter

        if count > number_of_iteration:  # break if counter exceeds the number of iteration
            break

    return xi_plus_1, relative_error


f_x = " x**3 + x**2 - 1 "  # EXAMPLE OF F(X)
x_0, x_1 = fix_point_method(2, 0.00001, 10, f_x)  # RETURN THE RESULT
print(x_0, "+/-", x_1)
