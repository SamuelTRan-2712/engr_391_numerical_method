import math

var = ('             Approximate solution of f(x)=0 by Newton\'s method.\n'
       '    Parameters\n'
       '    ----------\n'
       '    f_x : function\n'
       '        Function for which we are searching for a solution f(x)=0.\n'
       '    Df_x : function\n'
       '        Derivative of f(x).\n'
       '    x0 : number\n'
       '        Initial guess for a solution f(x)=0.\n'
       '    given_tolerance : number\n'
       '        Stopping criteria is abs(f(x)) < given_tolerance.\n'
       '    max_iteration : integer\n'
       '        Maximum number of iterations of Newton\'s method.\n'
       '\n'
       '    Returns\n'
       '    -------\n'
       '    xn : number\n'
       '        Implement Newton\'s method: compute the linear approximation\n'
       '        of f(x) at xn and find x intercept by the formula\n'
       '            x = xn - f(xn)/Df(xn)\n'
       '        Continue until abs(f(xn)) < given_tolerance and return xn.\n'
       '        If Df(xn) == 0, return None. If the number of iterations\n'
       '        exceeds max_iter, then return None.\n'
       '        \n'
       '    ')


def newton_method(f_x, Df_x, x0, given_tolerance, max_iteration):
    xn = x0
    Df_xn = Df_x(xn)

    for n in range(0, max_iteration):

        fxn = f_x(xn)

        if abs(fxn) < given_tolerance:
            print('Found solution after', n, 'iterations.')
            return xn

        Df_xn = Df_x(xn)

        if Df_xn == 0:
            print('Zero derivative. No solution found.')
            return None

        xn = xn - fxn / Df_xn

    print('Exceeded maximum iterations. No solution found.')
    return None


f_x = lambda x: x ** 3 - x ** 2 - 1  # modify the function f(x) = 0 here
Df_x = lambda x: 3 * x ** 2 - 2 * x  # modify derivative of f(x) here

approx = newton_method(f_x, Df_x, 1, 1e-10, 10)

print(approx)
