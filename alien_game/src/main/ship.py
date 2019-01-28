import pygame


class Ship:
    def __init__(self, screen):
        # 初始化飞船位置
        self.screen = screen

        # 加载飞船图像并获取其外接矩形
        self.image = pygame.image.load('..\\resources\\images\\ship.bmp')
        self.rect = self.image.get_rect()
        self.screen_rect = screen.get_rect()

        # 将飞船放在屏幕底部
        self.rect.centerx = self.screen_rect.centerx
        self.rect.bottom = self.screen_rect.bottom

    def blit_ship(self):
        # 在指定位置绘制飞船
        self.screen.blit(self.image, self.rect)
