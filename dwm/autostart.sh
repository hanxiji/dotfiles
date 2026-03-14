#!/bin/bash

# 判断命令是否存在
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# fcitx5输入法
# -d参数启动，fcitx5以守护进程启动，且不关联tty，dwm退出后会一起退出
#fcitx5 -d
# &后台启动，fcitx5关联到tty，dwm退出后会一起退出
#fcitx5 &
# 需安装picom应用，窗口透明效果
if command_exists "picom"; then
    echo "找到命令: picom"
    picom -b
else
    echo "未找到命令: picom"
fi
# dwm状态栏
if command_exists "slstatus"; then
    echo "找到命令: slstatus"
    slstatus &
else
    echo "未找到命令: slstatus"
fi
# 需安装feh应用，从用户家目录.wallpaper随机读取图片设置桌面背景
if command_exists "feh"; then
    echo "找到命令: feh"
    feh --bg-fill --randomize ~/.wallpaper/{*.jpg,*.png} &
else
    echo "未找到命令: feh"
fi
# 需安装Stretchly应用，休息提醒软件
if command_exists "Stretchly"; then
    echo "找到命令: Stretchly"
    Stretchly &
else
    echo "未找到命令: Stretchly"
fi
