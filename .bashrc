#
# ~/.bashrc

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

bind 'set completion-ignore-case on'
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		# first one gives header, second one gives first letter of every directory in PWD for prompt
	# {USER}@${HOSTNAME%%.*}:$, removed part
		PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/\~}\007"; CurDir=`pwd|sed -e "s!$HOME!~!"|sed -re "s!([^/])[^/]+/!\1/!g"`'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

# get git branch <<<
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# >>>

# truncate pwd <<<
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
# >>>

Err_Code() {
	echo -e '\e[1;31m'error code $?'\e[m';
}
trap Err_Code ERR

# prompt PS1 <<<
	if [[ ${EUID} == 0 ]] ; then
		PS1="\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] "
		set -o vi
	else
	 PS1=""
	 # PS1+="\[\033[1;91m\]\[\033[1;35m\]|\t|"
	 PS1+="\[\033[m\]\[\e[1;39m\]\u"
	 PS1+="\[\e[1;36m\]\[\033[m\]\[\033[m\]:"
	 PS1+="\[\e[0m\]\[\e[1;32m\][\$CurDir]\[\e[0;38;5;202m"
	 PS1+="\]\$(parse_git_branch)\[\e[1;32m\]> \[\e[0m\]"
	fi
# >>>

else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
shopt -s cdspell
shopt -s expand_aliases
shopt -s extglob
complete -d cd

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# don't use cd
shopt -s autocd

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

source ~/.config/.aliases
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# vi-mode
set -o vi

# source /home/raytracer/.gem/ruby/2.7.0/gems/colorls-1.3.3/lib/tab_complete.sh
# source /home/raytracer/.config/broot/launcher/bash/br

### insultor ###

if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi

# using z.lua ------------------------------------------------
# eval "$(lua ~/.zsh/z.lua/z.lua --init bash enhanced once fzf)"
# export _ZL_ECHO=1

# ---------------------------------------------------------
# set dynamic title upon the previous executed command
# ---------------------------------------------------------
function settitle () {
	export PREV_COMMAND=${PREV_COMMAND}${@}
	# echo -ne "\033]0;${PREV_COMMAND}\007"
	export PREV_COMMAND=${PREV_COMMAND}' | '
}
export PROMPT_COMMAND=${PROMPT_COMMAND}';export PREV_COMMAND=""'
trap 'settitle "$BASH_COMMAND"' DEBUG


# ------------------------------------------------------------
# some other PS1 prompts
		# PS1='\[\033[01;34m\][\u@\h\[ -> $? \]\[\033[01;37m\] \W\[\033[01;34m\]]\$\[\033[00m\] '
		# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M ${$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b"
# ----------------------------------------------------------------

# shortcut keys --------------------------------------------------

## clear screen
# bind '"^L"':"\"clear\""
# "^L": clear-screen
bind -x '"\C-l":clear'

bind -m vi-insert '"\C-x": edit-and-execute-command'

# use lfcd() <<<
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
# >>>

# command_not_found

command_not_found_handle() {
	printf "\e[33mOooh..., \e[5mit isn't there\e[0m\n"
	return 127
}

export CLICOLOR=1
export HISTCONTROL=ignoreboth
notify-send --icon=~/.cache/notify-icons/terminal.png "bash settings reloaded" -a bash -t 2000
