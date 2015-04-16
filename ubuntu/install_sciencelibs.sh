#!/usr/bin/env sh


# ---------- Scientific libraries ----------
sudo apt-get install libblas-dev
sudo apt-get install liblapacke-dev
sudo apt-get install libatlas-dev

# OpenBlas

sudo apt-get install libgsl0-dev
sudo apt-get install libgsl0-dbg

# OpenCV
# [compiler]
sudo apt-get install build-essential
# [required]
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
# [optional]

# Install numpy for openblas first before installing opencv..
# sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
