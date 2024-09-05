export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
export PS1="%2~ > "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export DOTFILE_DIR=~/.dotfiles

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
