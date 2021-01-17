# yavta
Fork of yavta from https://github.com/6by9/yavta.git modified to use it as an hdmi delogo processor
more info **[here](https://www.raspberrypi.org/forums/viewtopic.php?f=38&t=279612&sid=2932464ba1b97844ee4877a7ece22b18&start=25#p1798730)**

Sets up the pipe:
```
V4L2 -> isp -> video_splitter -> video_render
                              -> jpeg_encode -> imagemagick psnr comparison -> 
                                                            applied a Crop & Resize to exclude the logo from the picture
                                                            or 
                                                            applied a transparent PNG as ovelay to mask the logo
```

compile:

sudo apt-get install libmagickcore-dev libmagickwand-dev

make


required:

pngview https://github.com/AndrewFromMelbourne/raspidmx/tree/master/pngview


Example command line:
```
./yavta --capture=10000000000000000000000 -n 3 --logos-dir=<default "logos"> --pngview-dir=<default "pngview"> -f UYVY -m -T /dev/video0
```
