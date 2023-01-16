export QT_QPA_PLATFORMTHEME="qgnomeplatform"  # try gnome here too
# export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR="/usr/local/bin/nvim"
export TERMINAL="kitty"
export TERMINAL2="termite"
export READER="zathura"
export FILE="ranger"
export FILE_MANAGER="pcmanfm"
export BROWSER="firefox"

# Add ~/.local/bin/.scripts and all the subdirectories to the PATH
#export PATH="$PATH:$(du "$HOME/.local/bin/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="$PATH:$(du "$HOME/.local/bin/.scripts/" | sed '/.*git/d' | cut -f 2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="$PATH:$HOME/.local/bin"


export PATH="$PATH:$HOME/.local/bin/.npm_packages/bin"



# for hla(high level assembler)
export PATH="/usr/hla:$PATH"


# for some colors
export S_COLORS=


# for dust
export PATH="$PATH:$HOME/.cargo/bin"


## coloring man pages
# start blinking
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)	# green
# start bold
export LESS_TERMCAP_md=$(tput bold; tput setaf 2)	# green
# start stand out
export LESS_TERMCAP_so=$(tput bold; tput setaf 5)	# yellow
# end standout
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# start underline
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1)	# red
# end bold, blinking, standout, underline
export LESS_TERMCAP_me=$(tput sgr0)


# fzf environment variable
# making fzf use fd instead of find
export FZF_DEFAULT_COMMAND="fd -H --no-ignore-vcs . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ATL_C_COMMAND="fd -t d -H --no-ignore-vcs . $HOME"
# export RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case"


# env variables for clipmenu/d (check --help)
export CM_DEBUG=0
export CM_MAX_CLIPS=500
export CM_SELECTIONS="clipboard primary"
export CM_HISTLENGTH=15
export CM_LAUNCHER="rofi"





# golang
export GOPATH="$HOME/Downloads/golib"
export PATH="$PATH:$GOPATH/bin"


# variables for hla(high level assembler)
export hlalib="/usr/hla/hlalib"
export hlainc="/usr/hla/include"

# Oracle db
export ORACLE_HOME=/opt/oracle/product/18c/dbhomeXE
export ORACLE_SID=XE
export PATH="$PATH:$ORACLE_HOME/bin"


# Rlibs
if [ -n $R_LIBS ]; then
	export R_LIBS=~/Rlibs:$R_LIBS
else
	export R_LIBS=~/RLibs
fi

[ -f "$HOME/env_pass" ] && source $HOME/env_pass
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"


# nvm
source /usr/share/nvm/init-nvm.sh
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

# java
