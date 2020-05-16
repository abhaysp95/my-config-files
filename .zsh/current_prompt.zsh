autoload -U colors && colors
setopt PROMPT_SUBST
autoload -Uz vcs_info

function +vi-git-untracked() {
	if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
  [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
  hook_com[unstaged]+='??'
fi
}

# show remote ref name and number of commits ahead-of or behind
function +vi-git-st() {
	local ahead behind remote
	local -a gitstatus

	# on a remote tracking branch?
	remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
--symbolic-full-name 2>/dev/null)/refs\/remotes\/}

	if [[ -n ${remote} ]]; then
		ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
		(( $ahead )) && gitstatus+=( "${c3}+${ahead}${c2}" )
		behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
		(( $behind )) && gitstatus+=( "${c4}-${behind}${c2}" )
		hook_com[branch]="${hook_com[branch]}${(j:/:)gitstatus}"
	fi
}

# show count of stashed changes
function +vi-git-stash() {
	local -a stashes

	if [[ -s ${hook_com[base]}/.git/refs/stash ]]; then
		stashes=$(git stash list 2>/dev/null | wc -l)
		hook_com[misc]+="%f%F{blue}STASH=${stashes}%f"
	fi
}

zstyle ':vcs:info:*' enable git
zstyle ':vcs_info:git*:*' get-revision true
zstyle ':vcs_info:git*:*' check-for-changes true
zstyle ':vcs_info:git*:*' check-for-changes true

#zstyle ':vcs_info:*' stagedstr '%F{3}A%f'
zstyle ':vcs_info:*' stagedstr 'A'
zstyle ':vcs_info:*' unstagedstr 'M '
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
			PROMPT+='%F{red}%B ${vcs_info_msg_0_}%b%f '
		else
			left_prompt
			PROMPT+='%F{blue}%B ${vcs_info_msg_0_}%b%f '
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
	PROMPT='%(1j,%K{#f07178}%F{#01060E} %j %f%k,)'
	PROMPT+='%K{#36a3d9}%F{#01060E}%B %n %b%f%k'
	PROMPT+='%K{#59c2ff}%F{#01060E}%B %20<..<%~ %<<%b%f%k '
}

RPROMPT=''
RPROMPT+='%(?,,%F{red}%B %? %b%f)'
RPROMPT+='${vim_mode}'
vim_ins_mode='%K{#59c2ff}%F{#01060E} INS %f%k'
vim_cmd_mode='%K{#36a3d9}%F{#01060E} NORM %f%k'
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


# function +vi-git-untracked() {
# 	if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
# 		[[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]]; then
# 	hook_com[unstaged]+='??'
# }

# commands
# %! -> history even number
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
# PROMPT+='%K{#a49acd}%F{124} ${vcs_info_msg_0_}%f%k '
# PROMPT+="$(put_spacing)"
