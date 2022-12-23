#!/bin/bash

if [ "${TERM%%-*}" = 'linux' ]; then
    return 2>/dev/null || exit 0
fi

color00="1E/1E/1E"
color01="D1/69/69"
color02="60/8B/4E"
color03="D7/BA/7D"
color04="56/9C/D6"
color05="C5/86/C0"
color06="9C/DC/FE"
color07="D4/D4/D4"
color08="3C/3C/3C"
color09=$color01
color10=$color02
color11=$color03
color12=$color04
color13=$color05
color14=$color06
color15="FF/FF/FF"
color16="B5/CE/A8"
color17="CE/91/78"
color18="26/26/26"
color19="30/30/30"
color20="80/80/80"
color21="E9/E9/E9"
color_foreground="D4/D4/D4"
color_background="1E/1E/1E"
color_cursor="D4/D4/D4"

if [ -n "$TMUX" ]; then
  printf_template='\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\'
  printf_template_var='\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\'
  printf_template_custom='\033Ptmux;\033\033]%s%s\033\033\\\033\\'
elif [ "${TERM%%-*}" = "screen" ]; then
  printf_template='\033P\033]4;%d;rgb:%s\033\\'
  printf_template_var='\033P\033]%d;rgb:%s\033\\'
  printf_template_custom='\033P\033]%s%s\033\\'
else
  printf_template='\033]4;%d;rgb:%s\033\\'
  printf_template_var='\033]%d;rgb:%s\033\\'
  printf_template_custom='\033]%s%s\033\\'
fi

printf $printf_template 0  $color00
printf $printf_template 1  $color01
printf $printf_template 2  $color02
printf $printf_template 3  $color03
printf $printf_template 4  $color04
printf $printf_template 5  $color05
printf $printf_template 6  $color06
printf $printf_template 7  $color07
printf $printf_template 8  $color08
printf $printf_template 9  $color09
printf $printf_template 10 $color10
printf $printf_template 11 $color11
printf $printf_template 12 $color12
printf $printf_template 13 $color13
printf $printf_template 14 $color14
printf $printf_template 15 $color15
printf $printf_template 16 $color16
printf $printf_template 17 $color17
printf $printf_template 18 $color18
printf $printf_template 19 $color19
printf $printf_template 20 $color20
printf $printf_template 21 $color21

if [ -n "$ITERM_SESSION_ID" ]; then
  printf $printf_template_custom Pg D4D4D4
  printf $printf_template_custom Ph 1E1E1E
  printf $printf_template_custom Pi D4D4D4
  printf $printf_template_custom Pj 303030
  printf $printf_template_custom Pk D4D4D4
  printf $printf_template_custom Pl D4D4D4
  printf $printf_template_custom Pm 1E1E1E
else
  printf $printf_template_var 10 $color_foreground
  printf $printf_template_var 11 $color_background
  printf $printf_template_custom 12 ";7"
fi

unset printf_template
unset printf_template_var
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background
unset color_cursor