export DOTFILE_DIR=~/.dotfiles
eval "$(/opt/homebrew/bin/brew shellenv)"
unalias theme 2>/dev/null
theme() { $DOTFILE_DIR/themes/theme "$@" && source $DOTFILE_DIR/themes/current.sh }
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

#export PS1="%2~ > "
source $DOTFILE_DIR/git-prompt.sh
setopt PROMPT_SUBST 
GIT_PS1_SHOWDIRTYSTATE=1 # unstaged (*) and staged (+) changes will be shown next to the branch name
GIT_PS1_SHOWUNTRACKEDFILES=1 # if there're untracked files, then a '%' will be shown next to the branch name
PS1='%{$(tput setaf 75)%}%~ %{$(tput setaf ${THEME_PROMPT_BRANCH_COLOR:-242})%}$(__git_ps1 " (%s) ")%{$(tput setaf 123)%}> '

export CLICOLOR=1
source $DOTFILE_DIR/themes/current.sh
source $DOTFILE_DIR/fzf.zsh
# ctags-init: set up auto-updating ctags via git hooks in any project
ctags-init() {
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "not a git repo"
    return 1
  fi
  local hooks=$(git rev-parse --git-dir)/hooks
  for hook in post-commit post-merge post-checkout; do
    echo '#!/bin/sh\nctags -R . &' > "$hooks/$hook"
    chmod +x "$hooks/$hook"
  done
  ctags -R .
  echo "ctags initialised — will auto-update on commit/merge/checkout"
}

# Load local overrides and secrets if present
if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi

# +------------+
# | NAVIGATION |
# +------------+

setopt AUTO_CD              # Go to folder path without using cd.

# +---------+
# | HISTORY |
# +---------+

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# +------------------+
# | AUTO SUGGESTIONS |
# +------------------+
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# +-----------------+
# | AUTO COMPLETION |
# +-----------------+
source $DOTFILE_DIR/completions.zsh

# +---------------------+
# | SYNTAX HIGHLIGHTING |
# +---------------------+
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
