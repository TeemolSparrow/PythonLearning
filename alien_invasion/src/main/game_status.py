import pygame
import time


class GameStatus:
    def __init__(self, ai_settings, screen):
        self.ai_settings = ai_settings
        self.ships_left = self.ai_settings.ship_limit
        self.screen = screen
        self.game_active = False    # 游戏状态
        self.score = 0              # 当前得分
        self.high_score = 0         # 最高分
        self.level = 1              # 当前等级

    def reset_status(self):
        self.ai_settings.init_setting()
        self.ships_left = self.ai_settings.ship_limit
        self.game_active = False
        self.score = 0
        self.level = 1
        pygame.mouse.set_visible(True)

    def lvl_up(self):
        self.level = self.level + 1
        self.ai_settings.increase_ufo_speed()
        self.ai_settings.increase_ufo_points()


def reset_screen(ship, bullets, ufos):
    time.sleep(2)
    ship.center_ship()
    ship.update_ship_position()
    bullets.empty()
    ufos.empty()


def reset_game(status, ship, bullets, ufos):
    time.sleep(2)
    ship.center_ship()
    ship.update_ship_position()
    bullets.empty()
    ufos.empty()
    status.reset_status()
