import ufo


def get_available_ufo_number_x(ai_settings, ufo_width):
    """计算一行可容纳UFO数量"""
    available_space_x = ai_settings.screen_width - 2 * ufo_width
    available_ufo_number_x = int(available_space_x/(2 * ufo_width))
    return available_ufo_number_x


def get_available_ufo_rows_y(ai_settings, ufo_height, ship_height):
    """计算可容纳多少行UFO"""
    available_space_y = ai_settings.screen_height - 5 * ufo_height - ship_height
    available_ufo_rows = int(available_space_y/(3 * ufo_height))
    return available_ufo_rows


def create_ufos(ai_settings, screen, ship, ufos):
    """创建UFO群"""
    one_ufo = ufo.UFO(ai_settings, screen)
    ufo_width = one_ufo.rect.width
    ufo_height = one_ufo.rect.height

    # 计算一行可容纳UFO数量
    available_ufo_number_x = get_available_ufo_number_x(ai_settings, ufo_width)

    # 计算可容纳多少行UFO
    available_ufo_rows_y = get_available_ufo_rows_y(ai_settings, ufo_height, ship.rect.height)

    # 创建多行UFO
    for row_number in range(available_ufo_rows_y):
        for ufo_number in range(available_ufo_number_x):
            one_ufo = ufo.UFO(ai_settings, screen)
            one_ufo.rect.x = ufo_width + 2 * ufo_width * ufo_number
            one_ufo.rect.y = ufo_height + 3 * ufo_height * row_number
            ufos.add(one_ufo)


def update_ufos_position(ufos):
    # 刷新UFO位置
    ufos.update()

    # 删除已被击落的UFO
    # print("UFO number: " + str(len(ufos)))


def draw_ufos(ufos):
    for ufo in ufos.sprites():
        ufo.draw_ufo()
