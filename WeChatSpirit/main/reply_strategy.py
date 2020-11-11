import setting


def remind_check(from_username):
    """判断是否需要提醒"""
    return True


def update_remind_time(from_user, remind_time):
    """更新下次提醒时间"""
    next_remind_time = remind_time + setting.remind_time_interval


def get_spirit_flag(from_username):
    """查询微信精灵状态"""
    return True

