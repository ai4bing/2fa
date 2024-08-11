#!/usr/bin/sh

mfa () {
  local output="$(2fa ${1})"
  printf "%s" "$output" | pbcopy
  # don't write to /dev/tty
  echo "$output"
}

_mfa () {
  local -a completion=($(sed 's/^\([^ ]*\).*/\1/' ~/.2fa | sort -u))
  _arguments ":operation:(${(j: :)completion})"
}

which compdef >/dev/null && compdef _mfa mfa
