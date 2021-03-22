#!/usr/bin/env bash

#        -lf/nf/cf color
#            Defines the foreground color for low, normal and critical notifications respectively.
#
#        -lb/nb/cb color
#            Defines the background color for low, normal and critical notifications respectively.
#
#        -lfr/nfr/cfr color
#            Defines the frame color for low, normal and critical notifications respectively.

[ -f "$HOME/.cache/wal/colors.sh" ] && . "$HOME/.cache/wal/colors.sh

pidof dunst && killall dunst

dunst -lf  "${color0:-#888888}" \
      -lb  "${color1:-#222222}" \
      -lfr "${color2:-#abb2bf}" \
      -nf  "${color3:-#abb2bf}" \
      -nb  "${color4:-#1e1e1e}" \
      -nfr "${color5:-#569cd6}" \
      -cf  "${color6:-#141414}" \
      -cb  "${color7:-#ed4354}" \
      -cfr "${color8:-#f6f8fa}" > /dev/null 2>&1 &
