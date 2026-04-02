# fzf configuration
# Requires: fzf, fd, bat

# ── Shell integration (keybindings + completion) ────────────────────────────
eval "$(fzf --zsh)"

# ── Default command: use fd (respects .gitignore, fast) ────────────────────
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude node_modules --exclude .cache --exclude dist --exclude build --exclude __pycache__ --exclude "*.pyc"'

# ── Default options ─────────────────────────────────────────────────────────
# FZF_THEME_COLORS is injected by the theme system via current.sh
export FZF_DEFAULT_OPTS="
  --height=50%
  --layout=reverse
  --border=rounded
  --prompt='  '
  --pointer='▶'
  --marker='✓'
  --bind=ctrl-/:toggle-preview
  --bind=ctrl-u:preview-half-page-up
  --bind=ctrl-d:preview-half-page-down
"

# ── Ctrl+T: file search with bat preview ────────────────────────────────────
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
  --preview 'bat --color=always --style=numbers --line-range=:300 {}'
  --preview-window=right:55%:wrap:hidden
"

# ── Alt+C: directory jump with tree preview ──────────────────────────────────
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git --exclude node_modules --exclude .cache'
export FZF_ALT_C_OPTS="
  --preview 'fd --type f --max-depth 2 . {} | head -50'
  --preview-window=right:40%
"

# ── Ctrl+R: history search ───────────────────────────────────────────────────
export FZF_CTRL_R_OPTS="
  --preview 'echo {}'
  --preview-window=down:3:wrap
  --bind='ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --header='ctrl-y: copy to clipboard'
"

# ── ff: fuzzy find file and open in vim ─────────────────────────────────────
ff() {
  local file
  file=$(fd --type f --hidden --follow --exclude .git --exclude node_modules --exclude .cache --exclude dist --exclude build | fzf \
    --preview 'bat --color=always --style=numbers --line-range=:300 {}' \
    --preview-window=right:55%:wrap:hidden \
    --query="$1")
  [[ -n "$file" ]] && ${EDITOR:-vim} "$file"
}

# ── fcd: fuzzy cd into any directory ────────────────────────────────────────
fcd() {
  local dir
  dir=$(fd --type d --hidden --follow --exclude .git | fzf \
    --preview 'fd --type f --max-depth 2 . {} | head -40' \
    --preview-window=right:40% \
    --query="$1")
  [[ -n "$dir" ]] && cd "$dir"
}

# ── fbr: fuzzy git branch checkout ──────────────────────────────────────────
fbr() {
  local branch
  branch=$(git branch -a | grep -v HEAD | sed 's/^[ *]*//' | sed 's|remotes/origin/||' | sort -u | fzf \
    --preview 'git log --oneline --graph --color=always $(echo {} | sed "s|remotes/origin/||") | head -30' \
    --preview-window=right:55%)
  [[ -n "$branch" ]] && git checkout "$branch"
}

# ── fgl: fuzzy git log browser ───────────────────────────────────────────────
fgl() {
  git log --oneline --color=always | fzf \
    --ansi \
    --preview 'git show --color=always {1}' \
    --preview-window=right:60%:wrap \
    --bind='enter:execute(git show --color=always {1} | less -R)'
}

# ── fkill: fuzzy process kill ────────────────────────────────────────────────
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf --multi \
    --preview 'echo {}' \
    --preview-window=down:3:wrap \
    --header='tab: multi-select' | awk '{print $2}')
  [[ -n "$pid" ]] && echo "$pid" | xargs kill -${1:-9}
}
