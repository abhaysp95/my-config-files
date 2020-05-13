autoload -Uz vcs_info
zstyle ':vcs:info:*' enable git
precmd() {
	vcs_info
}

setopt PROMPT_SUBST

# function git_change() {
# 	if [[ -n ${vcs_info_msg_0_} ]]; then
# 		STATUS=$(command git status --porcelain 2> /dev/null | tail -n1)
# 		if [[ -n $STATUS ]]; then
# 			echo "hello"
# 			PROMPT+='%K{045}%F{124} ${vcs_info_msg_0_}%f%k '
# 		else
# 			echo "not hello"
# 			PROMPT+='%K{124}%F{045} ${vcs_info_msg_0_}%f%k '
# 		fi
# 	else
# 		echo 'just no'
# 		PROMPT+=''
# 	fi
# }

zstyle ':vcs_info:git:*' formats '%b '

function put_spacing() {
	printf "\n"
}

PROMPT=''
PROMPT='%(1j,%K{#f9a8c7}%F{052} %j %f%k,)'
PROMPT+='%K{#5e69b7}%F{016}%B %n %b%f%k'
PROMPT+='%K{#7a82ce}%F{016} %20<..<%~ %<<%f%k'
PROMPT+='%K{#a49acd}%F{124} ${vcs_info_msg_0_}%f%k '
# PROMPT+='%K{045}%F{124} $(git_change)%f%k '
# PROMPT+="$(put_spacing)"

RPROMPT=''
RPROMPT+='${vim_mode}'
vim_ins_mode='%K{#323557}%F{#98d1ce} INS %f%k'
vim_cmd_mode='%K{#e3aed7}%F{#1c1318} NORM %f%k'
vim_mode=$vim_ins_mode

function zle-keymap-select {
    vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
    zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
    vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

# commands
# %n -> user name
# %m -> system name
# %~ -> current dir
# %F -> foreground color
# %f -> reset color
# %B -> start bold
# %b -> stop bold


# PROMPT+=' in '
# RPROMPT+='%(?,%F{green}%B😄,%F{yellow}%? %F{red}😢 '
# vim_ins_mode="%{$fg_bold[yellow]%}[ins]%{$reset_color%}"
# vim_cmd_mode="%{$fg_bold[blue]%}[cmd-%?]%{$reset_color%}"
