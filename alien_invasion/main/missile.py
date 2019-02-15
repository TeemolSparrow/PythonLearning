import pygame


class Missile(pygame.sprite.Sprite):
    def __init__(self, ai_settings, screen, ship):
        super().__init__()
        self.screen = screen

        # 加载导弹图片
        self.image = pygame.image.load('..\\resources\\images\\missile.bmp')

        self.rect.centerx = ship.rect.centerx
        self.rect.top = ship.rect.top
        self.speed = ai_settings.bullet_speed

    def update(self):
        self.rect.y -= self.speed

    def check_boundary_y(self):
        """判断导弹是否到达上边界(True:到达; False:未到达)"""
        if self.rect.bottom <= 0:
            return True
        return False

    def draw_missile(self):
        self.screen.blit(self.image, self.rect)


