function _update_ps1() {
    PS1="$(~/powerline-shell.py --mode compatible $? 2> /dev/null)"
  }

removelink() {
    [ -L "$1" ] && cp --remove-destination "$(readlink "$1")" "$1"
  }
PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
PATH=$PATH:/Users/jessbreckenridge/github/shell/bin
export GIT_EDITOR=`which vim`
#export GH_ENV='production'
export VAULT_URL=none
eval "$(rbenv init -)"
