#!/bin/bash

function REALPATH() {
  local TARGET="$1"
  [ -f "$TARGET" ] || [ -d "$TARGET" ] || return 1 #no nofile

  while [ -L "$TARGET" ]; do
    TARGET="$(readlink "$TARGET")"
  done
  echo "$TARGET"
}
export -f REALPATH

function PAGER() {
    if [ -n "$PAGER" ]
    then
        $PAGER "$@"
    elif command -v less 2> /dev/null
    then
        less -EX "$@"
    else
        more "$@"
    fi
}
export -f PAGER

function GET_MTIME() {
    stat -f %S%m "$@"
}
export -f GET_MTIME
