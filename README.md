# Dotfiles

Personal dotfiles for macOS, managed with [Dotbot](https://github.com/anishathalye/dotbot).
Optimised for iTerm2 + tmux + vim with a lightweight, fast setup.

---

## Fresh machine setup

### 1. Install prerequisites

```sh
# Xcode command line tools (required for git, make, etc.)
xcode-select --install

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Core dependencies
brew install fzf fd bat universal-ctags ripgrep git-lfs vim
```

### 2. Clone and install dotfiles

```sh
git clone https://github.com/thejarlid/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
```

### 4. Install vim plugins

Open vim and run:
```
:PlugInstall
```

### 5. Apply a theme

```sh
theme snazzy   # or: default, grass, matrix, batman, preppy-green
```

### 6. iTerm2

- Install [iTerm2](https://iterm2.com)
- Import the profile: **Preferences → Profiles → Other Actions → Import JSON Profiles** → select `iterm_profiles.json`
- Set the profile background color to match your theme's inactive bg to eliminate the gap below tmux

---

## Dependencies

| Tool | Purpose | Install |
|------|---------|---------|
| `vim` | Editor | `brew install vim` |
| `fzf` | Fuzzy finder | `brew install fzf` |
| `fd` | Fast file finder (used by fzf) | `brew install fd` |
| `bat` | Syntax-highlighted file preview | `brew install bat` |
| `ripgrep` (`rg`) | Fast grep (used by fzf + vim) | `brew install ripgrep` |
| `universal-ctags` | Jump-to-definition indexing | `brew install universal-ctags` |
| `git-lfs` | Git large file storage | `brew install git-lfs` |
| `zsh-autosuggestions` | Shell history suggestions | included as submodule |
| `zsh-syntax-highlighting` | Shell syntax colors | included as submodule |
| iTerm2 | Terminal emulator | [iterm2.com](https://iterm2.com) |

---

## Theme system

Themes live in `themes/available/`. Switch with the `theme` command (only active inside iTerm2).

```sh
theme snazzy        # apply a theme
theme               # list available themes
```

Available: `snazzy`, `default`, `grass`, `matrix`, `batman`, `preppy-green`

Each theme controls:
- tmux pane and status bar colors
- vim colorscheme overrides (`vim/theme-overrides/<name>.vim`)
- `ls` output colors (`LSCOLORS`)
- Shell prompt git branch color

### Adding a new theme

Create `themes/available/<name>.sh`:

```sh
THEME_VIM_COLORSCHEME="flate2"
THEME_VIM_BACKGROUND="dark"
THEME_LSCOLORS="GxCxfxdxbxegedabagacad"
THEME_PROMPT_BRANCH_COLOR=242

THEME_TMUX_ACTIVE_FG="#eff0eb"
THEME_TMUX_ACTIVE_BG="#282a36"
THEME_TMUX_INACTIVE_FG="#686868"
THEME_TMUX_INACTIVE_BG="#3c3e4a"
THEME_TMUX_BORDER_FG="#686880"
THEME_TMUX_ACTIVE_BORDER_FG="#57c7ff"
```

Optionally add `vim/theme-overrides/<name>.vim` for per-theme vim highlight overrides.

---

## tmux cheat sheet

| Key | Action |
|-----|--------|
| `Ctrl+B` | Prefix |
| `Prefix \|` | Split horizontally |
| `Prefix -` | Split vertically |
| `Prefix r` | Reload config |
| `Ctrl+H/J/K/L` | Navigate panes |

---

## vim cheat sheet

Leader key is `'`

### Files & buffers

| Key | Action |
|-----|--------|
| `'f` | Fuzzy find file |
| `'p` | Fuzzy switch buffer |
| `'r` | Fuzzy grep across project |
| `'/` | Fuzzy search current file |
| `'t` | Fuzzy search tags in file |
| `Tab` / `Shift+Tab` | Next / previous buffer |
| `'d` | Close buffer |
| `'b` | List + jump to buffer |
| `'w` | Open vertical split |
| `Ctrl+H/J/K/L` | Move between splits |

### Jump to definition (ctags)

Run `ctags-init` once in any project root — builds the tag index and installs git hooks that auto-regenerate tags on every commit, merge, and checkout.

```sh
cd ~/projects/myapp
ctags-init
```

| Key | Action |
|-----|--------|
| `Ctrl+]` | Jump to definition |
| `Ctrl+T` | Jump back |
| `Ctrl+W ]` | Definition in split |
| `']` | Pick from multiple matches |
| `gf` | Open file under cursor |

### Typical project session

```sh
cd ~/projects/myapp
ctags-init       # first time only
vim .

# inside vim:
'f               # open a file
Ctrl+]           # jump into a definition
Ctrl+T           # jump back
'r               # search a term across the whole project
Tab              # flip to the file that just opened
'w               # split, open a second file side by side
Ctrl+H/L         # move between splits
:wa              # save all open buffers
```

### Editing

| Key | Action |
|-----|--------|
| `jj` | Exit insert mode |

---

## fzf cheat sheet

### Shell keybindings

| Key | Action |
|-----|--------|
| `Ctrl+T` | Fuzzy find file, paste into command |
| `Ctrl+R` | Fuzzy command history |
| `Alt+C` | Fuzzy cd into directory |
| `Ctrl+/` | Toggle preview pane |
| `Ctrl+U/D` | Scroll preview |

### Shell functions

| Command | Action |
|---------|--------|
| `ff [query]` | Find file, open in vim |
| `fcd [query]` | Fuzzy cd anywhere |
| `fbr` | Fuzzy git branch checkout |
| `fgl` | Browse git log, Enter to inspect commit |
| `fkill` | Fuzzy kill process (Tab for multi-select) |

### Composing with pipes

```sh
git diff --name-only | fzf | xargs vim
docker ps | fzf | awk '{print $1}' | xargs docker stop
grep Host ~/.ssh/config | fzf | awk '{print $2}' | xargs ssh
```

---

## License

Copyright (c) Dilraj Devgun. Released under the MIT License. See [LICENSE.md](LICENSE.md) for details.
