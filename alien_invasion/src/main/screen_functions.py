import pygame

import bullet_functions
import ufo_functions


def update_screen(settings, status, screen, ship, bullets, ufos, play_button):

    # 绘制屏幕
    screen.fill(settings.bg_color)

    # 绘制Play按钮
    if not status.game_active:
        play_button.draw_button()

    # 绘制飞船
    ship.draw_ship()

    # 绘制子弹
    bullet_functions.draw_bullets(bullets)

    # 绘制UFO
    ufo_functions.draw_ufos(ufos)

    # 让最近的屏幕可见
    pygame.display.flip()

