import sys
import pygame

import setting


def check_events():
    # 响应键盘和鼠标事件
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            sys.exit()


def update_screen(screen, ai_setting, my_ship):
    # 刷新屏幕
    screen.fill(ai_setting.bg_color)
    my_ship.blit_ship()

    # 让最近的屏幕可见
    pygame.display.flip()
