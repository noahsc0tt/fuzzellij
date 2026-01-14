#!/usr/bin/env bash

LIST=0
ATTACH=0
KILL=0
DELETE=0

while [[ $# -gt 0 ]]; do
    case "$1" in
        -l|--list) LIST=1; shift;;
        -a|--attach) ATTACH=1; shift;;
        -k|--kill) KILL=1; shift;;
        -d|--delete) DELETE=1; shift;;
        *) echo "unknown option: $1"; exit 1;;
    esac
done

if [[ $LIST -eq 1 ]]; then
    zellij list-sessions
    exit
fi

selection=$(zellij list-sessions \
    | sed 's/ \[.*$//' \
    | fzf --preview-window hidden)

if [[ -z "$selection" ]]; then
    exit 1
elif [[ $ATTACH -eq 1 ]]; then
    zellij attach "$selection"
elif [[ $KILL -eq 1 ]]; then
    zellij kill-session "$selection"
elif [[ $DELETE -eq 1 ]]; then
    zellij delete-session --force "$selection"
else
    echo "$selection"
fi
