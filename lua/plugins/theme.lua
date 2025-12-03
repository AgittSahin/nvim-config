return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = function()
            local function get_short_cwd()
                return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
            end

            return {
                options = {
                    theme = "auto",
                    globalstatus = false,
                    component_separators = { left = "|", right = "|" },
                    section_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = {
                        "branch",
                        {
                            "diff",
                            symbols = { added = " ", modified = " ", removed = " " },
                        },
                    },
                    lualine_c = {
                        { get_short_cwd },
                        {
                            "filename",
                            path = 1, -- relative path
                            symbols = {
                                modified = "[+]",
                                readonly = "[-]",
                                unnamed = "[No Name]",
                            },
                        },
                    },
                    lualine_x = {
                        {
                            "diagnostics",
                            sources = { "nvim_lsp" },
                            symbols = { error = " ", warn = " ", info = " ", hint = " " },
                        },
                        "encoding",
                        {
                            "fileformat",
                            symbols = {
                                unix = "LF",
                                dos = "CRLF",
                                mac = "CR",
                            },
                        },
                        "filetype",
                    },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                extensions = { "oil", "trouble" },
            }
        end,
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "night",
                styles = {
                    keywords = { italic = false },
                },
                on_colors = function(colors)
                    colors.git = {
                        -- add = "#82c13e",
                        -- change = "#d4902b",
                        -- delete = "#f10e38",
                        add = colors.green,
                        change = colors.yellow,
                        delete = colors.red,
                    }
                end,
                on_highlights = function(highlights, colors)
                    highlights.MatchParen = {
                        bg = colors.blue0,
                        bold = true,
                    }
                end,
            })
            vim.cmd.colorscheme "tokyonight"
        end
    },
    { "EdenEast/nightfox.nvim" },
    { "vague2k/vague.nvim" },
}
