import sys
import pygame


def check_exit_events():
    sys.exit()


def check_keydown_events(event, my_ship):
    if event.key == pygame.K_LEFT:
        my_ship.moving_left = True
    elif event.key == pygame.K_RIGHT:
        my_ship.moving_right = True


def check_keyup_events(event, my_ship):
    if event.key == pygame.K_LEFT:
        my_ship.moving_left = False
    elif event.key == pygame.K_RIGHT:
        my_ship.moving_right = False


def check_events(my_ship):
    # 响应键盘和鼠标事件
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            check_exit_events()
        elif event.type == pygame.KEYDOWN:
            check_keydown_events(event, my_ship)
        elif event.type == pygame.KEYUP:
            check_keyup_events(event, my_ship)
