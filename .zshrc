#                   ██
#                  ░██
#    ██████  ██████░██      ██████  █████
#   ░░░░██  ██░░░░ ░██████ ░░██░░█ ██░░░██
#      ██  ░░█████ ░██░░░██ ░██ ░ ░██  ░░
# ██  ██    ░░░░░██░██  ░██ ░██   ░██   ██
#░██ ██████ ██████ ░██  ░██░███   ░░█████
#░░ ░░░░░░ ░░░░░░  ░░   ░░ ░░░     ░░░░░
#
# Created by raytracer

autoload -U colors zsh-mime-setup select-word-style
colors      # colors
zsh-mime-setup      # run everyting as executable
select-word-style bash      # ctrl+w on bash

setopt PROMPT_SUBST

#Key bindings
##
# Lookup in /etc/termcap or /etc/terminfo else, you can get the right keycode
# by typing ^v and then type the key or key combination you want to use.
# "man zshzle" for the list of available actions
bindkey -v                          # vim-key bindings
#bindkey -e                         # emacs-key bindings
bindkey '\e[1;5C' forward-word            # C-Right
bindkey '\e[1;5D' backward-word           # C-Left
bindkey '\e[2~'   overwrite-mode          # Insert
bindkey '\e[3~'   delete-char             # Del
bindkey '\e[5~'   history-search-backward # PgUp
bindkey '\e[6~'   history-search-forward  # PgDn
bindkey '^A'      beginning-of-line       # Home
bindkey '^D'      delete-char             # Del
bindkey '^E'      end-of-line             # End
bindkey '^R'      history-incremental-pattern-search-backward

##
#Completion
##
autoload -U compinit
compinit
zmodload -i zsh/complist
setopt hash_list_all            # has everything before completion
#setopt completealiases          # complete aliases
setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word         # allow completion from within a word/phrase
setopt correct                  # spelling correction for commands
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous

zstyle ':completion::complete:*' use-cache on               # completion caching, use rehash to clear
zstyle ':completion:*' cache-path ~/.cache                  # cache-path
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # ignore case
zstyle ':completion:*' menu select=2                        # menu if nb items > 2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}       # colorz !
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate # list of completers to use
zstyle ':completion:*' accept-exact '*(N)'

# sections completion !
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'\e[00;34m%d'
zstyle ':completion:*:messages' format $'\e[00;31m%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*: manuals' separate-sections true

zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always
users=(raytracer root)          # don't know and care for others
zstyle ':completion:*' users $users

kitty + complete setup zsh | source /dev/stdin

#generic completion with --help
compdef _gnu_generic gcc
compdef _gnu_generic r2
compdef _gnu_generic gdb
compdef _gnu_generic openssl

##
#Pushd
##
setopt auto_pushd               # make cd push old dir in dir stack
setopt pushd_ignore_dups        # no duplicates in dir stack
setopt pushd_silent             # no dir stack after pushd or popd
setopt pushd_to_home            # `pushd` = `pushd $HOME`

##
#History
##
HISTFILE=~/.zsh_history         # where to store zsh config
HISTSIZE=10000                   # big history
SAVEHIST=10000                  # big history
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicates
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit
setopt share_history            # share hist between sessions
setopt bang_hist                # !keyword

##
#Various
##
setopt auto_cd                  # if command is a path, cd into it
setopt auto_remove_slash        # self explicit
setopt chase_links              # resolve symlinks
setopt correct                  # try to correct spelling of commands
setopt extended_glob            # activate complex pattern globbing
setopt glob_dots                # include dotfiles in globbing
setopt print_exit_value         # print return value if non-zero
#unsetopt beep                   # no bell on errors
unsetopt bg_nice                # no lower prio for background jobs
setopt clobber                # must use >/ to truncate existing files
#unsetopt hist_beep              # no bell on error in history
unsetopt hup                    # no hup signal at shell exit
unsetopt ignore_eof             # do not exit on end-of-file
#unsetopt list_beep              # no bell on ambiguous completion
unsetopt rm_star_silent         # ask for confirmation for 'rm *' or 'rm path/*'
setxkbmap -option compose:ralt  # compose-key
print -Pn "\e]0; %n@%M: %~\a"   # terminal title
TERM=xterm-256color             # Colorz !
export GCC_COLORS=1             # Colorz in gcc !
unset LD_PRELOAD                # Meh.
export GTK_RC_FILES="$HOME/.gtkrc-2.0"
export EDITOR=nvim              # Meh.

# automatic ls, whenever cd/pusd etc.
chpwd() {
	ls --color --classify -F --group-directories-first
}

##
#Get notified when someone logs in
##
watch=all                        # watch all logins
logcheck=30                     # every 30 seconds
WATCHFMT="%n from %M has %a tty%1 at %T %W"

# gettting aliases
for file in ~/.config/shellaliases/*; do source "$file"; done

# defining PS3
PS3=''
PS3+='?>'

#neofetch | lolcat -t
#pfetch
#figlet -f /usr/share/fonts/figlet-fonts/ANSI\ Shadow.flf "zsh ready" | lolcat -t

notify-send --icon=~/.cache/notify-icons/terminal.png "zsh settings reloaded" -a zsh -t 2000

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow"
# export FZF_COMPLETION_TRIGGER=''
# bindkey '^T' fzf-completion
# bindkey '^I' $fzf_default_completion
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# get colorful man page
# export PAGER="most"
# source /home/raytracer/.gem/ruby/2.7.0/gems/colorls-1.3.3/lib/tab_complete.sh

## coloring man pages
# start blinking
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)	# green
# start bold
export LESS_TERMCAP_md=$(tput bold; tput setaf 2)	# green
# start stand out
export LESS_TERMCAP_so=$(tput bold; tput setaf 3)	# yellow
# end standout
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# start underline
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1)	# red
# end bold, blinking, standout, underline
export LESS_TERMCAP_me=$(tput sgr0)


### insultor ###
if [ -f /etc/bash.command-not-found ]; then
	. /etc/bash.command-not-found
fi

mapp

# setting dynamic title as working directory ------------------
case $TERM in
	xterm*)
		precmd () {print -Pn "\e]0;%~\a"}
		# \e]0; and \a are escape character,
		# you can also use like \033]0; and \007 respectively
		;;
esac
# -------------------------------------------------------------

# use lf to switch directories and bind to ctrl-o

lfcd() {
	tmp="$(mktemp)"
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		if [ -d "$dir" ]; then
			if [ "$dir" != "$(pwd)" ]; then
				cd "$dir"
			fi
		fi
	fi
}
bindkey -s '^o' 'lfcd\n' # zsh

# shortcut keys ---------------------------------------------

# git pull (ctrl-g+p)
function gitpull() { echo "git pull"; git pull; zle reset-prompt; zle redisplay}
# echos then, runs command then reset prompt then redisplay prompt
zle -N gitpull # defining widget
bindkey '^gp' gitpull # defining shortcut to widget

# pushd (alt-p+d)
function viewdirs() {echo "dirs -v"; dirs -v; zle redisplay}
zle -N viewdirs
bindkey '^[pd' viewdirs

# popd (alt-p+l)
function popdir() {echo "popd"; popd; zle reset-prompt; zle redisplay}
zle -N popdir
bindkey '^[pl' popdir



# visual customization

# source ~/.zsh/minimal/minimal.zsh
[ -f ~/.zsh/current_prompt.zsh ] && source ~/.zsh/current_prompt.zsh

# some extra features
#[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] \
	#&& source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ] \
	&& source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
[ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] \
	&& source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-history-substring-search
# keybinding setting (like fzf)
bindkey '^n' history-substring-search-up  # starts from most recent
bindkey '^p' history-substring-search-down  # reverse of upward
bindkey -M vicmd '^[n' history-substring-search-up
bindkey -M vicmd '^[p' history-substring-search-down

fpath=(~/.zsh.d $fpath)
