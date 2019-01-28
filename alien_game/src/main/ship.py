import pygame


class Ship:
    def __init__(self, ai_settings, screen):
        # 加载配置
        self.ai_settings = ai_settings

        # 初始化飞船位置
        self.screen = screen

        # 加载飞船图像并获取其外接矩形
        self.image = pygame.image.load('..\\resources\\images\\ship.bmp')
        self.rect = self.image.get_rect()
        self.screen_rect = screen.get_rect()

        # 将飞船放在屏幕底部
        self.rect.centerx = self.screen_rect.centerx
        self.rect.bottom = self.screen_rect.bottom

        self.center = float(self.rect.centerx)

        # 移动标识
        self.moving_left = False
        self.moving_right = False

    def blit_ship(self):
        # 在指定位置绘制飞船
        self.screen.blit(self.image, self.rect)

    def update_position(self):
        if self.moving_left and self.rect.centerx > 0:
            self.center -= self.ai_settings.ship_speed
        if self.moving_right and self.rect.centerx < self.screen_rect.right:
            self.center += self.ai_settings.ship_speed

        self.rect.centerx = self.center
