import itchat
import datetime
import os
import reply_strategy
import usage_message
import camera
import screen

global self_username, self_nickname
self_username = ''
self_nickname = ''


@itchat.msg_register('Text')
def text_reply(msg):
    from_username = msg['FromUserName']
    message = msg['Text'].lower()
    to_username = msg['ToUserName']

    # 自己发送消息
    if from_username == self_username and to_username != "filehelper":
        print()
        # 将数据库中微信精灵状态改为睡眠
        # 更新数据库中下次提醒时间
    # 接收消息
    else:
        if to_username == "filehelper":
            from_username = "filehelper"

        # 判断是否需要自动提醒（True：需要    False：不需要）
        remind_flag = reply_strategy.remind_check(from_username)
        if remind_flag:
            # 更新数据库中下次自动提醒时间
            itchat.send_msg(usage_message.reminder, from_username)
        else:
            # 查询微信精灵状态（True：唤醒    False：睡眠）
            spirit_flag = reply_strategy.get_spirit_flag(from_username)
            if not spirit_flag and message == "hx":
                # 将数据库中微信精灵状态改为唤醒
                itchat.send_msg(usage_message.spirit_wakeup, from_username)
                itchat.send_msg(usage_message.spirit_beginning, from_username)
                itchat.send_msg(usage_message.spirit_content, from_username)
            elif spirit_flag and message == 'tc':
                # 将数据库中微信精灵状态改为睡眠
                itchat.send_msg(usage_message.spirit_ending, from_username)
                itchat.send_msg(usage_message.spirit_sleep, from_username)
            else:
                # 微信精灵已启用时调用
                if spirit_flag:
                    if message == 'zz':
                        itchat.send_msg(usage_message.spirit_content, from_username)
                    elif message == 'z1':
                        file_path = '..\\resources\\camera_shot\\' + datetime.datetime.now().strftime('%Y%m%d%H%M%S') + '.jpg'
                        camera.camera_shot(file_path)
                        itchat.send_image(file_path, from_username)
                    elif message == 'z2':
                        file_path = '..\\resources\\video_shot\\' + datetime.datetime.now().strftime('%Y%m%d%H%M%S') + '.mp4'
                        camera.video_shot(file_path)
                        itchat.send_video(file_path, from_username)
                    elif message == 'z3':
                        file_path = '..\\resources\\screen_shot\\' + datetime.datetime.now().strftime('%Y%m%d%H%M%S') + '.jpg'
                        screen.screen_shot(file_path)
                        itchat.send_image(file_path, from_username)
                    elif message == 'z4':
                        itchat.send_msg("别傻了，才不会让你关机呢", from_username)
                        # os.popen('shutdown -s -t 0')
                    elif message[0:3] == "cmd":
                        return_message = os.popen(message.strip(message[0:4])).read()
                        itchat.send_msg(return_message, from_username)
                    else:
                        # 调用机器人
                        itchat.send_msg(usage_message.spirit_chat_function_developing, from_username)

                    # 更新数据库中微信精灵上次回复时间
                    # 更新数据库中下次提醒时间


def init_self_username():
    friends = itchat.get_friends(update=True)
    if len(friends) > 0:
        self = friends[0]
        global self_username, self_nickname
        self_username = self['UserName']
        self_nickname = self['NickName']


def run_spirit():
    itchat.auto_login(hotReload=True)
    init_self_username()
    itchat.run()

