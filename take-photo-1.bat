cd "%~dp0ffmpeg\bin"
ffmpeg -f dshow -framerate 5 -pixel_format yuyv422 -video_size 1920x1080 -i video="@device_pnp_\\?\usb#vid_046d&pid_082d&mi_00#6&3967710f&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global" -vframes 1 "%~dp0\1.jpg"
exit 0
