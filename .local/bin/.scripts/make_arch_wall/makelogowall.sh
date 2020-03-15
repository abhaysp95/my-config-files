#!/usr/bin/env sh

# Author: Abhay Shanker Pathak
# Date: 2020-03-15
# Description: Turn wallpaper into distro specific
# Email: abhaysp9955@gmail.com
# Github: https://github.com/CoolAbhayS
# Last Edited: 2020-03-15

wallpaper=$1

# Get dimensions of wallpaper <<<
height=$(magick convert $wallpaper -format "%h" info:)
width=$(magick convert $wallpaper -format "%w" info:)
# >>>

# appropiate height for logo
logo_h=$((height * 9 / 16))

# Generate cover
convert "$HOME/.local/bin/.scripts/make_arch_wall/arch.png" -gravity center -resize $logo_h -background white -extent "${width}x${height}" -flatten "wall_with_logo.png"

# Get new wallpaper <<<
new_wall_name=$(basename "$wallpaper")

convert "$wallpaper" -write-mask "wall_with_logo.png" -gravity center \
	-blur 0x30 \
	-attenuate 0.3 +noise Laplacian \
	-evaluate Multiply 1.3 \
	"logo_btw_$new_wall_name"
# >>>

# Delete temp file
rm "wall_with_logo.png"
