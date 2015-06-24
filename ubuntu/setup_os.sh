#!/usr/bin/env sh

# Script 1 to run when seting up a fresh ubuntu system.

# TODO: Remember to add flag --force-yes when necessary!

# Sets up ubuntu system.

# Should consider changing shebang to use bash if using bash script
# because there is a chance user is running other shell

# ---------- Update ---------- 
sudo apt-get update
sudo apt-get upgrade

# ---------- OS related ----------
sudo apt-get install aptitude apt-file
sudo apt-get install synaptic

# Server processes
sudo apt-get install openssh-server
# vnc server
# LAMP stack?

# Browser
# Chromium

# Send files to trash bin in command line
# Remember to alias rm to trash-cli
sudo apt-get install trash-cli

sudo apt-get install ubuntu-restricted-extras

# Need these for OpenCV
# TBB
sudo apt-get install libtbb2 libtbb-dev
# Dev library should pull in binaries as dependencies...
sudo apt-get install libgtk-3-dev libavcodec-dev libavformat-dev libswscale-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

# GUI
# qt4, qt5 or both?
sudo apt-get install libqt4-core libqt4-gui

# Compression
sudo apt-get install file-roller rar unrar p7zip-full
# archive manager GUI?

# Printing
sudo apt-get install cups
sudo apt-get install cups-pdf

# hdf5
sudo apt-get install libhdf5-dev

# Imaging/Document processing
sudo apt-get install imagemagick
sudo apt-get install graphviz
sudo apt-get install gnuplot-x11 gnuplot-doc gnuplot

# DJVU
sudo apt-get install djvulibre-bin djvulibre-plugin
# PDF
sudo apt-get install pdfedit scribus pdf2djvu pdf2svg pdftk inkscape 

# Latex and other paper writing stuff
sudo apt-get install untex luatex vim-latexsuite latex2html latex-beamer xpdf writer2latex jabref bibutils dvipng perl fontforge context-nonfree context-doc-nonfree
# These are broken I think...
# $(aptitude search R| grep -v ^i | awk '{print $2}' | grep ^r-) 
# $(aptitude search texlive | grep -v ^i | awk '{print $2}')

--------------------

# hevea # Translates from LaTeX to HTML, info, or text
# hevea-doc

# Media
# ffmpeg?

# regionset
# soundconverter
# gxine
# libxine1-ffmpeg
# libmms0

# Java stuff
# icedtea-plugin
# sun-javadb-client

# Utilities
sudo apt-get install colordiff moreutils
# tofrodos # Converts DOS <-> Unix i.e., tofromdos
sudo apt-get install tofrodos
# silver searcher Ag
# diff tools like meld
