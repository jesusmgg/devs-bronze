#!/bin/bash

source devs_lib.sh

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
ws_center=${!ws_center}
ws_left=ws${workspace}l
ws_left=${!ws_left}
ws_right=ws${workspace}r
ws_right=${!ws_right}

# Center screen
open_workspace_in_output "$ws_center" "$out_center"
open_terminal_hx "$project" "$projects_folder"
open_terminal "$project" "$projects_folder"

# Right screen
open_workspace_in_output "$ws_right" "$out_right"
open_browser

# Left screen
open_workspace_in_output "$ws_left" "$out_left"

# Focus center screen
focus_output "$out_center"
