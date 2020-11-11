from PIL import ImageGrab


def screen_shot(file_path):
    """截屏并保存"""
    image_grab = ImageGrab.grab()
    image_grab.save(file_path)
