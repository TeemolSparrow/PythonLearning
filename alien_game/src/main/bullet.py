import pygame


class Bullet(pygame.sprite.Sprite):
    def __init__(self, ai_settings, screen, ship):
        super().__init__()
        self.screen = screen

        # 初始化子弹
        self.rect = pygame.rect(0, 0, ai_settings.bullet_width, ai_settings.bullet_height)
        self.rect.centerx = ship.rect.centerx
        self.rect.top = ship.rect.top
        self.place = float(self.rect.y)
        self.color = ai_settings.bullet_color
        self.speed = ai_settings.bullet_speed

    def update(self):
        self.rect.y -= self.speed

    def draw_bullet(self):
        pygame.draw.rect(self.screen, self.color, self.rect)
