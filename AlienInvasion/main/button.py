import pygame


class Button:
    def __init__(self, screen, message):
        self.screen = screen
        self.screen_rect = screen.get_rect()

        # 设置按钮属性
        self.width = 200
        self.height = 50
        self.button_color = (200, 200, 200)
        self.text_color = (255, 255, 255)
        self.text_font = pygame.font.SysFont(None, 48)

        # 创建按钮rect对象，并使其居中
        self.rect = pygame.Rect(0, 0, self.width, self.height)
        self.rect.center = self.screen_rect.center

        # 创建按钮标签
        self.message_image = self.text_font.render(message, True, self.text_color, self.button_color)
        self.message_image_rect = self.message_image.get_rect()
        self.message_image_rect.center = self.rect.center

    def draw_button(self):
        self.screen.fill(self.button_color, self.rect)
        self.screen.blit(self.message_image, self.message_image_rect)
