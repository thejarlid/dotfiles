# Themes

Unified tmux + shell theme switcher. Themes live in `available/` and apply live to running tmux sessions.

## Usage

```sh
theme <name>       # switch to a theme
theme              # list available themes
```

## Available themes

| Name | Background | Accent |
|------|-----------|--------|
| `flate` | `#14151e` | Purple `#7c6fd4` |
| `default` | `#303030` | Blue `colour81` |
| `snazzy` | `#282a36` | Cyan `#57c7ff` |
| `batman` | `#0a0a0a` | Gold `#f0c000` |
| `matrix` | `#000000` | Green `#2cc55d` |
| `preppy-green` | `#051519` | Teal `#39a7a2` |
| `grass` | `#105a46` | Cyan `#55ffff` |

## Adding a theme

Copy an existing definition and edit the values:

```sh
cp themes/available/default.sh themes/available/mytheme.sh
```

### Theme file fields

```sh
THEME_PROMPT_BRANCH_COLOR=242       # zsh prompt git branch color (256 color code)
THEME_TERMINAL_BG="#1c1d27"         # iTerm background color (optional, for reference)
THEME_LSCOLORS="ExGxFxdxCxDxDxabagacad"   # macOS ls colors

THEME_TMUX_ACTIVE_FG="#c8c8d4"
THEME_TMUX_ACTIVE_BG="#1c1d27"
THEME_TMUX_INACTIVE_FG="#4a4b5e"
THEME_TMUX_INACTIVE_BG="#14151e"
THEME_TMUX_BORDER_FG="#2a2b3a"
THEME_TMUX_ACTIVE_BORDER_FG="#7c6fd4"
```

## iTerm color schemes

Standalone `.itermcolors` files live in `themes/` and can be imported into iTerm2 independently of the theme switcher.

**Import:** Preferences → Profiles → Colors → Color Presets → Import

| File | Description |
|------|-------------|
| `flate.itermcolors` | Derived from the flate vim colorscheme palette |

## How it works

1. `theme <name>` sources `available/<name>.sh`
2. Writes `current.tmux` (gitignored) and reloads tmux immediately if inside a session
3. Writes `current.sh` (gitignored) with `LSCOLORS` and prompt color — sourced by zshrc on next shell start or `theme` call
4. nvim uses monotone as its colorscheme unconditionally — the tmux background color shows through via transparent `Normal` bg

## LSCOLORS reference

Each pair of characters in `LSCOLORS` is (fg, bg) for a file type, in this order:
directory, symlink, socket, pipe, executable, block special, char special, setuid exe, setgid exe, sticky+writable dir, writable dir.

Colors: `a`=black `b`=red `c`=green `d`=yellow `e`=blue `f`=magenta `g`=cyan `h`=grey `x`=default. Uppercase = bold.
