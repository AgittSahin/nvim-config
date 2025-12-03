return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local fzf = require("fzf-lua")

            -- Setup fzf-lua with custom options
            fzf.setup({
                winopts = {
                    height = 0.85,
                    width = 0.80,
                    row = 0.35,
                    col = 0.50,
                    border = "rounded",
                    preview = {
                        layout = "horizontal",
                        horizontal = "right:50%",
                    },
                },
                keymap = {
                    builtin = {
                        ["<C-d>"] = "preview-page-down",
                        ["<C-u>"] = "preview-page-up",
                    },
                    fzf = {
                        ["ctrl-q"] = "select-all+accept",
                    },
                },
            })

            -- Quick access keymaps (non-leader)
            -- All leader mappings are in which-key.lua
            vim.keymap.set("n", "<leader><leader>", fzf.files, { desc = "Find files" })
            vim.keymap.set("n", "<C-/>", fzf.live_grep, { desc = "Live grep" })

            -- LSP mappings (non-leader)
            vim.keymap.set("n", "gr", fzf.lsp_references, { desc = "LSP References" })
            vim.keymap.set("n", "gd", fzf.lsp_definitions, { desc = "LSP Definitions" })
            vim.keymap.set("n", "gi", fzf.lsp_implementations, { desc = "LSP Implementations" })
        end
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        -- Keymaps defined in which-key.lua
        config = function()
            require("harpoon"):setup()
        end
    },
    {
        "stevearc/oil.nvim",
        dependencies = { "echasnovski/mini.icons", opts = {} },
        config = function()
            require("oil").setup({
                watch_for_changes = true,
                keymaps = {
                    ["-"] = { "actions.parent", mode = "n" },
                    ["_"] = { "actions.open_cwd", mode = "n" },
                    -- unbind nav mappings
                    ["<C-h>"] = false,
                    ["<C-l>"] = false,
                },
                view_options = {
                    show_hidden = true,
                },
                win_options = {
                    signcolumn = "yes",
                    winbar = "%{v:lua.require('oil').get_current_dir()}",
                }
            })
            -- Main keymap <leader>e defined in which-key.lua
            -- Quick access with "-" for parent directory
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end
    }
}
