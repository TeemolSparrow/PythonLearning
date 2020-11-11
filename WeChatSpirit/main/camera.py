import cv2


def camera_shot(file_path):
    """调用摄像头拍照并保存"""
    video_capture = cv2.VideoCapture(0)
    ret, img = video_capture.read()
    cv2.imwrite(file_path, img)
    video_capture.release()


def video_shot(file_path):
    video_capture = cv2.VideoCapture(0)
    size = (int(video_capture.get(cv2.CAP_PROP_FRAME_WIDTH)), int(video_capture.get(cv2.CAP_PROP_FRAME_HEIGHT)))
    fourcc = cv2.VideoWriter_fourcc('m', 'p', '4', 'v')
    fps = 20
    video_writer = cv2.VideoWriter()
    video_writer.open(file_path, fourcc, fps, size, True)

    frame_num = 0
    while frame_num < 6 * fps:
        _, frame = video_capture.read()
        cv2.putText(frame, None, (10, 20), cv2.FONT_HERSHEY_PLAIN, 1, (0, 255, 0), 1, cv2.LINE_AA)
        video_writer.write(frame)
        frame_num += 1

    video_writer.release()
    video_capture.release()
