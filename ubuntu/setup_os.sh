#!/usr/bin/env sh

# Script to setup ubuntu system.

# Should consider changing shebang to use bash if using bash script
# because there is a chance user is running other shell

sudo apt-get update
sudo apt-get dist-upgrade

# Qt library
# qt4, qt5 or both?

# OpenCV Library







# ---------- OS related ----------
sudo apt-get install openssh-server

# Printing
cups
libjpeg etc.

# Python libraries
ipython
virtualenv
virtualenvwrapper

--------------------

sudo apt-get install aptitude openssh-server build-essential gcc gcc-doc apt-file gsl-bin gsl-doc-pdf gsl-ref-html libgsl0-dev gsl-bin gsl-doc-pdf libgsl0-dbg libgsl0ldbl glibc-doc libblas-dev maxima maxima-share subversion subversion-tools git screen $(aptitude search R| grep -v ^i | awk '{print $2}' | grep ^r-) $(aptitude search texlive | grep -v ^i | awk '{print $2}') untex luatex perl fontforge context-nonfree context-doc-nonfree dvipng imagemagick graphviz gnuplot-x11 gnuplot-doc gnuplot libatlas3gf-base kdevelop kate kile vim-gtk vim vim-addon-manager vim-common vim-doc vim-latexsuite latex2html latex-beamer xpdf writer2latex jabref bibutils hevea hevea-doc wordnet cups-pdf djvulibre-bin djvulibre-plugin pdfedit inkscape scribus pdf2djvu pdf2svg pdftk python-gdbm ipython python3-dev python3-all python-scipy unrar tofrodos epiphany-browser epiphany-extensions scribes lyx claws-mail claws-mail-i18n claws-mail-doc claws-mail-tools libqt4-core libqt4-gui ubuntu-restricted-extras regionset soundconverter gxine libxine1-ffmpeg libstdc++5 libmms0 vim aptitude zim mendeleydesktop -y --force-yes icedtea-plugin sun-javadb-client gimp acroread wine colordiff moreutils libreoffice-writer2latex libreoffice-wiki-publisher libreoffice-pdfimport libreoffice-grammarcheck libreoffice-calc libreoffice-draw libreoffice 
