# Dotfiles

Personal dotfiles for macOS, managed with [Dotbot](https://github.com/anishathalye/dotbot).
Built around iTerm2 + tmux + nvim with a lightweight, keyboard-driven setup.

---

## Fresh machine setup

### 1. Install prerequisites

```sh
# Xcode command line tools (required for git, make, clang, sourcekit-lsp)
xcode-select --install

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Core dependencies
brew install neovim fzf fd bat universal-ctags ripgrep git-lfs vim

# Nerd Font (required for nvim icons)
brew install --cask font-jetbrains-mono-nerd-font
```

### 2. Clone and install dotfiles

```sh
git clone https://github.com/thejarlid/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
```

Dotbot will symlink all configs and auto-clone zsh plugins.

### 3. Apply a theme

```sh
theme flate   # or: default, snazzy, matrix, batman, preppy-green, grass
```

### 4. iTerm2

- Install [iTerm2](https://iterm2.com)
- Import profile: **Preferences → Profiles → Other Actions → Import JSON Profiles** → `iterm_profiles.json`
- Import color scheme: **Preferences → Profiles → Colors → Color Presets → Import** → `themes/flate.itermcolors`
- Set font to **JetBrainsMono Nerd Font** in **Preferences → Profiles → Text**

### 5. Open nvim

On first launch, lazy.nvim installs all plugins automatically. Mason then installs LSP servers in the background.

---

## Dependencies

| Tool | Purpose | Install |
|------|---------|---------|
| `neovim` | Primary editor | `brew install neovim` |
| `vim` | Fallback editor (SSH, quick edits) | `brew install vim` |
| `fzf` | Fuzzy finder | `brew install fzf` |
| `fd` | Fast file finder (used by fzf) | `brew install fd` |
| `bat` | Syntax-highlighted file preview | `brew install bat` |
| `ripgrep` | Fast grep (used by fzf + nvim) | `brew install ripgrep` |
| `universal-ctags` | Jump-to-definition indexing | `brew install universal-ctags` |
| `git-lfs` | Git large file storage | `brew install git-lfs` |
| JetBrainsMono Nerd Font | Icons in nvim | `brew install --cask font-jetbrains-mono-nerd-font` |
| iTerm2 | Terminal emulator | [iterm2.com](https://iterm2.com) |

Zsh plugins (`zsh-autosuggestions`, `zsh-syntax-highlighting`) are cloned automatically by `./install`.

---

## Theme system

Themes live in `themes/available/`. Switch with the `theme` command:

```sh
theme flate         # apply a theme
theme               # list available themes
```

Available: `flate`, `snazzy`, `default`, `grass`, `matrix`, `batman`, `preppy-green`

Each theme controls:
- tmux pane and status bar colors
- `ls` output colors (`LSCOLORS`)
- Shell prompt git branch color

### iTerm color schemes

`themes/flate.itermcolors` is a standalone iTerm2 color preset derived from the flate palette.
Import via **Preferences → Profiles → Colors → Color Presets → Import**.

### Adding a theme

Create `themes/available/<name>.sh`:

```sh
THEME_PROMPT_BRANCH_COLOR=242
THEME_LSCOLORS="ExGxFxdxCxDxDxabagacad"

THEME_TMUX_ACTIVE_FG="#c8c8d4"
THEME_TMUX_ACTIVE_BG="#1c1d27"
THEME_TMUX_INACTIVE_FG="#4a4b5e"
THEME_TMUX_INACTIVE_BG="#14151e"
THEME_TMUX_BORDER_FG="#2a2b3a"
THEME_TMUX_ACTIVE_BORDER_FG="#7c6fd4"
```

---

## Karabiner-Elements

Config lives at `karabiner/karabiner.json` and is symlinked to `~/.config/karabiner/karabiner.json` by dotbot. Any changes made in Karabiner-Elements write through the symlink back to the dotfiles.

Install: `brew install --cask karabiner-elements`

### Caps Lock remapping

| Input | Output |
|-------|--------|
| Tap Caps Lock | Escape |
| Hold Caps Lock + any key | Left Control |
| Shift + Caps Lock | True Caps Lock |
| Fn + Caps Lock | True Caps Lock |

This makes Caps Lock the most useful key on the keyboard — Escape for vim/nvim mode switching, Control for terminal shortcuts, and true Caps Lock still accessible when needed.

---

## tmux cheat sheet

| Key | Action |
|-----|--------|
| `Ctrl+B` | Prefix |
| `Prefix \|` | Split vertically |
| `Prefix -` | Split horizontally |
| `Prefix r` | Reload config |
| `Ctrl+H/J/K/L` | Navigate panes (no prefix needed) |

---

## nvim cheat sheet

Leader key is `<Space>`.

### Dashboard

Opens automatically on `nvim` with no file. Keys: `f` find file, `r` recent, `g` grep, `n` new, `q` quit.

### Files & search

| Key | Action |
|-----|--------|
| `<Space>ff` | Find file |
| `<Space>fg` | Live grep across project |
| `<Space>fb` | Search open buffers |
| `<Space>fh` | Search help tags |
| `<Space>?` | Search all keymaps |
| `Ctrl+P` | Git files |

### Buffers

| Key | Action |
|-----|--------|
| `<Tab>` / `<S-Tab>` | Next / previous buffer |
| `<Space>1-9` | Jump to buffer by position |
| `<Space>b` | Fuzzy pick buffer |
| `<Space>d` | Close buffer |

### File tree

| Key | Action |
|-----|--------|
| `<Space>e` | Toggle file tree |
| `<CR>` | Open file |
| `<C-v>` | Open in vertical split |
| `<C-s>` | Open in horizontal split |
| `<C-t>` | Open in new tab |

### Splits

| Key | Action |
|-----|--------|
| `<Space>w` | Open vertical split |
| `<C-w>s` | Open horizontal split |
| `<C-h/j/k/l>` | Move between splits |
| `<C-w>=` | Equalise split sizes |
| `<C-w>q` | Close split |

### LSP (active when a language server attaches)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover docs |
| `<Space>rn` | Rename symbol |
| `<Space>ca` | Code action |
| `[d` / `]d` | Previous / next diagnostic |

### Completion

| Key | Action |
|-----|--------|
| `<C-n>` / `<C-p>` | Next / previous suggestion |
| `<Enter>` | Confirm |
| `<C-Space>` | Force open menu |
| `<C-e>` | Close menu |

### Tags (ctags)

Run `ctags-init` once in a project root to build the index and install auto-update git hooks.

| Key | Action |
|-----|--------|
| `Ctrl+]` | Jump to definition |
| `Ctrl+T` | Jump back |
| `Ctrl+W ]` | Definition in split |
| `<Space>]` | Pick from multiple matches |

### Editing

| Key | Action |
|-----|--------|
| `jj` | Exit insert mode |

---

## vim cheat sheet

Vim is kept as a lightweight fallback. Leader key is `<Space>`.

| Key | Action |
|-----|--------|
| `<Space>f` | Fuzzy find file |
| `<Space>r` | Fuzzy grep |
| `<Space>/` | Fuzzy search current file |
| `<Space>t` | Fuzzy tags |
| `<Tab>` / `<S-Tab>` | Next / previous buffer |
| `<Space>d` | Close buffer |
| `<Space>w` | Vertical split |
| `Ctrl+H/J/K/L` | Move between splits |
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
| `ff [query]` | Find file, open in nvim |
| `fcd [query]` | Fuzzy cd anywhere |
| `fbr` | Fuzzy git branch checkout |
| `fgl` | Browse git log, Enter to inspect commit |
| `fkill` | Fuzzy kill process (Tab for multi-select) |

---

## License

Copyright (c) Dilraj Devgun. Released under the MIT License. See [LICENSE.md](LICENSE.md) for details.
