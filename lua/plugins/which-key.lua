return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
        config = function()
            local wk = require("which-key")

            wk.setup({
                plugins = {
                    marks = true,
                    registers = true,
                    spelling = {
                        enabled = true,
                        suggestions = 20,
                    },
                    presets = {
                        operators = true,
                        motions = true,
                        text_objects = true,
                        windows = true,
                        nav = true,
                        z = true,
                        g = true,
                    },
                },
                icons = {
                    breadcrumb = "»",
                    separator = "➜",
                    group = "",
                    keys = {
                        Space = " ",
                    },
                    rules = false,
                },
                disable = {
                    ft = {},
                    bt = {},
                },
                win = {
                    border = "rounded",
                    padding = { 2, 2, 2, 2 },
                },
                layout = {
                    height = { min = 4, max = 25 },
                    width = { min = 20, max = 50 },
                    spacing = 3,
                    align = "left",
                },
                show_keys = false,
            })

            wk.add({
                -- ═══════════════════════════════════════════════════════════
                -- MAIN GROUPS
                -- ═══════════════════════════════════════════════════════════
                { "<leader>f", group = "🔍 Find" },
                { "<leader>g", group = "󰊢 Git" },
                { "<leader>b", group = "󰓩 Buffer" },
                { "<leader>c", group = "󰘦 Code" },
                { "<leader>d", group = "󰃤 Debug" },
                { "<leader>t", group = "󰔡 Toggle" },
                { "<leader>s", group = "󰆓 Session" },
                { "<leader>h", group = "󰛢 Harpoon" },
                { "<leader>x", group = "󱖫 Trouble" },
                { "<leader>q", group = "󰗼 Quit" },

                -- ═══════════════════════════════════════════════════════════
                -- 🔍 FIND (All search operations)
                -- ═══════════════════════════════════════════════════════════
                { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
                { "<leader>fg", "<cmd>FzfLua git_files<cr>", desc = "Find git files" },
                { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Find recent files" },
                { "<leader>fw", "<cmd>FzfLua live_grep<cr>", desc = "Find word (grep)" },
                { "<leader>fb", "<cmd>FzfLua lgrep_curbuf<cr>", desc = "Find in buffer" },
                { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Find help" },
                { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Find keymaps" },
                { "<leader>fc", "<cmd>FzfLua commands<cr>", desc = "Find commands" },
                { "<leader>fn", "<cmd>lua require('fzf-lua').files({cwd=vim.fn.stdpath('config')})<cr>", desc = "Find in nvim config" },
                { "<leader>fm", "<cmd>FzfLua marks<cr>", desc = "Find marks" },
                { "<leader>fj", "<cmd>FzfLua jumps<cr>", desc = "Find jumps" },
                { "<leader>fW", "<cmd>FzfLua grep_cword<cr>", desc = "Find word under cursor" },
                { "<leader>fR", "<cmd>FzfLua resume<cr>", desc = "Resume last search" },

                -- ═══════════════════════════════════════════════════════════
                -- 󰊢 GIT (All git operations)
                -- ═══════════════════════════════════════════════════════════
                { "<leader>gg", "<cmd>Git<cr>", desc = "Git status" },
                { "<leader>gc", "<cmd>Git commit<cr>", desc = "Commit" },
                { "<leader>gp", "<cmd>Git push<cr>", desc = "Push" },
                { "<leader>gP", "<cmd>Git pull<cr>", desc = "Pull" },
                { "<leader>gl", "<cmd>Git log<cr>", desc = "Log" },
                { "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "Branches" },
                { "<leader>gf", "<cmd>FzfLua git_status<cr>", desc = "Git files (status)" },
                { "<leader>gC", "<cmd>FzfLua git_commits<cr>", desc = "Commits" },
                -- Gitsigns operations (defined in editor.lua on_attach, listed here for visibility)
                { "<leader>gs", desc = "Stage hunk" },
                { "<leader>gr", desc = "Reset hunk" },
                { "<leader>gS", desc = "Stage buffer" },
                { "<leader>gR", desc = "Reset buffer" },
                { "<leader>gu", desc = "Undo stage hunk" },
                { "<leader>gd", desc = "Diff this" },
                { "<leader>gD", desc = "Diff ~" },
                { "<leader>gB", desc = "Blame line" },
                { "<leader>gv", desc = "Preview hunk" },

                -- ═══════════════════════════════════════════════════════════
                -- 󰓩 BUFFER
                -- ═══════════════════════════════════════════════════════════
                { "<leader>bb", "<cmd>FzfLua buffers<cr>", desc = "List buffers" },
                { "<leader>bn", "<cmd>bnext<cr>", desc = "Next buffer" },
                { "<leader>bp", "<cmd>bprevious<cr>", desc = "Previous buffer" },
                { "<leader>bd", "<cmd>bdelete<cr>", desc = "Delete buffer" },
                { "<leader>bD", "<cmd>%bd|e#<cr>", desc = "Delete other buffers" },
                { "<leader>bw", "<cmd>bwipeout<cr>", desc = "Wipeout buffer" },

                -- ═══════════════════════════════════════════════════════════
                -- 󰘦 CODE (LSP operations)
                -- ═══════════════════════════════════════════════════════════
                { "<leader>cf", "<cmd>lua require('conform').format({ async = true, lsp_format = 'fallback' })<cr>", desc = "Format" },
                { "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
                { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code action" },
                { "<leader>cd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document diagnostics" },
                { "<leader>cD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace diagnostics" },
                { "<leader>cs", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Document symbols" },
                { "<leader>cS", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "Workspace symbols" },
                { "<leader>ci", "<cmd>LspInfo<cr>", desc = "LSP info" },
                { "<leader>cR", "<cmd>LspRestart<cr>", desc = "LSP restart" },
                { "<leader>cl", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens run" },

                -- ═══════════════════════════════════════════════════════════
                -- 󰃤 DEBUG
                -- ═══════════════════════════════════════════════════════════
                { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "Toggle breakpoint" },
                { "<leader>dc", "<cmd>lua require('dap').continue()<cr>", desc = "Continue" },
                { "<leader>di", "<cmd>lua require('dap').step_into()<cr>", desc = "Step into" },
                { "<leader>do", "<cmd>lua require('dap').step_over()<cr>", desc = "Step over" },
                { "<leader>dO", "<cmd>lua require('dap').step_out()<cr>", desc = "Step out" },
                { "<leader>dr", "<cmd>lua require('dap').restart()<cr>", desc = "Restart" },
                { "<leader>dl", "<cmd>lua require('dap').run_last()<cr>", desc = "Run last" },
                { "<leader>dt", "<cmd>lua require('dap-view').toggle()<cr>", desc = "Toggle DAP UI" },
                { "<leader>dC", "<cmd>lua require('dap').run_to_cursor()<cr>", desc = "Run to cursor" },

                -- ═══════════════════════════════════════════════════════════
                -- 󰔡 TOGGLE
                -- ═══════════════════════════════════════════════════════════
                { "<leader>tw", function()
                    vim.opt.wrap = not vim.opt.wrap:get()
                    print("Wrap: " .. (vim.opt.wrap:get() and "ON" or "OFF"))
                end, desc = "Toggle wrap" },
                { "<leader>tn", function()
                    vim.opt.relativenumber = not vim.opt.relativenumber:get()
                    print("Relative number: " .. (vim.opt.relativenumber:get() and "ON" or "OFF"))
                end, desc = "Toggle relative number" },
                { "<leader>ts", function()
                    vim.opt.spell = not vim.opt.spell:get()
                    print("Spell check: " .. (vim.opt.spell:get() and "ON" or "OFF"))
                end, desc = "Toggle spell check" },
                { "<leader>tc", "<cmd>FzfLua colorschemes<cr>", desc = "Change colorscheme" },
                { "<leader>th", function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                    print("Inlay hints: " .. (vim.lsp.inlay_hint.is_enabled() and "ON" or "OFF"))
                end, desc = "Toggle inlay hints" },
                { "<leader>td", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle diagnostics (Trouble)" },

                -- ═══════════════════════════════════════════════════════════
                -- 󰆓 SESSION
                -- ═══════════════════════════════════════════════════════════
                { "<leader>ss", "<cmd>lua require('persistence').save()<cr>", desc = "Save session" },
                { "<leader>sr", "<cmd>lua require('persistence').load()<cr>", desc = "Restore session" },
                { "<leader>sl", "<cmd>lua require('persistence').load({ last = true })<cr>", desc = "Restore last session" },
                { "<leader>sd", "<cmd>lua require('persistence').stop()<cr>", desc = "Don't save session" },

                -- ═══════════════════════════════════════════════════════════
                -- 󰛢 HARPOON
                -- ═══════════════════════════════════════════════════════════
                { "<leader>hh", "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<cr>", desc = "Harpoon menu" },
                { "<leader>ha", "<cmd>lua require('harpoon'):list():add()<cr>", desc = "Harpoon add" },
                { "<leader>h1", "<cmd>lua require('harpoon'):list():select(1)<cr>", desc = "Harpoon 1" },
                { "<leader>h2", "<cmd>lua require('harpoon'):list():select(2)<cr>", desc = "Harpoon 2" },
                { "<leader>h3", "<cmd>lua require('harpoon'):list():select(3)<cr>", desc = "Harpoon 3" },
                { "<leader>h4", "<cmd>lua require('harpoon'):list():select(4)<cr>", desc = "Harpoon 4" },

                -- ═══════════════════════════════════════════════════════════
                -- 󱖫 TROUBLE
                -- ═══════════════════════════════════════════════════════════
                { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle diagnostics" },
                { "<leader>xw", "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace diagnostics" },
                { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Document diagnostics" },
                { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols" },
                { "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP definitions/references" },
                { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location list" },
                { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list" },

                -- ═══════════════════════════════════════════════════════════
                -- 󰗼 QUIT
                -- ═══════════════════════════════════════════════════════════
                { "<leader>qq", "<cmd>qa<cr>", desc = "Quit all" },
                { "<leader>qw", "<cmd>wqa<cr>", desc = "Save and quit all" },
                { "<leader>qQ", "<cmd>qa!<cr>", desc = "Force quit all" },

                -- ═══════════════════════════════════════════════════════════
                -- SINGLE OPERATIONS (no group)
                -- ═══════════════════════════════════════════════════════════
                { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo tree" },
                { "<leader>o", "<cmd>lua require('config.options-menu').show_options_menu()<cr>", desc = "Options menu" },
            })
        end,
    },
}
