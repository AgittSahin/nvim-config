-- number/sign column
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- cursorline
vim.opt.cursorline = true

-- line wrap
vim.opt.wrap = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- scroll
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- split behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- performance
vim.opt.updatetime = 250
-- timeoutlen is set in which-key.lua

-- mouse
vim.opt.mouse = "a"

-- indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- undo
vim.opt.swapfile = false
vim.opt.backup = false
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir
vim.opt.undofile = true

-- colors
vim.opt.termguicolors = true
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- clipboard (yank automatically goes to system clipboard)
vim.opt.clipboard = "unnamedplus"

-- GUI-specific tweaks (Neovide)
if vim.g.neovide then
  -- smooth cursor trail similar to animated screenshot
  vim.g.neovide_cursor_animation_length = 0.08
  vim.g.neovide_cursor_trail_size = 0.8
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_smooth_blink = true
  vim.g.neovide_cursor_antialiasing = true

  -- particle effect behind cursor
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
  vim.g.neovide_cursor_vfx_particle_density = 15.0
  vim.g.neovide_cursor_vfx_particle_speed = 10.0
  vim.g.neovide_cursor_vfx_particle_phase = 1.5
  vim.g.neovide_cursor_vfx_particle_curl = 0.8
end
