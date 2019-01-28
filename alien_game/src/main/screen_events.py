import pygame


def update_screen(ai_settings, screen, my_ship):
    # 刷新屏幕
    screen.fill(ai_settings.bg_color)
    my_ship.blit_ship()

    # 让最近的屏幕可见
    pygame.display.flip()
