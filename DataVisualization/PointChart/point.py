import matplotlib.pyplot as plt


def one_point():
    # 绘制一个点
    plt.scatter(2, 4, s=200)
    plt.title("Square Numbers", fontsize=24)
    plt.xlabel("Value", fontsize=14)
    plt.ylabel("Square of value", fontsize=14)
    plt.tick_params(axis='both', which='major', labelsize=14)
    plt.show()


def multi_points():
    # 绘制多个点
    values = [1, 2, 3, 4, 5]
    squares = [1, 4, 9, 16, 25]
    plt.title("Square Numbers", fontsize=24)
    plt.xlabel("Value", fontsize=14)
    plt.ylabel("Square of value", fontsize=14)
    plt.tick_params(axis='both', labelsize=14)
    plt.plot(values, squares, linewidth=5)
    plt.show()


def random_points():
    x_values = list(range(1, 50))
    y_values = [x ** 2 for x in x_values]

    plt.scatter(x_values, y_values, c=y_values, cmap=plt.cm.Blues, edgecolor='none', s=10)
    plt.axis([0, 50, 0, 2500])
    plt.show()


one_point()
multi_points()
random_points()
