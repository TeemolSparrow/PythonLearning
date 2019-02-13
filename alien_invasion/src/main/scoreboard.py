import pygame

import ship


class ScoreBoard:
    """显示得分信息类"""
    def __init__(self, ai_settings, status, screen):
        self.ai_settings = ai_settings
        self.status = status
        self.screen = screen

        self.text_font = pygame.font.SysFont(None, 20)
        self.text_color = (0, 0, 0)

        # 创建剩余飞船组图像
        self.remaining_ships = pygame.sprite.Group()
        for ship_number in range(self.status.ships_left):
            ship_temp = ship.Ship(self.ai_settings, self.screen)
            ship_temp.rect.x = 10 + ship_number * (ship_temp.rect.width + 5)
            ship_temp.rect.y = 0
            self.remaining_ships.add(ship_temp)

        # 创建最高分图像
        high_score_str = "Record: " + str(self.status.high_score)
        self.high_score_image = self.text_font.render(high_score_str, True, self.text_color, self.ai_settings.bg_color)
        self.high_score_image_rect = self.high_score_image.get_rect()
        self.high_score_image_rect.right = self.screen.get_rect().right - 20
        self.high_score_image_rect.top = 0

        # 创建得分图像
        score_str = "Score: " + str(self.status.score)
        self.score_image = self.text_font.render(score_str, True, self.text_color, self.ai_settings.bg_color)
        self.score_image_rect = self.score_image.get_rect()
        self.score_image_rect.right = self.screen.get_rect().right - 20
        self.score_image_rect.top = 15

        # 创建等级图像
        level_str = "Level: " + str(self.status.level)
        self.level_image = self.text_font.render(level_str, True, self.text_color, self.ai_settings.bg_color)
        self.level_image_rect = self.level_image.get_rect()
        self.level_image_rect.right = self.screen.get_rect().right - 20
        self.level_image_rect.top = 30

    def update_remaining_ships(self):
        for ship_number in range(self.status.ships_left):
            ship_temp = ship.Ship(self.ai_settings, self.screen)
            ship_temp.rect.x = 10 + ship_number * ship_temp.rect.width
            ship_temp.rect.y = 10
            self.remaining_ships.add(ship_temp)

    def update_high_score(self):
        # 检查最高分是否被打破
        if self.status.score > self.status.high_score:
            self.status.high_score = self.status.score
        # 更新最高分图像
        round_high_score = round(self.status.high_score, -1)
        high_score_str = "Record: " + "{:,}".format(round_high_score)
        self.high_score_image = self.text_font.render(high_score_str, True, self.text_color, self.ai_settings.bg_color)
        self.high_score_image_rect = self.high_score_image.get_rect()
        self.high_score_image_rect.right = self.screen.get_rect().right - 20
        self.high_score_image_rect.top = 0

    def update_score(self):
        # 更新得分图像
        round_score = round(self.status.score, -1)
        score_str = "Score: " + "{:,}".format(round_score)
        self.score_image = self.text_font.render(score_str, True, self.text_color, self.ai_settings.bg_color)
        self.score_image_rect = self.score_image.get_rect()
        self.score_image_rect.right = self.screen.get_rect().right - 20
        self.score_image_rect.top = 15

    def update_level(self):
        # 更新等级图像
        level_str = "Level: " + str(self.status.level)
        self.level_image = self.text_font.render(level_str, True, self.text_color, self.ai_settings.bg_color)
        self.level_image_rect = self.level_image.get_rect()
        self.level_image_rect.right = self.screen.get_rect().right - 20
        self.level_image_rect.top = 30

    def draw_scoreboard(self):
        # 绘制剩余飞船
        # self.update_remaining_ships()
        self.remaining_ships.draw(self.screen)

        # 绘制最高分
        self.update_high_score()
        self.screen.blit(self.high_score_image, self.high_score_image_rect)

        # 绘制得分
        self.update_score()
        self.screen.blit(self.score_image, self.score_image_rect)

        # 绘制等级
        self.update_level()
        self.screen.blit(self.level_image, self.level_image_rect)
