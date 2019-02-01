import pygame
import time


class GameStatus:
    def __init__(self, ai_settings):
        self.ai_settings = ai_settings
        self.ships_left = self.ai_settings.ship_limit
        self.game_active = False

    def reset_status(self):
        self.ai_settings.init_setting()
        self.ships_left = self.ai_settings.ship_limit
        self.game_active = False
        pygame.mouse.set_visible(True)

    def lvl_up(self):
        self.ai_settings.increase_speed()


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
