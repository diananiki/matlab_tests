import sympy as sp

def euly(fun, t1, t2, x1, x2):
    t = sp.Symbol('t')
    x = sp.Function('x')(t)
    x_prime = x.diff(t)
    # лагранжиан
    L = fun.subs({'x(t)': x, 'Derivative(x(t), t)': x_prime})
    # производные
    dL_dx = sp.diff(L, x)
    dL_dx_prime = sp.diff(L, x_prime)
    dL_dx_prime_dt = sp.diff(dL_dx_prime, t)
    # уравнение Эйлера-Лагранжа
    euler_lagrange_eq = sp.Eq(dL_dx - dL_dx_prime_dt, 0)
    sol = sp.dsolve(euler_lagrange_eq, x)
    # константы
    constants = sol.free_symbols - {x}
    # граничные условия
    boundary_conditions = [
        sp.Eq(sol.rhs.subs(t, t1), x1),
        sp.Eq(sol.rhs.subs(t, t2), x2)
    ]
    constants_values = sp.solve(boundary_conditions, constants)
    final_solution = sol.subs(constants_values)

    return final_solution.rhs