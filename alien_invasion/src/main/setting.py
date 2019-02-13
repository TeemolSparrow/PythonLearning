class Settings:
    # 存储设置信息

    def __init__(self):

        # 屏幕设置
        self.screen_width = 800
        self.screen_height = 620
        self.bg_color = (255, 255, 255)

        # 飞船设置
        self.ship_speed = 1
        self.ship_limit = 3

        # 子弹设置
        self.bullet_speed = 1
        self.bullet_width = 10
        self.bullet_height = 10
        self.bullet_color = (60, 60, 60)
        self.bullet_allowed = 5

        # UFO设置
        self.ufo_speed_x = 1
        self.ufo_speed_y = 30
        self.ufo_speed_up = 1.1
        self.ufo_points = 50
        self.ufo_points_up = 1.5

    def init_setting(self):
        self.ufo_speed_x = 1
        self.ufo_speed_y = 50
        self.ufo_points = 50

    def increase_ufo_speed(self):
        self.ufo_speed_x *= self.ufo_speed_up
        self.ufo_speed_y *= self.ufo_speed_up
        print("Speed x:" + str(self.ufo_speed_x) + "     Speed y:" + str(self.ufo_speed_y))

    def increase_ufo_points(self):
        self.ufo_points = int(self.ufo_points * self.ufo_points_up)
        print("UFO points: " + str(self.ufo_points))


