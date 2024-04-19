#!/bin/bash

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


# Focus a screen
function focus_output() {
  output=$1
  i3 focus output $output 1> /dev/null
}

function open_workspace() {
  workspace=$1
  i3 workspace $workspace 1> /dev/null
}

# Focus a screen and opens a workspace in it.
# Make sure to pass arguments wrapped in "".
function open_workspace_in_output() {
  workspace=$1
  output=$2

  focus_output "$output"
  open_workspace "$workspace"
}

# Opens a terminal in the current workspace
function open_terminal() {
  project=$1
  projects_folder=$2

  (setsid alacritty --working-directory="$projects_folder/$project" -T "Terminal: $project" &)
}

# Opens a terminal with Helix editor in the current workspace
function open_terminal_hx() {
  project=$1
  projects_folder=$2

  (setsid alacritty --working-directory="$projects_folder/$project" -T "Helix: $project" -e hx &)
}

# Opens Firefox in the current workspace
function open_browser() {
  i3-msg exec firefox 1> /dev/null
}
