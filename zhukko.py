import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

def zhukko(side_length, speed):
    positions = np.array([[0, 0], [side_length, 0], [side_length, side_length], [0, side_length]])

    def equations(t, y):
        y = y.reshape(4, 2)
        dydt = np.zeros_like(y)
        for i in range(4):
            j = (i + 1) % 4
            distance = np.hypot(y[j, 0] - y[i, 0], y[j, 1] - y[i, 1])
            dydt[i, 0] = speed * (y[j, 0] - y[i, 0]) / distance
            dydt[i, 1] = speed * (y[j, 1] - y[i, 1]) / distance
        return dydt.flatten()

    y0 = positions.flatten()
    t_span = (0, side_length / speed)
    sol = solve_ivp(equations, t_span, y0, t_eval=np.linspace(0, side_length / speed, 500))
    sol_y = sol.y.reshape(4, 2, -1)

    plt.figure(figsize=(8, 8))
    labels = ['Первый мураш', 'Второй мураш', 'Еще один мураш', 'Последний мураш']
    for i in range(4):
        plt.plot(sol_y[i, 0], sol_y[i, 1], label=labels[i])
    plt.scatter(positions[:, 0], positions[:, 1], color='red')
    plt.xlim(-side_length * 0.1, side_length * 1.1)
    plt.ylim(-side_length * 0.1, side_length * 1.1)
    plt.title('Мураши')
    plt.xlabel('X')
    plt.ylabel('Y')
    plt.legend()
    plt.grid(True)
    plt.show()