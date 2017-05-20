function _update_ps1() {
    PS1="$(~/powerline-shell.py --mode compatible $? 2> /dev/null)"
  }

PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

if command -v tmux>/dev/null; then
    [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi
