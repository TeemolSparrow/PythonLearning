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
import scoreboard


def run_game():
    # 初始化游戏并创建屏幕
    pygame.init()

    # 初始化游戏设置
    ai_settings = setting.Settings()
    # 初始化屏幕
    pygame.display.set_caption("Alien Invasion")
    screen = pygame.display.set_mode((ai_settings.screen_width, ai_settings.screen_height))
    # 初始化游戏状态
    status = game_status.GameStatus(ai_settings, screen)
    # 初始化开始按钮
    play_button = button.Button(screen, "Play")
    # 初始化计分板
    score_board = scoreboard.ScoreBoard(ai_settings, status, screen)
    # 初始化飞船
    my_ship = ship.Ship(ai_settings, screen)
    # 初始化子弹组
    bullets = pygame.sprite.Group()
    # 初始化UFO组
    ufos = pygame.sprite.Group()

    # 绘制初始屏幕
    screen_functions.update_screen(ai_settings, status, screen, score_board, my_ship, bullets, ufos, play_button)

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
        screen_functions.update_screen(ai_settings, status, screen, score_board, my_ship, bullets, ufos, play_button)

        if status.game_active:
            # 碰撞检测
            collision_detection.collisions_check(ai_settings, status, screen, score_board, my_ship, bullets, ufos)
