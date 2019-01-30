import pygame
import time


def collisions(screen, bullets, ship, ufos):
    bullets_ufos_collisions(bullets, ufos)
    ship_ufos_collisions(bullets, ship, ufos)
    ufos_bottom_collisions(screen, bullets, ufos)


def bullets_ufos_collisions(bullets, ufos):
    pygame.sprite.groupcollide(bullets, ufos, True, True)


def ship_ufos_collisions(bullets, ship, ufos):
    if pygame.sprite.spritecollideany(ship, ufos):
        print("Ship hit !!!")
        time.sleep(2)
        bullets.empty()
        ufos.empty()


def ufos_bottom_collisions(screen, bullets, ufos):
    if len(ufos) > 0:
        ufo_list = ufos.sprites()
        first_ufo = ufo_list[0]
        if first_ufo.rect.bottom >= screen.get_rect().bottom:
            print("Aliens arrive the earth !!!")
            time.sleep(2)
            bullets.empty()
            ufos.empty()
