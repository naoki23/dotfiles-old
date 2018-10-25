case ${OSTYPE} in
    linux*)
        #xkbcomp -I$HOME/.xkb ~/.xkb/keymap/mykbd $DISPLAY 2> /dev/null
        xset r rate 195 62
        ;;
    darwin*)
        ;;
esac
