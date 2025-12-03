return {
    -- Commenting
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- Better diagnostics/quickfix/loclist
    -- Keymaps defined in which-key.lua
    {
        "folke/trouble.nvim",
        cmd = { "Trouble", "TroubleToggle" },
        opts = {},
    },

    -- LSP progress notifications
    {
        "j-hui/fidget.nvim",
        event = "LspAttach",
        opts = {
            notification = {
                window = {
                    winblend = 0,
                },
            },
        },
    },

    -- Better notifications
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        config = function()
            local notify = require("notify")
            notify.setup({
                background_colour = "#000000",
                timeout = 3000,
                max_height = function()
                    return math.floor(vim.o.lines * 0.75)
                end,
                max_width = function()
                    return math.floor(vim.o.columns * 0.75)
                end,
            })
            vim.notify = notify
        end,
    },

    -- Undo tree visualization
    -- Keymap <leader>u defined in which-key.lua
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
    },

    -- Color highlighter
    {
        "norcalli/nvim-colorizer.lua",
        event = "BufReadPre",
        config = function()
            require("colorizer").setup({
                "*",
            }, {
                RGB = true,
                RRGGBB = true,
                names = true,
                RRGGBBAA = true,
                rgb_fn = true,
                hsl_fn = true,
                css = true,
                css_fn = true,
            })
        end,
    },

    -- Session management
    -- Keymaps <leader>s* defined in which-key.lua
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {},
    },
}
