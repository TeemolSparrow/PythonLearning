import pygame

import game_status


def collisions_check(ai_settings, status, screen, score_board, ship, bullets, ufos):
    bullets_ufos_collisions(ai_settings, status, score_board, bullets, ufos)
    ship_ufos_collisions(status, ship, score_board, bullets, ufos)
    ufos_bottom_collisions(status, screen, ship, score_board, bullets, ufos)


def bullets_ufos_collisions(ai_settings, status, score_board, bullets, ufos):
    """子弹与UFO碰撞"""
    collisions = pygame.sprite.groupcollide(bullets, ufos, True, True)
    if collisions:
        for collision_ufos in collisions.values():
            status.score += ai_settings.ufo_points * len(collision_ufos)
        if len(ufos) == 0:
            status.lvl_up()
        score_board.update_all_score()


def ship_ufos_collisions(status, ship, score_board, bullets, ufos):
    """飞船与UFO碰撞"""
    if pygame.sprite.spritecollideany(ship, ufos):
        ship_hit(status, ship, score_board, bullets, ufos)


def ufos_bottom_collisions(status, screen, ship, score_board, bullets, ufos):
    """UFO与屏幕底部碰撞"""
    if len(ufos) > 0:
        ufo_list = ufos.sprites()
        first_ufo = ufo_list[0]
        if first_ufo.rect.bottom >= screen.get_rect().bottom:
            ship_hit(status, ship, score_board, bullets, ufos)


def ship_hit(status, ship, score_board, bullets, ufos):
    status.ships_left = status.ships_left - 1
    if status.ships_left > 0:
        print("UFO arrive the earth or hit your ship, you lost one ship !!!")
        game_status.reset_screen(ship, bullets, ufos)
    else:
        print("All ships destroyed, game over !!!")
        game_status.reset_game(status, ship, bullets, ufos)

    score_board.update_scoreboard()
