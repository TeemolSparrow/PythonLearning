import pygame


class Ship(pygame.sprite.Sprite):
    def __init__(self, ai_settings, screen):
        super().__init__()
        # 加载配置
        self.ai_settings = ai_settings

        # 加载屏幕
        self.screen = screen

        # 加载飞船图像并获取其外接矩形
        self.image = pygame.image.load('..\\resources\\images\\ship.bmp')
        self.rect = self.image.get_rect()

        # 将飞船放在屏幕底部
        self.screen_rect = screen.get_rect()
        self.rect.centerx = self.screen_rect.centerx
        self.rect.bottom = self.screen_rect.bottom

        self.center = float(self.rect.centerx)

        # 移动标识
        self.moving_left = False
        self.moving_right = False

    def draw_ship(self):
        # 在指定位置绘制飞船
        self.screen.blit(self.image, self.rect)

    def update_ship_position(self):
        if self.moving_left and self.rect.centerx > 0:
            self.center -= self.ai_settings.ship_speed
        if self.moving_right and self.rect.centerx < self.screen_rect.right:
            self.center += self.ai_settings.ship_speed

        self.rect.centerx = self.center

    def center_ship(self):
        self.center = self.screen_rect.centerx
