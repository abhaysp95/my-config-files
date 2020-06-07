#!/usr/bin/env bash
#     _    ____  ____
#    / \  / ___||  _ \   Abhay Shanker Pathak
#   / _ \ \___ \| |_) |  abhaysp9955@gmail.com
#  / ___ \ ___) |  __/   https://github.com/coolabhays
# /_/   \_\____/|_|
#
# get config files and open in terminal


declare options=("alacritty
bashrc
bashtop
bat
bspwm
cava
cmus
deadbeef
dunst
emoji
gedit
gtk-3.0
guake
htop
i3
inputrc
kitty
lf
liquidprompt
mpd
mpv
nano
neofetch
newsboat
newsboatc
nvim
polybar
picom
profie
pylintrc
qutebrowser
ranger
rofi
sxhkd
terminator
termite
tmux
xmodmap
xprofile
xresources
zshrc
zsh_prompt
youtube-viewer
zathura
quit
")

choice="$(echo -e "${options[@]}" | dmenu -i -p 'config edit: ' -nb '#282828' -sf '#282828' -nf '#ebdbb2' -sb '#d79921' -fn "Ubuntu Mono Nerd Font Mono 5")"

case "$choice" in
	quit) echo "Exiting" && exit 1;;
	alacritty) choice=$HOME/.config/alacritty/alacritty.yml;;
	bashrc) choice=$HOME/.bashrc;;
	bashtop) choice=$HOME/.config/bashtop/bashtop.cfg;;
	bat) choice=$HOME/.config/bat/config;;
	bspwm) choice=$HOME/.config/bspwm/bspwmrc;;
	cava) choice=$HOME/.config/cava/config;;
	cmus) choice=$HOME/.config/cmus/autosave;;
	deadbeef) choice=$HOME/.config/deadbeef/config;;
	dunst) choice=$HOME/.config/dunst/dunstrc;;
	emoji) choice=$HOME/.local/share/emoji;;
	gtk-3.0) choice=$HOME/.config/gtk-3.0/settings.ini;;
	guake) choice=$HOME/.config/guake/session.json;;
	htop) choice=$HOME/.config/htop/htoprc;;
	i3) choice=$HOME/.config/i3/config;;
	inputrc) choice=$HOME/.inputrc;;
	kitty) choice=$HOME/.config/kitty/config;;
	lf) choice=$HOME/.config/lf/lfrc;;
	liquidprompt) choice=$HOME/.config/liquidprompt/liquidpromptrc;;
	mpd) choice=$HOME/.config/mpd/mpd.conf;;
	mpv) choice=$HOME/.config/mpv/input.conf;;
	nano) choice=$HOME/.config/nano/nanorc;;
	neofetch) choice=$HOME/.config/neofetch/config.conf;;
	newsboat) choice=$HOME/.config/newsboat/urls;;
	newsboatc) choice=$HOME/.config/newsboat/config;;
	nvim) choice=$HOME/.config/nvim/init.vim;;
	polybar) choice=$HOME/.config/polybar/config;;
	picom) choice=$HOME/.config/picom.conf;;
	profie) choice=$HOME/.profile;;
	pylintrc) choice=$HOME/.pylintrc;;
	qutebrowser) choice=$HOME/.config/qutebrowser/autoconfig.yml;;
	ranger) choice=$HOME/.config/ranger/rc.conf;;
	rofi) choice=$HOME/.config/rofi/config.rasi;;
	sxhkd) choice=$HOME/.config/sxhkd/sxhkdrc;;
	terminator) choice=$HOME/.config/terminator/config;;
	termite) choice=$HOME/.config/termite/config;;
	tmux) choice=$HOME/.tmux.conf;;
	xmodmap) choice=$HOME/.xmodmap;;
	xprofile) choice=$HOME/.xprofile;;
	xresources) choice=$HOME/.Xresources;;
	zshrc) choice=$HOME/.zshrc;;
	zsh_prompt) choice=$HOME/.zsh/current_prompt.zsh;;
	youtube-viewer) choice=$HOME/.config/youtube-viewer/youtube-viewer.conf;;
	zathura) choice=$HOME/.config/zathura/zathurarc;;
	*) exit 1;;
esac

name=$(basename $0)
$TERMINAL -e "$EDITOR" "$choice" &
#disown %"${name}"
