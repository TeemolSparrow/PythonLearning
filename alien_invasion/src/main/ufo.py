import pygame


class UFO(pygame.sprite.Sprite):
    def __init__(self, ai_settings, screen):
        super().__init__()

        # 加载配置
        self.ai_settings = ai_settings

        # 加载屏幕
        self.screen = screen

        # 加载UFO图像并获取其外接矩形
        self.image = pygame.image.load('..\\resources\\images\\ufo.bmp')
        self.rect = self.image.get_rect()

        # UFO初始位置为屏幕左上角附近
        self.rect.x = self.rect.width
        self.rect.y = self.rect.height

        # 存储UFO的准确位置
        self.x = float(self.rect.x)

    def blit_ufo(self):
        self.screen.blit(self.image, self.rect)

