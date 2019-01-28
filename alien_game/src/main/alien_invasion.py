import sys
import pygame

import setting
import game_events
import screen_events
import ship


def run_game():
    # 初始化游戏并创建屏幕
    pygame.init()

    ai_settings = setting.Settings()
    pygame.display.set_caption("Alien Invasion")
    screen = pygame.display.set_mode((ai_settings.screen_width, ai_settings.screen_height))
    my_ship = ship.Ship(ai_settings, screen)
    bullets = pygame.sprite.Group()

    # 游戏主循环
    while True:
        # 监视键盘和鼠标
        game_events.check_events(my_ship)

        # 刷新飞船位置
        my_ship.update_position()

        # 刷新子弹位置
        # bullets.update()

        # 刷新屏幕
        screen_events.update_screen(ai_settings, screen, my_ship)


run_game()
