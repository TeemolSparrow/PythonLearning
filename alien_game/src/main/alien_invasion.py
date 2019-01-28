import sys
import pygame

import setting
import game_functions
import ship


def run_game():
    # 初始化游戏并创建屏幕
    pygame.init()

    ai_setting = setting.Settings()
    pygame.display.set_caption("Alien Invasion")
    screen = pygame.display.set_mode((ai_setting.screen_width, ai_setting.screen_height))
    my_ship = ship.Ship(screen)

    # 游戏主循环
    while True:
        # 监视键盘和鼠标
        game_functions.check_events()
        # 刷新屏幕
        game_functions.update_screen(screen, ai_setting, my_ship)


run_game()
