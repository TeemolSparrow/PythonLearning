import pygame

import game_status


def collisions(status, screen, ship, bullets, ufos):
    bullets_ufos_collisions(bullets, ufos)
    ship_ufos_collisions(status, ship, bullets, ufos)
    ufos_bottom_collisions(status, screen, ship, bullets, ufos)


def bullets_ufos_collisions(bullets, ufos):
    """子弹与UFO碰撞"""
    pygame.sprite.groupcollide(bullets, ufos, True, True)


def ship_ufos_collisions(status, ship, bullets, ufos):
    """飞船与UFO碰撞"""
    if pygame.sprite.spritecollideany(ship, ufos):
        ship_hit(status, ship, bullets, ufos)


def ufos_bottom_collisions(status, screen, ship, bullets, ufos):
    """UFO与屏幕底部碰撞"""
    if len(ufos) > 0:
        ufo_list = ufos.sprites()
        first_ufo = ufo_list[0]
        if first_ufo.rect.bottom >= screen.get_rect().bottom:
            print("Aliens arrive the earth, game over !!!")
            game_status.reset_game(status, ship, bullets, ufos)


def ship_hit(status, ship, bullets, ufos):
    status.ships_left = status.ships_left - 1
    if status.ships_left > 0:
        print("Ship destroyed !!!")
        game_status.reset_screen(ship, bullets, ufos)
    else:
        print("All ships destroyed, game over !!!")
        game_status.reset_game(status, ship, bullets, ufos)
