return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            -- Modern DAP UI - better than dap-view
            {
                "rcarriga/nvim-dap-ui",
                dependencies = { "nvim-neotest/nvim-nio" },
            },
            -- Python-specific DAP configuration
            {
                "mfussenegger/nvim-dap-python",
                ft = "python",
            },
            -- Virtual text showing variable values
            "theHamsta/nvim-dap-virtual-text",
            "williamboman/mason.nvim",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local dap_python = require("dap-python")

            -- Setup DAP UI with better defaults
            dapui.setup({
                layouts = {
                    {
                        elements = {
                            { id = "scopes", size = 0.40 },
                            { id = "breakpoints", size = 0.20 },
                            { id = "stacks", size = 0.20 },
                            { id = "watches", size = 0.20 },
                        },
                        size = 50,
                        position = "left",
                    },
                    {
                        elements = {
                            { id = "repl", size = 0.5 },
                            { id = "console", size = 0.5 },
                        },
                        size = 10,
                        position = "bottom",
                    },
                },
            })

            -- Enable virtual text
            require("nvim-dap-virtual-text").setup({
                enabled = true,
                highlight_changed_variables = true,
                highlight_new_as_changed = true,
            })

            -- Auto-open/close DAP UI
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- Python configuration using dap-python
            -- Automatically finds debugpy in your virtual environment
            local function get_python_path()
                local cwd = vim.fn.getcwd()
                if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                    return cwd .. "/venv/bin/python"
                elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                    return cwd .. "/.venv/bin/python"
                else
                    return "python3"
                end
            end

            dap_python.setup(get_python_path())

            -- Additional Python test configurations
            dap_python.test_runner = "pytest"

            -- C/C++/Rust adapter
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = "codelldb",
                    args = { "--port", "${port}" },
                },
            }

            -- C/C++/Rust configurations
            local last_program = vim.fn.getcwd()
            local read_program = function()
                last_program = vim.fn.input("Run: ", last_program, "file")
                return last_program
            end

            local last_args = ""
            local read_args = function()
                last_args = vim.fn.input("Args: ", last_args, "file")
                return vim.split(last_args, " ")
            end

            dap.configurations.cpp = {
                {
                    name = "Launch program",
                    type = "codelldb",
                    request = "launch",
                    program = read_program,
                    args = read_args,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
                {
                    name = "Launch last",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return last_program
                    end,
                    args = function()
                        return vim.split(last_args, " ")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
            }
            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp

            -- Better breakpoint signs
            vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
            vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpoint", linehl = "", numhl = "" })
            vim.fn.sign_define("DapBreakpointRejected", { text = "○", texthl = "DapBreakpoint", linehl = "", numhl = "" })
            vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })

            -- Keymaps (also defined in which-key.lua for discoverability)
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
            vim.keymap.set("n", "<leader>dB", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end, { desc = "Conditional breakpoint" })
            vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
            vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
            vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })
            vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step out" })
            vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart" })
            vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run last" })
            vim.keymap.set("n", "<leader>dtt", dapui.toggle, { desc = "Toggle DAP UI" })
            vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, { desc = "Run to cursor" })
            vim.keymap.set("n", "<leader>dx", dap.terminate, { desc = "Terminate" })
            vim.keymap.set("n", "<leader>dh", function()
                require("dap.ui.widgets").hover()
            end, { desc = "Hover" })

            -- Python-specific keymaps
            vim.keymap.set("n", "<leader>dtm", dap_python.test_method, { desc = "Test method (Python)" })
            vim.keymap.set("n", "<leader>dtc", dap_python.test_class, { desc = "Test class (Python)" })
            vim.keymap.set("n", "<leader>ds", dap_python.debug_selection, { desc = "Debug selection (Python)" })

            -- Function keys for quick access
            vim.keymap.set("n", "<F5>", dap.continue)
            vim.keymap.set("n", "<F10>", dap.step_over)
            vim.keymap.set("n", "<F11>", dap.step_into)
            vim.keymap.set("n", "<F12>", dap.step_out)
        end,
    },
}
