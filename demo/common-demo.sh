#!/bin/bash
__dirDemo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${__dirDemo}/demo-magic.sh"

DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"
TYPE_SPEED=35
TYPE_SPEED=100
ctx=kind-eck-demo
elastic_ns=elastic-system
switch_windows_editor=true
window_editor_name="ECK-demo"
editor_alias="code"
kubectl config set-context $ctx --namespace=$elastic_ns
clear
cmd
clear

function switchEditorIfNeeded(){
  if $switch_windows_editor ; then
    wmctrl -a "$window_editor_name"
    PROMPT_TIMEOUT=0
    wait
  fi
}

function runIde(){
  $editor_alias ${__dirDemo}/.. > /dev/null 2>&1 &
}