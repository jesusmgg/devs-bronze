#!/bin/bash

source devs_lib.sh

function open_media_apps() {
  i3-msg exec "flatpak run com.spotify.Client" 1> /dev/null
  sleep 1s
  i3-msg [title="Spotify"] move to "$ws10"
}

function open_av_apps() {
  i3-msg exec pavucontrol 1> /dev/null
  i3-msg exec noisetorch 1> /dev/null
  sleep 1s
  i3-msg [title="Volume Control"] move to "$ws9"
  i3-msg [title="NoiseTorch"] move to "$ws9"
}

function open_mail_apps() {
  i3-msg exec thunderbird 1> /dev/null
}

# Mail in workspace 1 left
open_workspace_in_output "$ws1l" "$out_left"
open_mail_apps

# A/V controls in workspace 9 left
open_workspace_in_output "$ws9" "$out_left"
open_av_apps

# Music in workspace 10 right
open_workspace_in_output "$ws10" "$out_right"
open_media_apps

# Open workspace 1 in every screen and a terminal
open_workspace_in_output "$ws1l" "$out_left"
open_workspace_in_output "$ws1r" "$out_right"
open_workspace_in_output "$ws1c" "$out_center"
i3-msg exec alacritty 1> /dev/null
