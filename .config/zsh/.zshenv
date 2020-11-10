#
# enable wayland mode for mozilla
#
export MOZ_ENABLE_WAYLAND=1

#QT STUFF
##
##Enable QT5 wayland mode
## if you want to run a qt app without wayland support run it via ./application -platfotm  xcb
export QT_QPA_PLATFORM=wayland 

export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export _JAVA_AWT_WM_NONREPARENTING=1

##
export HOSTNAME=$HOST 

