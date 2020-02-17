export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
export TERMINAL="alacritty"
export TERMINAL2="termite"
export READER="zathura"
export FILE="ranger"
export FILE_MANAGER="pcmanfm"
export BROWSER="firefox"

# Add ~/.local/bin/.scripts and all the subdirectories to the PATH
export PATH="$PATH:$(du "$HOME/.local/bin/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# for colorls
export PATH="$PATH:/home/raytracer/.gem/ruby/2.7.0/bin"

# for some colors
export S_COLORS=
