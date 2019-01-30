import pygame


class UFO(pygame.sprite.Sprite):
    def __init__(self, ai_settings, screen):
        super().__init__()
        self.ai_settings = ai_settings
        self.screen = screen

        # 加载UFO图像并获取其外接矩形
        self.image = pygame.image.load('..\\resources\\images\\ufo.bmp')
        self.rect = self.image.get_rect()

        # 加载UFO移动速度
        self.speed_x = ai_settings.ufo_speed_x

        # 加载UFO移动方向(1:右移动; -1:左移)
        self.direction = 1

    def update(self):
        if self.check_boundary_x():
            # 变更平移方向
            self.direction = -self.direction
            # 到达边界下移
            self.rect.y += self.ai_settings.ufo_speed_y
        # 水平移动
        self.rect.x += (self.speed_x * self.direction)

    def check_boundary_x(self):
        """判断UFO是否到达左右边界(True:到达; False:未到达)"""
        if self.rect.right >= self.screen.get_rect().right:
            return True
        elif self.rect.left < 0:
            return True
        else:
            return False

    def draw_ufo(self):
        self.screen.blit(self.image, self.rect)

