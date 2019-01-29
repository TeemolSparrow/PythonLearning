import bullet


def draw_bullets(bullets):
    for bullet in bullets.sprites():
        bullet.draw_bullet()


def update_bullets_position(bullets):
    # 刷新子弹位置
    bullets.update()

    # 删除已消失的子弹
    for bullet in bullets.copy():
        if bullet.rect.bottom <= 0:
            bullets.remove(bullet)
    print(len(bullets))


def fire_bullet(settings, screen, ship, bullets):
    if len(bullets) < settings.bullet_allowed:
        new_bullet = bullet.Bullet(settings, screen, ship)
        bullets.add(new_bullet)
