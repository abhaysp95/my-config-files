bind 'set completion-ignore-case on'
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/\~}\007"; CurDir=`pwd|sed -e "s!$HOME!~!"|sed -re "s!([^/])[^/]+/!\1/!g"`'
use_color=true


# giving exit code 1(that's why moved this above, so its above Err_Code)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# get git branch
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# truncate pwd
MAX_PWD_LENGTH=15

function shorten_pwd {
	# this function ensures that the PWD string doesn't exceed $MAX_PWD_LENGTH characters
	PWD=$(pwd)
# if truncated, replace truncated part with this string:
	REPLACE="/.."
# determine part of path within HOME, or entire path if not in HOME
	RESIDUAL=${PWD#$HOME}
# compare RESIDUAL with PWD to determine whether we are in HOME or not
	if [ X"$RESIDUAL" != X"$PWD" ]; then
		PREFIX="~"
	fi
# check if RESIDUAL path need truncating to keep total length below MAX_PWD_LENGTH
	# compensate for replacement string
	TRUNC_LENGTH=$(($MAX_PWD_LENGTH - ${#PREFIX} - ${#REPLACE} - 1))
	NORMAL=${PREFIX}${RESIDUAL}
	if [ ${#NORMAL} -ge $(($MAX_PWD_LENGTH)) ]; then
		newPWD=${PREFIX}${REPLACE}${RESIDUAL:((${#RESIDUAL} - $TRUNC_LENGTH)):$TRUNC_LENGTH}
	else
		newPWD=${PREFIX}${RESIDUAL}
	fi

	# return to caller
	echo $newPWD
}

Err_Code() {
	echo -e '\e[1;31m'error code $?'\e[m';
}
trap Err_Code ERR

get_jobs() {
	jobs | wc -l | tr -d 0
}

# prompt PS1
	if [[ ${EUID} == 0 ]] ; then
		PS1="\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] "
		set -o vi
	else
	 PS1=""
	 # PS1+="\[\033[1;91m\]\[\033[1;35m\]|\t|"
	 # PS1+="\[\033[m\]\[\e[1;39m\]\u"
	 PS1+="\[\e[1;36m\]\$(get_jobs)\[\033[m\]\[\033[m\]:"
	 PS1+="\[\e[0m\]\[\e[1;34m\][\$CurDir]\[\e[0;38;5;202m"
	 PS1+="\]\$(parse_git_branch)\[\e[1;34m\]› \[\e[0m\]"
	fi

# defining PS3 variable
PS3=''
PS3+="?>"

unset use_color safe_term match_lhs sh

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s checkwinsize
shopt -s cdspell
shopt -s expand_aliases
shopt -s extglob
complete -d cd
# Enable history appending instead of overwriting.
shopt -s histappend

# no need for cd
# shopt -s autocd  # ( turned off currently because it messes up directory stack )

## history
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTSIZE=10000
export HISTFILESIZE=10000
# store bash history immediately
export PROMPT_COMMAND="${PROMPT_COMMAND};history -a"
# store multi-line commands in one history
shopt -s cmdhist

source_aliases() {
	for file in ~/.config/shellaliases/*; do
		if [[ "$(basename "${file}")" != *zsh* ]]; then
			source "${file}"
		fi
	done
}
source_aliases

# # vi-mode
set -o vi

### insultor ###
if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi

function settitle () {
	export PREV_COMMAND=${PREV_COMMAND}${@}
	# echo -ne "\033]0;${PREV_COMMAND}\007"
	export PREV_COMMAND=${PREV_COMMAND}' | '
}
export PROMPT_COMMAND="${PROMPT_COMMAND};PREV_COMMAND="
trap 'settitle "$BASH_COMMAND"' DEBUG

# auto ls
# cd () { builtin cd "$@" && ls; }

# key-bindings
bind -x '"\C-l":clear'
bind -x '"\C-j":jobs'
bind -m vi-insert '"\C-x": edit-and-execute-command'

# use lfcd()
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

bind -x '"\C-o":lfcd'

# command_not_found
command_not_found_handle() {
	printf "\e[33mOooh..., \e[5mit isn't there\e[0m\n"
	return 127
}

# this is givinng problem of showing no command when a job is on
# export CLICOLOR=1

export HISTCONTROL=ignoreboth

# Codi
# Usage: codi [filetype] [filename]
codi() {
  local syntax="${1:-python}"
  shift
  vim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}
# notify-send --icon=~/.cache/notify-icons/terminal.png "bash settings reloaded" -a bash -t 2000
