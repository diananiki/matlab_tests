from math import *
def berni(n, k):
    C_nk = factorial(n) / (factorial(k) * factorial(n - k))
    return lambda x: C_nk * x**k * (1 - x)**(n - k)

print(berni(4, 3))