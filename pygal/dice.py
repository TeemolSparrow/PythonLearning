import pygal


from random import randint


class Dice:
    """骰子类"""

    def __init__(self, num_sides=6):
        # 骰子默认6个面
        self.num_sides = num_sides

    def roll(self):
        # 返回一个介于1和骰子面数的随机值
        return randint(1, self.num_sides)


def dice_visual(dice_1_sides=6, dice_2_sides=6, times=100):
    # 同时投掷两个骰子
    dice_1 = Dice(dice_1_sides)
    dice_2 = Dice(dice_2_sides)

    # 生成结果
    results = []
    for roll_num in range(times):
        result = dice_1.roll() + dice_2.roll()
        results.append(result)

    # 分析结果
    frequencies = []
    max_result = dice_1.num_sides + dice_2.num_sides
    for value in range(1, max_result+1):
        frequency = results.count(value)
        frequencies.append(frequency)

    # 对结果进行可视化
    hist = pygal.Bar()
    hist.title = "Result of rolling one " + str(dice_1_sides) + " sides dice and one " + str(dice_2_sides) + " sides dice " + str(times) + " times."
    hist.x_labels = []
    for value in range(1, max_result+1):
        hist.x_labels.append(value)
    print(hist.x_labels)
    hist.x_title = "Result"
    hist.y_title = "Frequency of result"

    hist.add(None, frequencies)
    hist.render_to_file("Dice_Visual.svg")


dice_visual(6, 10, 1000)
