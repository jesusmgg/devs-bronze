#!/bin/bash

function open_terminal() {
  project=$1
  projects_folder=$2

  (setsid alacritty --working-directory="$projects_folder/$project" -T "Terminal: $project" &)
}

function open_terminal_hx() {
  project=$1
  projects_folder=$2

  (setsid alacritty --working-directory="$projects_folder/$project" -T "Helix: $project" -e hx &)
}

function open_browser() {
  i3-msg exec firefox 1> /dev/null
}


# Grouped workspaces
ws1c="1 Center"
ws1r="1 Right"
ws1l="1 Left"
ws2c="2 Center"
ws2r="2 Right"
ws2l="2 Left"
ws3c="3 Center"
ws3r="3 Right"
ws3l="3 Left"
ws4c="4 Center"
ws4r="4 Right"
ws4l="4 Left"
ws5c="5 Center"
ws5r="5 Right"
ws5l="5 Left"

# Single workspaces
ws6="6"
ws7="7"
ws8="8"
ws9="9"
ws10="10"

# Monitors
out_center="DisplayPort-0"
out_right="DisplayPort-1"
out_left="HDMI-A-0"

# Other constants
projects_folder="/home/jesus/Projects"


## Main code
# Check and parse arguments
if [[ $# == 1 ]]; then
  project=$(ls $projects_folder | fzf --prompt "Project: " --preview="ls $projects_folder/{}" --color 'border:8' --bind=enter:replace-query+print-query)
  workspace=$1
else
  if [[ $# -ne 2 ]]; then
    echo 'Too many/few arguments, expecting two: project and workspace' >&2
    exit 1
  fi
  workspace=$1
  project=$2
fi

# Validate arguments
# TODO: support single screen workspaces (6-10)
case $workspace in
  1|2|3|4|5)  # Ok
      ;;
  *)
      echo 'Workspace argument: expected 1 to 5' >&2
      exit 1
esac

if [ -z "$project" ]; then
  echo 'Provide a valid project name' >&2
  exit 1
fi

mkdir -p "$projects_folder/$project"

# Dynamic workspace naming
ws_center=ws${workspace}c
ws_left=ws${workspace}l
ws_right=ws${workspace}r

# Center screen
i3 focus output $out_center 1> /dev/null
i3 workspace ${!ws_center} 1> /dev/null

open_terminal_hx $project $projects_folder
open_terminal $project $projects_folder

# Right screen
i3 focus output $out_right 1> /dev/null
i3 workspace ${!ws_right} 1> /dev/null

open_browser

# Left screen
i3 focus output $out_left 1> /dev/null
i3 workspace ${!ws_left} 1> /dev/null

i3 focus output $out_center 1> /dev/null
