autoload -U colors && colors
setopt PROMPT_SUBST
autoload -Uz vcs_info

function +vi-git-untracked() {
	if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
  [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
	  if [[ "$(git status --porcelain | grep '^??' | wc -l 2> /dev/null)" -gt 0 ]]; then
  hook_com[unstaged]+='??'
	  fi
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

# function executed just after hiting enter
preexec() {
	cmd_start="$SECONDS"
}

precmd() {
	vcs_info
	git_change
	local cmd_end="$SECONDS"
	elapsed=$((cmd_end-cmd_start))
}

function git_change() {
	if [[ -n ${vcs_info_msg_0_} ]]; then
		STATUS=$(command git status --porcelain 2> /dev/null | tail -n1)
		if [[ -n $STATUS ]]; then
			left_prompt  # see the function below
			PROMPT+='%F{red}%B${vcs_info_msg_0_}%b%f '
		else
			left_prompt
			PROMPT+='%F{blue}%B${vcs_info_msg_0_}%b%f '
		fi
	else
		left_prompt
		PROMPT+=''
	fi
}

# zstyle ':vcs_info:git:*' formats '%b '

cur_dir=''
function shrink() {
	local paths=(${PWD/$HOME/\~})
	paths=(${(s:/:)paths})

	length="${#paths[@]}"
	count=1
	for directory in ${paths[@]}; do
		if [[ $count -lt $length ]]; then
			cur_dir+="${directory:0:1}"
			cur_dir+='/'
			count=$((count + 1))
		fi
	done
	cur_dir+="${paths[$length]}"
	#PROMPT+='%K{grey}%F{#282828}%B $cur_dir %b%f%k'
	#printf %q "${cur_dir}"
}

function put_spacing() {

}

function left_prompt() {
	PROMPT=''
	PROMPT+='%(1j,%F{red}%j %f,)'
	PROMPT+='%F{yellow}%B%n %b%f'
	PROMPT+='%F{grey}%B%20<..<%~ %<<%b%f '
}

RPROMPT=''
RPROMPT+='%F{green}%B$elapsed%b%f'
RPROMPT+='%F{green}%Bs %b%f'
RPROMPT+='%(?,,%F{red}%B✗ %? %b%f)'
RPROMPT+='${vim_mode}'
vim_ins_mode='%F{yellow}%BI %b%f'
vim_cmd_mode='%F{grey}%BN %b%f'
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
# %! -> history even number
# %n -> user name
# %m -> system name
# %~ -> current dir
# %F -> foreground color
# %f -> reset color
# %B -> start bold
# %b -> stop bold
