#!/usr/bin/env bash

# Same emacs package directory I use for homebrew-installed emacs on OS X
EMACS_SHARE=/usr/local/share/emacs
mkdir $EMACS_SHARE
chown -R $USER $EMACS_SHARE
chmod -R 775 $EMACS_SHARE

echo 'export PS1="\[\033[32;1m\][\u@\h \w]\n$ \[\033[0m\]"' >> ~/.bashrc

echo 'XKBOPTIONS="ctrl:nocaps"' >> /etc/default/keyboard
echo 'XKBOPTIONS="caps:ctrl_modifier"' >> /etc/default/keyboard

# Requires xserver-xorg-input-libinput, so be sure to run install-ubuntu.sh first
echo 'Section "InputClass"' >> /usr/share/X11/xorg.conf.d/99-libinput.conf
echo '    Identifier "libinput"' >> /usr/share/X11/xorg.conf.d/99-libinput.conf
echo '    Driver "libinput"' >> /usr/share/X11/xorg.conf.d/99-libinput.conf
echo '    MatchDevicePath "/dev/input/event*"' >> /usr/share/X11/xorg.conf.d/99-libinput.conf
echo '    MatchIsTouchpad "true"' >> /usr/share/X11/xorg.conf.d/99-libinput.conf
echo '    Option "Tapping" "false"' >> /usr/share/X11/xorg.conf.d/99-libinput.conf
echo '    Option "ClickMethod" "clickfinger"' >> /usr/share/X11/xorg.conf.d/99-libinput.conf
echo '    Option "NaturalScrolling" "true"' >> /usr/share/X11/xorg.conf.d/99-libinput.conf
echo 'EndSection' >> /usr/share/X11/xorg.conf.d/99-libinput.conf
