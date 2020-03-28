# ________
#< .zshrc >
# --------
#      \                    / \  //\
#       \    |\___/|      /   \//  \\
#            /0  0  \__  /    //  | \ \
#           /     /  \/_/    //   |  \  \
#           @_^_@'/   \/_   //    |   \   \
#           //_^_/     \/_ //     |    \    \
#        ( //) |        \///      |     \     \
#      ( / /) _|_ /   )  //       |      \     _\
#    ( // /) '/,_ _ _/  ( ; -.    |    _ _\.-~        .-~~~^-.
#  (( / / )) ,-{        _      `-.|.-~-.           .~         `.
# (( // / ))  '/\      /                 ~-. _ .-~      .-~^-.  \
# (( /// ))      `.   {            }                   /      \  \
#  (( / ))     .----~-.\        \-'                 .~         \  `. \^-.
#             ///.----..>        \             _ -~             `.  ^-`  ^-_
#               ///-._ _ _ _ _ _ _}^ - - - - ~                     ~-- ,.-~
#                                                                  /.-~
#
#                   ██
#                  ░██
#    ██████  ██████░██      ██████  █████
#   ░░░░██  ██░░░░ ░██████ ░░██░░█ ██░░░██
#      ██  ░░█████ ░██░░░██ ░██ ░ ░██  ░░
# ██  ██    ░░░░░██░██  ░██ ░██   ░██   ██
#░██ ██████ ██████ ░██  ░██░███   ░░█████
#░░ ░░░░░░ ░░░░░░  ░░   ░░ ░░░     ░░░░░
#
# Created by newuser for 5.7.1

autoload -U colors zsh-mime-setup select-word-style
colors      # colours
zsh-mime-setup      # run everyting as executable
select-word-style bash      # ctrl+w on bash

##
#Vcs info
##
autoload -Uz vcs_info
# zstyle ':vcs_info:*' enable git svn     # use vcs_info_printsys to check more
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:*' formats "%{$fg_bold[yellow]%}%c%{$fg_bold[green]%}%u%{$reset_color%} [%{$fg_bold[blue]%}%b%{$reset_color%}]%{$fg_bold[yellow]%}%s%{$fg_bold[green]%}:%r%{$reset_color%}"

precmd(){   # run before each prompt
    vcs_info
}

##
#Prompt
##
setopt PROMPT_SUBST     # allow funky stuff in prompt
color="blue"
if [ "$USER" = "root" ]; then
    color="yellow"     # root⌚Ɀ‽⚠ i➞s→ rՀed, user is blue
fi;
#%{$fg_bold[$color]>%{$reset_color%}"
# RPROMPT='${vim_mode} ${vcs_info_msg_0_}'
# prompt="
# %{$fg_bold[$color]%}╭─ %{$fg_bold[yellow]%}%B%~%b%{$fg_bold[red]%}  Ѽ  %?%{$fg_bold[blue]%}  ⌚ %T %{$fg_bold[green]%} Ɀ %! %{$fg_bold[$color]%}
# ╰─➤ "
# %! -> tells command no.
# %T -> time

##
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
HISTSIZE=4096                   # big history
SAVEHIST=4096                   # big history
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

##
#Get notified when someone logs in
##
watch=all                        # watch all logins
logcheck=30                     # every 30 seconds
WATCHFMT="%n from %M has %a tty%1 at %T %W"

##
#Show vim mode in your prompt
##
# vim_ins_mode="%{$fg_bold[yellow]%}[ins]%{$reset_color%}" vim_cmd_mode="%{$fg_bold[blue]%}[cmd-%?]%{$reset_color%}"
# vim_mode=$vim_ins_mode

function zle-keymap-select {
    vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
    zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
    vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

source ~/.config/.aliases            # aliases

#neofetch | lolcat -t
#pfetch
#figlet -f /usr/share/fonts/figlet-fonts/ANSI\ Shadow.flf "zsh ready" | lolcat -t

export PATH="$HOME/.local/bin/.scripts:$PATH"

notify-send --icon=~/.cache/notify-icons/terminal.png "zsh settings reloaded" -a zsh -t 2000

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow"
# export FZF_COMPLETION_TRIGGER=''
# bindkey '^T' fzf-completion
# bindkey '^I' $fzf_default_completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# get colorful man page
#export PAGER="most"
source /home/raytracer/.gem/ruby/2.7.0/gems/colorls-1.3.3/lib/tab_complete.sh

# man () {
# 	LESS_TERMCAP_md=$'\e[01;33m' \
# 	LESS_TERMCAP_me=$'\e[0m' \
# 	LESS_TERMCAP_se=$'\e[0m' \
# 	LESS_TERMCAP_so=$'\e[01;44;32m' \
# 	LESS_TERMCAP_ue=$'\e[0m' \
# 	LESS_TERMCAP_us=$'\e[01;31m' \
# 	command man "$@"
# }

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


### broot ###
source /home/raytracer/.config/broot/launcher/bash/br

### insultor ###
if [ -f /etc/bash.command-not-found ]; then
	. /etc/bash.command-not-found
fi

mapp

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#585858,bg=#181818,bold,underline"
source /home/raytracer/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## spaceship prompt configuration ##

# SPACESHIP_RPROMPT_ORDER=(
# 	battery
# 	time
# 	vi_mode
# )

#SPACESHIP_PROMPT_ORDER=(
#	user
#	dir
#	host
#	git
#	hg
#	package
#	node
#	ruby
#	elixir
#	xcode
#	swift
#	golang
#	php
#	rust
#	haskell
#	julia
#	docker
#	aws
#	venv
#	conda
#	pyenv
#	dotnet
#	ember
#	kubectl
#	terraform
#	exec_time
#	line_sep
#	vi_mode
#	jobs
#	char
#	# exit_code
#)

#SPACESHIP_PROMPT_ADD_NEWLINE=true
#SPACESHIP_PROMPT_SEPARATE_LINE=	true
#SPACESHIP_CHAR_COLOR_SUCCESS='green'
#SPACESHIP_CHAR_COLOR_FAILURE='red'
#SPACESHIP_CHAR_COLOR_SECONDARY='yellow'
#SPACESHIP_TIME_SHOW=true
#SPACESHIP_USER_COLOR_ROOT='red'
#SPACESHIP_PACKAGE_SHOW=false
#SPACESHIP_RUBY_SHOW=false
#SPACESHIP_ELM_SHOW=false
#SPACESHIP_ELIXIR_SHOW=false
#SPACESHIP_SWIFT_SHOW_LOCAL=false
#SPACESHIP_HASKELL_SHOW=true
#SPACESHIP_JULIA_SHOW=false
#SPACESHIP_AWS_SHOW=false
#SPACESHIP_VENV_SHOW=false
#SPACESHIP_CONDA_SHOW=false
#SPACESHIP_DOTNET_SHOW=false
#SPACESHIP_EMBER_SHOW=false
#SPACESHIP_KUBECTL_SHOW=false
#SPACESHIP_TERRAFORM_SHOW=false
#SPACESHIP_EXEC_TIME_SHOW=true
#SPACESHIP_EXEC_TIME_PREFIX='consumed '
#SPACESHIP_EXEC_TIME_ELAPSED='0'
#SPACESHIP_BATTERY_SHOW=true
#SPACESHIP_BATTERY_THRESHOLD='101'
#SPACESHIP_VI_MODE_SHOW=true
##SPACESHIP_VI_MODE_PREFIX='in '
#SPACESHIP_VI_MODE_INSERT='[Ins]'
#SPACESHIP_VI_MODE_NORMAL='[Norm]'
#SPACESHIP_VI_MODE_COLOR='cyan'
#SPACESHIP_EXIT_CODE_SHOW=true

### Spaceship prompt ##

#autoload -U promptinit; promptinit
#prompt spaceship

# source solarized8
#source $HOME/.config/nvim/plugged/vim-solarized8/scripts/solarized8.sh

# corona_check
#corona_check &

## liquidprompt
[[ $- = *i* ]] && source ~/Downloads/git-materials/liquidprompt/liquidprompt

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
