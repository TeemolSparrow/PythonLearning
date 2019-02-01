class Settings:
    # 存储设置信息

    def __init__(self):

        # 屏幕设置
        self.screen_width = 800
        self.screen_height = 620
        self.bg_color = (255, 255, 255)

        # 飞船设置
        self.ship_speed = 1.5
        self.ship_limit = 3

        # 子弹设置
        self.bullet_speed = 1
        self.bullet_width = 10
        self.bullet_height = 10
        self.bullet_color = (60, 60, 60)
        self.bullet_allowed = 5

        # UFO设置
        self.ufo_speed_x = 1
        self.ufo_speed_y = 50

        # 加速增幅倍数
        self.speed_up = 1.1

    def init_setting(self):
        self.ufo_speed_x = 1
        self.ufo_speed_y = 50

    def increase_speed(self):
        self.ufo_speed_x *= self.speed_up
        self.ufo_speed_y *= self.speed_up
        print(str(self.ufo_speed_x), str(self.ufo_speed_y))
