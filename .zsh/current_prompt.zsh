#  ZSH CURRENT PROMPT


# Issue:-
# current issue, it takes a enter to take effect for new thing
# like, if len_pwd gets greater than 20 one time, you have to
# press enter again to have it work

# autoloads
autoload -U colors && colors
setopt PROMPT_SUBST
autoload -Uz vcs_info

# git untracked
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
		hook_com[branch]=${hook_com[branch]}${(j:/:)gitstatus}
	fi
}

# show count of stashed changes
function +vi-git-stash() {
	local -a stashes

	if [[ -s ${hook_com[base]}/.git/refs/stash ]]; then
		stashes=$(git stash list 2>/dev/null | wc -l)
		hook_com[misc]+="%f%F{cyan}STASH=${stashes}%f"
	fi
}


# vcs info
zstyle ':vcs:info:*' enable git
zstyle ':vcs_info:git*:*' get-revision true
zstyle ':vcs_info:git*:*' check-for-changes true
zstyle ':vcs_info:git*:*' check-for-changes true

#zstyle ':vcs_info:*' stagedstr '%F{3}A%f'
zstyle ':vcs_info:*' stagedstr 'A'
zstyle ':vcs_info:*' unstagedstr 'M'
# zstyle ':vcs_info:*' actionformats '%f(%F{2}%b%F{3}|%F{1}%a%f)  '
zstyle ':vcs_info:*' actionformats '%b|%a'
# format the git part
# zstyle ':vcs_info:*' formats '%f%b %F{2}%c%F{3}%u%m%f'
zstyle ':vcs_info:*' formats ' שׂ%b%c%u%m'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-stash git-st
zstyle ':vcs_info:*' enable git
#zstyle ':vcs_info:*+*:*' debug true
# שׂ


# function executed just after hiting enter
preexec() {
	cmd_start="$SECONDS"
}  # check out more about preexec

# function executed just before showing prompt
precmd() {
	get_width
	vcs_info
	set_virtualenv
	left_prompt
	local cmd_end="$SECONDS"
	elapsed=$((cmd_end-cmd_start))
}
# pwd_len
# git_change
len_pwd=0  # gives a numeric value on new terminal session

function set_virtualenv() {
	if [ -z "$VIRTUAL_ENV" ]; then
		python_venv=''
	else
		python_venv=$(printf "(%s)" "$(basename $VIRTUAL_ENV)")
	fi
}

function check_venv() {
	if [[ $python_venv == (*) ]]; then
		echo "yes"
	else
		echo "no"
	fi
}

function get_width() {
	width=$(tput cols)
	if [ ${width} -ge 70 ]; then
		git_change
		shrink "large"
	elif [ ${width} -ge 60 ]; then
		if [ ${len_pwd} -le 20 ] && [[ $python_venv == (*) ]]; then
			git_change
			shrink "large"
		else
			shrink "large"
			right_prompt
		fi
	else
		if [ ${len_pwd} -ge 20 ] && [[ $python_venv == (*) ]]; then
			shrink "small"
			right_prompt
		else
			shrink "large"
			right_prompt
		fi
	fi
}

function shrink() {
	cur_dir=''
	local paths=( ${PWD/$HOME/\~} )
	paths=( ${(s:/:)paths} )

	if [ "$(pwd | cut -d '/' -f 2)" != "home" ]; then
		cur_dir+='#'
		if [ "${#paths[@]}" -ne 0 ]; then
			cur_dir+='/'
		fi
	fi

	count=0
	while [ "${#paths[@]}" -gt "${count}" ]; do
		count=$(( count + 1 ))
		cur_folder="${paths[count]}"
		if [ "${count}" -lt "${#paths[@]}" ]; then
			cur_dir+="${cur_folder:0:1}"
			cur_dir+='/'
		else
			if [ "${#paths[$count]}" -gt 20 ]; then
				cur_dir+="${paths[$count]:0:8}"
				cur_dir+="..."
				start_for_last_part=$(( ${#paths[$count]} - 8 ))
				cur_dir+="${paths[$count]:${start_for_last_part}:${#paths[$count]}}"
			else
				cur_dir+="${paths[$count]}"
			fi
		fi
	done
	len_pwd=${#cur_dir}
	if [ $1 = "small" ]; then
		cur_dir=''
	fi
}

function git_change() {
	if [[ -n ${vcs_info_msg_0_} ]]; then
		STATUS=$(command git status --porcelain 2> /dev/null | tail -n1)
		if [[ -n $STATUS ]]; then
			right_prompt  # see the function below
			RPROMPT+='%F{red}${vcs_info_msg_0_}%f'
		else
			right_prompt
			RPROMPT+='%F{cyan}${vcs_info_msg_0_}%f'
		fi
	else
		right_prompt
		RPROMPT+=''
	fi
}

#function pwd_len() {
	#echo "${#cur_dir}"
	#if [ ${#cur_dir} -ge 10 ]; then
		#echo "yes"
	#else
		#echo "no"
	#fi
#}

# zstyle ':vcs_info:git:*' formats '%b '


function put_spacing() {
	PROMPT+='
'
}

function left_prompt() {
	PROMPT=''
	PROMPT+='%(1j,%F{red}%j %f,)'
	PROMPT+='%F{yellow}${python_venv}%f'
	PROMPT+='${vim_mode}'
	vim_ins_mode='%F{green}%B$ %b%f'
	vim_cmd_mode='%F{red}%B$ %b%f'
	vim_mode=$vim_ins_mode
	# PROMPT+='%F{grey}%B%20<..<%~%<<%b%f'
}

function right_prompt() {
	RPROMPT=''
	RPROMPT+='%(?,,%F{red}%B✗%? %b%f)'
	RPROMPT+='%F{#4c566a}%B$elapsed %b%f'
	# RPROMPT+='%F{green}%Bs %b%f'
	RPROMPT+='%F{blue}%B${cur_dir}%b%f'
}

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
# PROMPT+='%F{blue}%B%n %b%f'
