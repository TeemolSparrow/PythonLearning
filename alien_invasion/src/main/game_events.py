import sys
import pygame

import bullet_functions


def check_exit_events():
    sys.exit()


def check_keydown_events(event, settings, screen, ship, bullets):
    if event.key == pygame.K_LEFT:
        ship.moving_left = True
    elif event.key == pygame.K_RIGHT:
        ship.moving_right = True
    elif event.key == pygame.K_SPACE:
        # 创建子弹并加入编组
        bullet_functions.fire_bullet(settings, screen, ship, bullets)


def check_keyup_events(event, ship):
    if event.key == pygame.K_LEFT:
        ship.moving_left = False
    elif event.key == pygame.K_RIGHT:
        ship.moving_right = False


def check_mouse_button_down_events(status, play_button):
    mouse_x, mouse_y = pygame.mouse.get_pos()
    if play_button.rect.collidepoint(mouse_x, mouse_y):
        status.game_active = True
        pygame.mouse.set_visible(False)


def check_events(settings, status, screen, ship, bullets, play_button):
    # 响应键盘和鼠标事件
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            check_exit_events()
        elif event.type == pygame.KEYDOWN and status.game_active:
            check_keydown_events(event, settings, screen, ship, bullets)
        elif event.type == pygame.KEYUP and status.game_active:
            check_keyup_events(event, ship)
        elif event.type == pygame.MOUSEBUTTONDOWN and not status.game_active:
            check_mouse_button_down_events(status, play_button)
