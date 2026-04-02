# Themes

Unified tmux + vim theme switcher. Themes live in `available/` and are applied live to running tmux sessions, with vim picking up changes on next focus.

## Usage

```sh
theme <name>       # switch to a theme
theme              # list available themes
```

The `theme` alias is defined in `zshrc`. Sourced by `tmux.conf` and `vimrc` via generated `current.tmux` / `current.vim` files (gitignored).

## Available themes

| Name      | Based on              |
|-----------|-----------------------|
| `default` | Current iTerm profile (`#272935` bg) |
| `snazzy`  | iTerm Snazzy profile (`#282a36` bg)  |
| `matrix`  | iTerm matrix profile (black + green) |
| `grass`   | iTerm forrest blue profile (`#051519` bg, teal accent) |

## Adding a theme

Copy an existing definition and edit the values:

```sh
cp themes/available/default.sh themes/available/mytheme.sh
```

### Theme file fields

```sh
# Vim
THEME_VIM_COLORSCHEME="flate2"   # must be installed in vim
THEME_VIM_BACKGROUND="dark"      # dark | light

# Tmux pane colours (hex or tmux colour names e.g. colour234)
THEME_TMUX_ACTIVE_FG="default"
THEME_TMUX_ACTIVE_BG="#282a36"
THEME_TMUX_INACTIVE_FG="#686868"
THEME_TMUX_INACTIVE_BG="#3c3e4a"
THEME_TMUX_BORDER_FG="#3c3e4a"
THEME_TMUX_ACTIVE_BORDER_FG="#57c7ff"
```

**Tip:** for inactive panes on a dark background, make `INACTIVE_BG` slightly *lighter* and more washed out than `ACTIVE_BG` — going darker makes it look more focused, not less.

## How it works

1. `theme <name>` sources `available/<name>.sh` and writes `current.tmux` and `current.vim`
2. `tmux source-file` is called immediately — tmux updates live
3. `vimrc` re-sources `current.vim` on `FocusGained` — open vim instances update on next focus
4. `current.vim` sets `Normal` background to `NONE` so tmux controls pane background through transparency
