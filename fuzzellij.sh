#!/usr/bin/env bash

ATTACH=0
KILL=0
DELETE=0

function show_help() {
    echo "Usage: $0 [OPTIONS]"
    echo
    echo "If no options are provided, the selected session name will be written to stdout."
    echo
    echo "Options:"
    echo "  -l, --list        List all sessions"
    echo "  -a, --attach      Attach to a session"
    echo "  -k, --kill        Kill a session"
    echo "  -d, --delete      Delete a session"
    echo "  -h, --help        Show this help message"
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help) show_help; exit 0;;
        -l|--list) zellij list-sessions; exit 0;;
        -a|--attach) ATTACH=1; shift;;
        -k|--kill) KILL=1; shift;;
        -d|--delete) DELETE=1; shift;;
        *) echo "unknown option: $1"; exit 1;;
    esac
done

((ATTACH + KILL + DELETE > 1)) && {
    echo "Only use one of --attach, --kill, --delete" >&2
    exit 1
}

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
