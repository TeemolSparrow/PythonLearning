import csv

from matplotlib import pyplot as plt
from datetime import datetime


def read_header(filename):
    with open(filename) as file:
        reader = csv.reader(file)
        # 读取文件头
        header_row = next(reader)
        # 打印文件头
        for index, colum_header in enumerate(header_row):
            print(index, colum_header)


def show_highs(filename):
    with open(filename) as file:
        reader = csv.reader(file)
        # 跳过首行
        next(reader)

        # 读取日期和最高气温
        dates, highs = [], []
        for row in reader:
            current_date = datetime.strptime(row[0], "%Y-%m-%d")
            dates.append(current_date)
            highs.append(int(row[1]))

        # 绘制最高气温图形
        fig = plt.figure(dpi=128, figsize=(10, 6))
        plt.plot(dates, highs, c='red')
        plt.title("Daily high and low temperatures", fontsize=24)
        plt.xlabel(None, fontsize=16)
        # 倾斜显示日期
        fig.autofmt_xdate()
        plt.ylabel("Temperature (F)", fontsize=16)
        plt.tick_params(axis='both', which='major', labelsize=16)
        plt.show()


def show_highs_and_lows(filename):
    with open(filename) as file:
        reader = csv.reader(file)
        # 跳过首行
        next(reader)

        # 读取日期、最高和最低气温
        dates, highs, lows = [], [], []
        for row in reader:
            try:
                current_date = datetime.strptime(row[0], "%Y-%m-%d")
                high = int(row[1])
                low = int(row[3])
            except ValueError:
                print(current_date, "Missing data")
            else:
                dates.append(current_date)
                highs.append(high)
                lows.append(low)

        # 绘制图形
        fig = plt.figure(dpi=128, figsize=(10, 6))
        plt.plot(dates, highs, c='red', alpha=0.5)
        plt.plot(dates, lows, c='blue', alpha=0.5)
        plt.fill_between(dates, highs, lows, facecolor='blue', alpha=0.1)
        plt.title("Daily high and low temperatures", fontsize=24)
        plt.xlabel('', fontsize=16)
        fig.autofmt_xdate()
        plt.ylabel("Temperature (F)", fontsize=16)
        plt.tick_params(axis='both', which='major', labelsize=16)
        plt.show()


show_highs('weather_sitka_2014-07.csv')
show_highs('weather_sitka_2014.csv')
show_highs_and_lows('weather_sitka_2014.csv')
show_highs_and_lows('weather_death_valley_2014.csv')
