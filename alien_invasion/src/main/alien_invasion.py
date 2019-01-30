import sys
import pygame

import setting
import ship
import ufo
import game_events
import screen_functions
import bullet_functions
import ufo_functions
import collision_detection


def run_game():
    # 初始化游戏并创建屏幕
    pygame.init()

    ai_settings = setting.Settings()
    pygame.display.set_caption("Alien Invasion")
    screen = pygame.display.set_mode((ai_settings.screen_width, ai_settings.screen_height))
    my_ship = ship.Ship(ai_settings, screen)
    bullets = pygame.sprite.Group()
    ufos = pygame.sprite.Group()

    # 游戏主循环
    while True:
        # 监视键盘和鼠标
        game_events.check_events(ai_settings, screen, my_ship, bullets)

        # 刷新飞船位置
        my_ship.update_ship_position()

        # 刷新子弹位置
        bullet_functions.update_bullets_position(bullets)

        # 刷新UFO位置
        ufo_functions.update_ufos_position(ai_settings, screen, ufos)

        # 绘制屏幕
        screen_functions.update_screen(ai_settings, screen, my_ship, bullets, ufos)

        # 碰撞检测
        collision_detection.collisions(screen, bullets, my_ship, ufos)


run_game()
