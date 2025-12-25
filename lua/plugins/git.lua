return {
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
                    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
                    delete = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
                    topdelete = { hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
                    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
                },
                signcolumn = true,
                numhl = false,
                linehl = false,
                word_diff = false,
                current_line_blame = false,
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol",
                    delay = 1000,
                    ignore_whitespace = false,
                },
                current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil, -- Use default
                keymaps = {
                    -- Default keymaps
                    noremap = true,
                    buffer = true,
                    ["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
                    ["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},
                    ["n <leader>gs"] = "<cmd>Gitsigns stage_hunk<CR>",
                    ["v <leader>gs"] = "<cmd>Gitsigns stage_hunk<CR>",
                    ["n <leader>gu"] = "<cmd>Gitsigns undo_stage_hunk<CR>",
                    ["n <leader>gr"] = "<cmd>Gitsigns reset_hunk<CR>",
                    ["v <leader>gr"] = "<cmd>Gitsigns reset_hunk<CR>",
                    ["n <leader>gR"] = "<cmd>Gitsigns reset_buffer<CR>",
                    ["n <leader>gp"] = "<cmd>Gitsigns preview_hunk<CR>",
                    ["n <leader>gb"] = "<cmd>lua require('gitsigns').blame_line{full=true}<CR>",
                    ["n <leader>gtb"] = "<cmd>Gitsigns toggle_current_line_blame<CR>",
                    ["n <leader>gd"] = "<cmd>Gitsigns diffthis<CR>",
                    ["n <leader>gD"] = "<cmd>lua require('gitsigns').diffthis('~')<CR>",
                    ["n <leader>gtd"] = "<cmd>Gitsigns toggle_deleted<CR>",

                    -- Text object
                    ["o ih"] = ":<C-U>Gitsigns select_hunk<CR>",
                    ["x ih"] = ":<C-U>Gitsigns select_hunk<CR>"
                }
            })
        end,
    },
}
