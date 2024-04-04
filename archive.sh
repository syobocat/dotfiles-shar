#!/bin/sh

if [ "${XDG_CONFIG_HOME}" != "" ]; then
	CONF=$(echo "${XDG_CONFIG_HOME}" | sed s%^${HOME}%.%g)
else
	CONF=./.config
fi

cd "${HOME}"

case "$1" in
	"alacritty" )
		TARGET="${CONF}/alacritty/alacritty.toml"
	;;
	"conky" )
		TARGET="${CONF}/conky/conky.conf \
			${CONF}/conky/dateutil.py"
	;;
	"fish" )
		TARGET="${CONF}/fish/config.fish \
			${CONF}/fish/functions/fish_prompt.fish"
	;;
	"gtk" )
		TARGET="./.gtkrc-2.0 \
			${CONF}/gtk-3.0/settings.ini"
	;;
	"gpg" )
		TARGET="./.gnupg/gpg-agent.conf \
			./.gnupg/sshcontrol"
	;;
	"gpg-freebsd" )
		TARGET="./.gnupg/scdaemon.conf"
	;;
	"helix" )
		TARGET="${CONF}/helix/config.toml"
	;;
	"i3" )
		TARGET="./.xinitrc \
			${CONF}/dunst/dunstrc \
			${CONF}/fontconfig/fonts.conf \
			${CONF}/i3/config \
			${CONF}/i3/conky-i3.sh \
			${CONF}/i3/conky-i3.conf \
			${CONF}/picom/picom.conf \
			${CONF}/rofi/config.rasi"
	;;
	"mpd" )
		TARGET="${CONF}/mpd/mpd.conf \
			${CONF}/ncmpcpp/config"
	;;
	"yazi" )
		TARGET="${CONF}/yazi/yazi.toml"
	;;
esac

shar ${TARGET}
