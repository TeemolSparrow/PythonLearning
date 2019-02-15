import ufo


def get_available_ufo_number_x(ai_settings, ufo_width):
    """计算一行可容纳UFO数量"""
    available_space_x = ai_settings.screen_width
    available_ufo_number_x = int(available_space_x/(3 * ufo_width))
    return available_ufo_number_x


def get_available_ufo_rows_y(ai_settings, ufo_height):
    """计算可容纳多少行UFO"""
    available_space_y = ai_settings.screen_height - 10 * ufo_height
    available_ufo_rows = int(available_space_y/(3 * ufo_height))
    return available_ufo_rows


def create_ufo(ai_settings, screen, ufos, rect_x=0, rect_y=0):
    """构造一个UFO"""
    one_ufo = ufo.UFO(ai_settings, screen)
    one_ufo.rect.x = 1 + rect_x
    one_ufo.rect.y = 50 + rect_y
    ufos.add(one_ufo)


def create_one_ufo(ai_settings, screen, ufos):
    """创建一个UFO"""
    if len(ufos) == 0:
        create_ufo(ai_settings, screen, ufos)


def create_one_row_ufos_orderly(ai_settings, screen, ufos):
    """有序创建一行UFO"""
    if len(ufos) == 0:
        create_ufo(ai_settings, screen, ufos)
    else:
        ufo_list = ufos.sprites()
        last_ufo = ufo_list[-1]
        if last_ufo.rect.x >= 3 * last_ufo.rect.width or last_ufo.rect.y >= last_ufo.rect.height:
            create_ufo(ai_settings, screen, ufos)


def create_one_row_ufos(ai_settings, screen, ufos):
    """创建一行UFO"""
    if len(ufos) == 0:
        one_ufo = ufo.UFO(ai_settings, screen)
        ufo_width = one_ufo.rect.width

        # 计算一行可容纳UFO数量
        available_ufo_number_x = get_available_ufo_number_x(ai_settings, ufo_width)

        # 创建一行UFO
        for ufo_number in range(available_ufo_number_x):
            rect_x = 3 * ufo_width * ufo_number
            create_ufo(ai_settings, screen, ufos, rect_x)


def create_multi_row_ufos(ai_settings, screen, ufos):
    """创建多行UFO"""
    if len(ufos) == 0:
        one_ufo = ufo.UFO(ai_settings, screen)
        ufo_width = one_ufo.rect.width
        ufo_height = one_ufo.rect.height

        # 计算一行可容纳UFO数量
        available_ufo_number_x = get_available_ufo_number_x(ai_settings, ufo_width)

        # 计算可容纳多少行UFO
        available_ufo_rows_y = get_available_ufo_rows_y(ai_settings, ufo_height)

        # 创建多行UFO
        for row_number in range(available_ufo_rows_y):
            for ufo_number in range(available_ufo_number_x):
                rect_x = 3 * ufo_width * ufo_number
                rect_y = 2 * ufo_height * row_number
                create_ufo(ai_settings, screen, ufos, rect_x, rect_y)


def create_ufos(ai_settings, screen, ufos):
    """创建UFO"""
    # create_one_ufo(ai_settings, screen, ufos)
    # create_one_row_ufos_orderly(ai_settings, screen, ufos)
    create_one_row_ufos(ai_settings, screen, ufos)
    # create_multi_row_ufos(ai_settings, screen, ufos)


def update_ufos_position(ai_settings, screen, ufos):
    # 刷新UFO位置
    ufos.update()
    # 持续生成UFO
    create_ufos(ai_settings, screen, ufos)


def draw_ufos(ufos):
    for ufo in ufos.sprites():
        ufo.draw_ufo()
