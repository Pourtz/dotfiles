#!/bin/bash

i3lock \
--nofork \
\
--clock \
--{time,date,layout}-color=282a36ff \
--time-align 1 \
--date-align 1 \
--layout-align 2 \
--time-size=70 \
--date-size=20 \
--time-pos="x+30:y+h-65" \
--layout-pos="x+w-10:y+h-10" \
--keylayout 1 \
\
--image /usr/share/backgrounds/screenlock.png \
\
--inside-color=282a3670 \
--{ring,{key,bs}hl}-color=50fa7bff \
--{inside,ring}ver-color=6272a4ff \
--{inside,ring}wrong-color=ff5555ff \
--{line,separator,verif,wrong,modif}-color=282a36ff
