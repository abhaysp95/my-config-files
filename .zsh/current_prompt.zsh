setopt PROMPT_SUBST
autoload -Uz vcs_info

zstyle ':vcs:info:*' enable git
zstyle ':vcs_info:git*:*' get-revision true
zstyle ':vcs_info:git*:*' check-for-changes true
zstyle ':vcs_info:git*:*' check-for-changes true

#zstyle ':vcs_info:*' stagedstr '%F{3}A%f'
zstyle ':vcs_info:*' stagedstr 'A'
zstyle ':vcs_info:*' unstagedstr ' M '
# zstyle ':vcs_info:*' actionformats '%f(%F{2}%b%F{3}|%F{1}%a%f)  '
zstyle ':vcs_info:*' actionformats '%b|%a  '
# format the git part
# zstyle ':vcs_info:*' formats '%f%b %F{2}%c%F{3}%u%m%f'
zstyle ':vcs_info:*' formats ' %b %c%u%m'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-stash git-st
zstyle ':vcs_info:*' enable git
#zstyle ':vcs_info:*+*:*' debug true

precmd() {
	vcs_info
	git_change
}

function git_change() {
	if [[ -n ${vcs_info_msg_0_} ]]; then
		STATUS=$(command git status --porcelain 2> /dev/null | tail -n1)
		if [[ -n $STATUS ]]; then
			left_prompt  # see the function below
			PROMPT+='%K{red}%F{#98d1ce} ${vcs_info_msg_0_}%f%k '
		else
			left_prompt
			PROMPT+='%K{#98d1ce}%F{red} ${vcs_info_msg_0_}%f%k '
		fi
	else
		left_prompt
		PROMPT+=''
	fi
}

# zstyle ':vcs_info:git:*' formats '%b '

function put_spacing() {
	printf "\n"
}

function left_prompt() {
	PROMPT=''
	PROMPT='%(1j,%K{#f9a8c7}%F{052} %j %f%k,)'
	PROMPT+='%K{#5e69b7}%F{#1b1d1e}%B %n %b%f%k'
	PROMPT+='%K{#7a82ce}%F{#1b1d1e}%B %20<..<%~ %<<%b%f%k'
}

RPROMPT=''
RPROMPT+='%(?,,%K{red}%F{yellow} %? %f%k)'
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
