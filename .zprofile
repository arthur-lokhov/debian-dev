export QT_QPA_PLATFORMTHEME=qt5ct
export QT6CT_PLATFORMTHEME=qt6ct
export QT_STYLE_OVERRIDE=kvantum

# Autostart
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx
fi
