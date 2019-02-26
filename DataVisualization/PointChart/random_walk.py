import matplotlib.pyplot as plt

from random import choice


class RandomWalk:
    """生成随机漫步数据"""

    def __init__(self, num_points=5000):
        self.num_points = num_points
        self.x_values = [0]
        self.y_values = [0]

    def fill_walk(self):
        """计算随机漫步包含的所有点"""

        # 不断漫步，直到列表达到指定长度
        while len(self.x_values) < self.num_points:
            # 决定前进方向以及沿这个方向前进的距离
            x_direction = choice([1, -1])
            x_distance = choice([0, 1, 2, 3, 4])
            x_step = x_direction * x_distance

            y_direction = choice([1, -1])
            y_distance = choice([0, 1, 2, 3, 4])
            y_step = y_direction * y_distance

            # 排除原地踏步
            if x_step == 0 and y_step == 0:
                continue

            # 计算下一个点的x和y值
            next_x = self.x_values[-1] + x_step
            next_y = self.y_values[-1] + y_step

            self.x_values.append(next_x)
            self.y_values.append(next_y)


def start_walk():
    while True:
        random_walk = RandomWalk(50000)
        random_walk.fill_walk()
        point_numbers = list(range(random_walk.num_points))

        # 设置绘图窗口尺寸
        plt.figure(figsize=(10, 6))

        # 绘制漫步点
        plt.scatter(random_walk.x_values, random_walk.y_values, c=point_numbers, cmap=plt.cm.Reds, edgecolors='none', s=1)

        # 突出起点和终点
        plt.scatter(0, 0, c='green', edgecolors='none', s=20)
        plt.scatter(random_walk.x_values[-1], random_walk.y_values[-1], c='blue', edgecolors='none', s=20)

        plt.show()

        keep_running = input("Make another walk?(y/n):")
        if keep_running == 'n':
            break


start_walk()
