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
import game_status
import button


def run_game():
    # 初始化游戏并创建屏幕
    pygame.init()

    ai_settings = setting.Settings()
    status = game_status.GameStatus(ai_settings)
    pygame.display.set_caption("Alien Invasion")
    screen = pygame.display.set_mode((ai_settings.screen_width, ai_settings.screen_height))
    play_button = button.Button(screen, "Play")
    my_ship = ship.Ship(ai_settings, screen)
    bullets = pygame.sprite.Group()
    ufos = pygame.sprite.Group()

    # 绘制初始屏幕
    screen_functions.update_screen(ai_settings, status, screen, my_ship, bullets, ufos, play_button)

    # 游戏主循环
    while True:
        # 监视键盘和鼠标
        game_events.check_events(ai_settings, status, screen, my_ship, bullets, play_button)

        if status.game_active:
            # 刷新飞船位置
            my_ship.update_ship_position()

            # 刷新子弹位置
            bullet_functions.update_bullets_position(bullets)

            # 刷新UFO位置
            ufo_functions.update_ufos_position(ai_settings, screen, ufos)

        # 绘制屏幕
        screen_functions.update_screen(ai_settings, status, screen, my_ship, bullets, ufos, play_button)

        # 碰撞检测
        collision_detection.collisions(status, screen, my_ship, bullets, ufos)


run_game()
