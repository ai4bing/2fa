#!/usr/bin/sh

mfa () {
  printf "%s" "$(2fa ${1})" | tee /dev/tty | pbcopy 
  printf "\n"
}

_mfa () {
  local -a completion=($(sed 's/^\([^ ]*\).*/\1/' ~/.2fa | sort -u))
  _arguments ":operation:(${(j: :)completion})"
}

which compdef >/dev/null && compdef _mfa mfa
