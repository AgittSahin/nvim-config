# 🚀 Neovim Configuration

A modern, feature-rich Neovim configuration built with Lua and lazy.nvim. Optimized for software development with LSP, debugging, and powerful navigation tools.

## ✨ Features

- **Plugin Manager**: [lazy.nvim](https://github.com/folke/lazy.nvim) for fast plugin loading
- **LSP Support**: Full Language Server Protocol integration with Mason
- **Code Completion**: nvim-cmp with multiple sources (LSP, snippets, buffer, path)
- **Fuzzy Finding**: FzfLua for blazing fast file and text search
- **Git Integration**: Fugitive, Gitsigns, and FzfLua git commands
- **Debugging**: nvim-dap with UI for debugging support
- **Syntax Highlighting**: Treesitter for accurate syntax highlighting
- **Terminal Integration**: Built-in terminal with tmux-like navigation
- **Session Management**: Automatic session persistence
- **Code Navigation**: Harpoon for quick file navigation
- **Diagnostics**: Trouble for organized error/warning viewing
- **File Explorer**: Oil.nvim for buffer-like file editing
- **Undo History**: Visual undo tree

## 📋 Requirements

- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (for live grep)
- [fd](https://github.com/sharkdp/fd) (optional, for better file search)
- [lazygit](https://github.com/jesseduffield/lazygit) (optional, for git UI)

## 🚀 Installation

### Quick Install

```bash
bash <(curl -s https://raw.githubusercontent.com/YOUR_USERNAME/nvim-config/main/install.sh)
```

### Manual Install

1. Backup your existing Neovim configuration:
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. Clone this repository:
```bash
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim
```

3. Create undo directory:
```bash
mkdir -p ~/.vim/undodir
```

4. Start Neovim:
```bash
nvim
```

Lazy.nvim will automatically install all plugins on first launch.

5. Install language servers:
```
:Mason
```

## 🎨 Themes

Current theme: **Tokyo Night** (Night variant)

Available themes:
- Tokyo Night (default)
- Nightfox
- Vague

Change theme with `<leader>tc` or modify `lua/plugins/theme.lua`

## ⌨️  Keybindings

Leader key: `<Space>`

### 🔍 Find (Fuzzy Search)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Find git files |
| `<leader>fr` | Find recent files |
| `<leader>fw` | Find word (live grep) |
| `<leader>fb` | Find in current buffer |
| `<leader>fh` | Find help |
| `<leader>fk` | Find keymaps |
| `<leader>fc` | Find commands |
| `<leader>fn` | Find in nvim config |
| `<leader>fW` | Find word under cursor |
| `<leader>fR` | Resume last search |

### 󰊢 Git

| Key | Action |
|-----|--------|
| `<leader>gg` | Git status (Fugitive) |
| `<leader>gc` | Git commit |
| `<leader>gp` | Git push |
| `<leader>gP` | Git pull |
| `<leader>gl` | Git log |
| `<leader>gb` | Git branches |
| `<leader>gf` | Git files (status) |
| `<leader>gC` | Git commits |
| `<leader>gs` | Stage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gS` | Stage buffer |
| `<leader>gR` | Reset buffer |
| `<leader>gu` | Undo stage hunk |
| `<leader>gd` | Diff this |
| `<leader>gB` | Blame line |
| `<leader>gv` | Preview hunk |

### 󰓩 Buffer Management

| Key | Action |
|-----|--------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<leader>bb` | List buffers |
| `<leader>bd` | Delete buffer |
| `<leader>bD` | Delete other buffers |
| `<leader>bw` | Wipeout buffer |

### 󰘦 Code (LSP)

| Key | Action |
|-----|--------|
| `<leader>cf` | Format code |
| `<leader>cr` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>cd` | Document diagnostics |
| `<leader>cD` | Workspace diagnostics |
| `<leader>cs` | Document symbols |
| `<leader>cS` | Workspace symbols |
| `<leader>ci` | LSP info |
| `<leader>cR` | LSP restart |
| `gd` | Go to definition |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `K` | Hover documentation |
| `gl` | Show line diagnostics |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |

### 󰃤 Debug (DAP)

| Key | Action |
|-----|--------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Continue |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>dr` | Restart |
| `<leader>dt` | Toggle DAP UI |
| `<leader>dC` | Run to cursor |

### 🪟 Window Navigation

| Key | Action |
|-----|--------|
| `<C-h>` | Move to left window |
| `<C-j>` | Move to bottom window |
| `<C-k>` | Move to top window |
| `<C-l>` | Move to right window |
| `\|` | Vertical split |
| `_` | Horizontal split |

### 🖥️  Terminal

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Navigate to window from terminal |
| `<Esc><Esc>` | Exit terminal mode |
| `<C-v>` | Paste in terminal |
| `<C-S-v>` | Enter normal mode (for scrolling/yanking) |

### 󰔡 Toggle

| Key | Action |
|-----|--------|
| `<leader>tw` | Toggle line wrap |
| `<leader>tn` | Toggle relative numbers |
| `<leader>ts` | Toggle spell check |
| `<leader>tc` | Change colorscheme |
| `<leader>th` | Toggle inlay hints |
| `<leader>td` | Toggle diagnostics panel |

### 󰛢 Harpoon (Quick File Navigation)

| Key | Action |
|-----|--------|
| `<leader>hh` | Harpoon menu |
| `<leader>ha` | Add file to harpoon |
| `<leader>h1-4` | Jump to harpoon file 1-4 |

### 󱖫 Trouble (Diagnostics)

| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle diagnostics |
| `<leader>xd` | Document diagnostics |
| `<leader>xs` | Symbols |
| `<leader>xl` | LSP definitions/references |
| `<leader>xq` | Quickfix list |

### 📝 Editing

| Key | Action |
|-----|--------|
| `<A-j>` | Move line/selection down |
| `<A-k>` | Move line/selection up |
| `J` (visual) | Move selection down |
| `K` (visual) | Move selection up |
| `H` (visual) | Indent left |
| `L` (visual) | Indent right |
| `J` (normal) | Join lines (stay in place) |
| `n` / `N` | Next/prev search (centered) |
| `<C-d>` / `<C-u>` | Scroll down/up (centered) |

### 🔧 Other

| Key | Action |
|-----|--------|
| `<leader>u` | Undo tree |
| `<leader>o` | Options menu |
| `<leader>qq` | Quit all |
| `<leader>qw` | Save and quit all |
| `<Esc>` | Clear search highlight |

## 🔧 Language Servers

Configured language servers (auto-installed via Mason):

- **Python**: basedpyright
- **C/C++**: clangd
- **Lua**: lua_ls
- **Rust**: rust_analyzer
- **YAML**: yamlls (with schema support)

Add more servers in `lua/plugins/lsp.lua`

## 🎯 Code Formatters

Configured formatters (via conform.nvim):

- **C/C++**: clang-format
- **Python**: ruff (format + organize imports)
- **Lua**: stylua
- **Rust**: rustfmt
- **YAML/JSON/Markdown**: prettier

## 📁 Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lazy-lock.json          # Plugin version lock file
├── lua/
│   ├── config/
│   │   ├── lazy.lua        # Lazy.nvim bootstrap
│   │   ├── settings.lua    # Vim options
│   │   ├── keymaps.lua     # Key mappings
│   │   └── options-menu.lua # Interactive options menu
│   └── plugins/
│       ├── coding.lua      # Completion & snippets
│       ├── dap.lua         # Debugging
│       ├── editor.lua      # Editor enhancements (gitsigns, comments, etc.)
│       ├── lsp.lua         # LSP configuration
│       ├── navigation.lua  # File navigation (oil, harpoon, etc.)
│       ├── theme.lua       # Colorschemes & statusline
│       ├── tmux.lua        # Tmux integration
│       ├── treesitter.lua  # Syntax highlighting
│       ├── utilities.lua   # Utility plugins (sessions, undotree, etc.)
│       └── which-key.lua   # Keybinding helper
├── install.sh              # Installation script
└── README.md              # This file
```

## 🎨 Customization

### Change Theme

Edit `lua/plugins/theme.lua`:
```lua
vim.cmd.colorscheme "tokyonight"  -- Change to your preferred theme
```

### Add New Language Server

1. Open Mason: `:Mason`
2. Search for your language server: `/your-lsp`
3. Press `i` to install
4. Add configuration in `lua/plugins/lsp.lua`:
```lua
local servers = {
    your_lsp = {},
}
```

### Modify Keybindings

- Global keybindings: `lua/config/keymaps.lua`
- Leader keybindings: `lua/plugins/which-key.lua`

### Add New Plugin

Create or edit files in `lua/plugins/`:
```lua
return {
    "author/plugin-name",
    opts = {},
}
```

## 🐛 Troubleshooting

### Check Neovim Health
```
:checkhealth
```

### Plugin Issues
```
:Lazy sync
:Lazy clean
:Lazy restore
```

### LSP Not Working
```
:LspInfo
:Mason
:LspRestart
```

### Clear Cache
```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

## 📚 Plugin List

<details>
<summary>Click to expand full plugin list</summary>

### Core
- lazy.nvim - Plugin manager
- which-key.nvim - Keybinding helper

### LSP & Completion
- nvim-lspconfig - LSP configuration
- mason.nvim - LSP/DAP/Linter installer
- mason-lspconfig.nvim - Mason + LSP integration
- nvim-cmp - Completion engine
- LuaSnip - Snippet engine
- cmp-nvim-lsp - LSP completion source
- cmp-buffer - Buffer completion source
- cmp-path - Path completion source
- conform.nvim - Code formatter

### Navigation & Search
- fzf-lua - Fuzzy finder
- oil.nvim - File explorer
- harpoon - Quick file navigation
- vim-tmux-navigator - Tmux integration

### Git
- vim-fugitive - Git commands
- gitsigns.nvim - Git decorations

### Syntax & UI
- nvim-treesitter - Syntax highlighting
- tokyonight.nvim - Colorscheme
- lualine.nvim - Statusline
- nvim-web-devicons - Icons

### Editing
- nvim-autopairs - Auto close brackets
- Comment.nvim - Easy commenting
- nvim-surround - Surround text objects

### Debugging
- nvim-dap - Debug adapter protocol
- nvim-dap-ui - DAP UI
- nvim-dap-python - Python debugging

### Utilities
- trouble.nvim - Diagnostics list
- undotree - Visual undo history
- persistence.nvim - Session management
- lazydev.nvim - Lua development
