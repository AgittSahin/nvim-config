return {
    {
        "tpope/vim-surround",
        event = { "BufReadPost", "BufNewFile" },
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        opts = {}
    },
    {
        "echasnovski/mini.ai",
        event = { "BufReadPost", "BufNewFile" },
        version = false,
        config = function()
            local spec_treesitter = require("mini.ai").gen_spec.treesitter
            require("mini.ai").setup({
                custom_textobjects = {
                    f = spec_treesitter({
                        a = "@function.outer",
                        i = "@function.inner",
                    }),
                    c = spec_treesitter({
                        a = "@class.outer",
                        i = "@class.inner",
                    }),
                },
            })
        end,
    },
}
