import pygame

import bullet_functions
import ufo_functions


def update_screen(settings, screen, ship, bullets, ufos):

    # 绘制屏幕
    screen.fill(settings.bg_color)

    # 绘制飞船
    ship.draw_ship()

    # 绘制子弹
    bullet_functions.draw_bullets(bullets)

    # # 绘制UFO
    # ufo_functions.blit_ufos()

    # 让最近的屏幕可见
    pygame.display.flip()
