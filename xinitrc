#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login

#export LANG=zh_CN.UTF-8
#export LANGUAGE=zh_CN:en_US

#xset s off
#xset dpms 0 0 0

export _JAVA_AWT_WM_NONREPARENTING=1
#export AWT_TOOLKIT=MToolkit
#wmname LG3D

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
#fcitx5 &
fcitx5 -d

#picom -CGb

#slstatus &

#feh --bg-fill --randomize ~/.wallpaper/* &

#numlockx &

# 启动dwm
exec dwm
#exec startdwm
# 启动i3-wm
#exec i3
