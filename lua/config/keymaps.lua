-- Buffer navigation (leader mappings in which-key.lua)
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Quick split shortcuts
vim.keymap.set("n", "|", "<C-w>v", { desc = "Vertical split" })
vim.keymap.set("n", "_", "<C-w>s", { desc = "Horizontal split" })

-- Terminal window navigation (allows moving in/out of terminal with Ctrl+hjkl)
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move to left window from terminal" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Move to bottom window from terminal" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Move to top window from terminal" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Move to right window from terminal" })

-- Terminal mode escape (easier way to exit terminal mode)
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Terminal mode paste from clipboard (Ctrl+v to paste)
vim.keymap.set("t", "<C-v>", function()
    local reg = vim.fn.getreg("+")  -- Get clipboard content
    local formatted = reg:gsub("\n", "\r")  -- Replace newlines with carriage returns for terminal
    vim.api.nvim_feedkeys(formatted, "t", true)
end, { desc = "Paste from clipboard in terminal" })

-- Terminal visual mode for yanking (enter normal mode from terminal to scroll/yank)
vim.keymap.set("t", "<C-S-v>", "<C-\\><C-n>", { desc = "Enter normal mode to scroll/yank terminal output" })

-- When in normal mode on a terminal buffer, make it easy to go back to insert
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.scrollback = 10000  -- Keep more terminal history

        -- Easy way to go back to terminal insert mode from normal mode
        vim.keymap.set("n", "i", "i", { buffer = true, desc = "Enter terminal insert mode" })
        vim.keymap.set("n", "a", "a", { buffer = true, desc = "Enter terminal insert mode" })
        vim.keymap.set("n", "<CR>", "i", { buffer = true, desc = "Enter terminal insert mode" })
    end,
})

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
vim.keymap.set("v", "H", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", "L", ">gv", { desc = "Indent right and reselect" })

-- Visual mode J/K to move selection up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- clear search highlight
vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")

-- options menu
vim.keymap.set("n", "<leader>oo", function()
  require("config.options-menu").show_options_menu()
end, { desc = "⚙️  Options & Settings Menu" })

-- J stays on the same line
vim.keymap.set("n", "J", "mzJ`z")

-- sanity centering
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- diagnostics
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
