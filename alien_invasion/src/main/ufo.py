import pygame


class UFO(pygame.sprite.Sprite):
    def __init__(self, ai_settings, screen):
        super().__init__()
        self.screen = screen

        # 加载UFO图像并获取其外接矩形
        self.image = pygame.image.load('..\\resources\\images\\ufo.bmp')
        self.rect = self.image.get_rect()

        # 加载UFO移动速度
        self.speed_x = ai_settings.ufo_speed_x

    def update(self):
        self.rect.x += self.speed_x

    def draw_ufo(self):
        self.screen.blit(self.image, self.rect)

