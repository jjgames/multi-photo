# Multiple Product Photo Tool

Tool to take multiple high resolution product photos at the same time and automatically resize them.


## Setup

There is some initial setup to install the correct code and setup the cameras.

* Clone the repository to your machine

* Install [ffmpeg](https://www.ffmpeg.org/download.html)

This open source program takes video and photos using devices attached to your computer.

* [Install perl](https://www.perl.org/get.html)

* Install perl modules required

In command prompt:

```
cpanm install Image::Magick
cpanm install Image::Thumbnail
```

* Edit program for number of cameras

Change the line in the `multi-photo.pl` file that chooses the number of cameras you'll use.

```
my @photos_to_take = (1,2,3);
```

```
my @photos_to_take = (1,2,3,4,5);
```

* Edit .bat files

You need to identify which camera should be used for each .bat file.

First you'll identify the cameras.

In command prompt type:

```
ffmpeg -list_devices true -f dshow -i dummy
```

This lists all of the cameras attached to your computer.  You'll copy the "Alternative Name"
for a camera and paste that into one .bat file at this line.

```perl
video="paste_your_device_identifier_here"
```

Becomes:

```perl
video="@device_pnp_\\?\usb#vid_046d&pid_082d&mi_00#6&3967710f&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
```

Also edit the .bat file name for the image.  This can be anything but needs to be
unique between .bat files.

```
-vframes 1 "%~dp0\1.jpg"
```

```
-vframes 1 "%~dp0\2.jpg"
```

Repeat for each camera in your setup.

## Take Photos

Setup the cameras where you want.

Double click the `multi-photo.pl` program.  Or open command prompt and run the perl program:

```
perl multi-photo.pl
```

One photo will be taken and resized for each camera setup.  You should see the photos
in the folder containing the `multi-photo.pl` program.

##  See Example Camera Setup

IMG OF PHOTO BOX

See a photo box setup with multiple cameras and an example video of the tool in action

## Supported by

Development of this open source software was supported by [PriceCharting.com](https://www.pricecharting.com)
