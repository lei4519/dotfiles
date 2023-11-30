#!/bin/bash

Mail=(
	update_freq=10
	icon=$MAIL
	icon.font="$FONT:Regular:24.0"
	icon.padding_left=20
	# background.color=$BACKGROUND_1
	# background.border_color=$BACKGROUND_2
	# background.height=30
	# background.corner_radius=9
	# background.border_width=2
	# padding_right=10
	label.padding_right=20
	script="$PLUGIN_DIR/app_status.sh"
	click_script="open -a Mail"
)

sketchybar --add item Mail left \
	--set Mail "${Mail[@]}"
