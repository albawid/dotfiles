#!/bin/sh
#
# This script launches jgmenu in short-lived mode.
# It can be run with a parallel with a long-running invocation of jgmenu
#

config_file=$(mktemp)
trap "rm -f ${config_file}" EXIT

cat <<'EOF' >${config_file}
tint2_look          = 0
terminal_exec       = st
#columns             = 1

menu_margin_x       = 5
menu_margin_y       = 25
#menu_width          = 200
#menu_height_min     = 0
#menu_height_max     = 0
menu_height_mode    = static
menu_padding_top    = 5
menu_padding_right  = 5
menu_padding_bottom = 5
menu_padding_left   = 5
menu_radius         = 1
menu_halign         = right
menu_valign         = bottom

font                = Iosevka Nerd Font 10

color_menu_bg       = #121212 90
color_menu_border   = #121212 90

color_norm_bg       = #121212 0
color_norm_fg       = #e8e8d3 100

color_sel_bg        = #e8e8d3 85
color_sel_fg        = #121212 85
color_sel_border    = #121212 0

color_sep_fg        = #e8e8d3 0
EOF

(
printf "%b\n" "  Logout,i3-msg exit,logout"
printf "%b\n" "  Poweroff,systemctl -i poweroff,shutdown"
printf "%b\n" "  Reboot,systemctl -i reboot,reboot"
printf "%b\n" " Sleep,systemctl -i suspend,suspend"
) | jgmenu --simple --config-file=${config_file}
