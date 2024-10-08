export DOTFILE_DIR=~/.dotfiles
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

#export PS1="%2~ > "
source $DOTFILE_DIR/git-prompt.sh
setopt PROMPT_SUBST 
GIT_PS1_SHOWDIRTYSTATE=1 # unstaged (*) and staged (+) changes will be shown next to the branch name
GIT_PS1_SHOWUNTRACKEDFILES=1 # if there're untracked files, then a '%' will be shown next to the branch name
PS1='%{$(tput setaf 75)%}%~ %{$(tput setaf 242)%}$(__git_ps1 " (%s) ")%{$(tput setaf 123)%}> '

export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

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
