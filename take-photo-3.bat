cd "%~dp0ffmpeg\bin"
ffmpeg -f dshow -framerate 5 -pixel_format yuyv422 -video_size 1920x1080 -i video="paste_your_device_identifier_here" -vframes 1 "%~dp0\3.jpg"
exit 0
