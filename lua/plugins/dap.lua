return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "igorlfs/nvim-dap-view",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
            "williamboman/mason.nvim",
        },
        config = function()
            local dap = require "dap"
            local dapview = require "dap-view"

            require("dap-view").setup()
            require("nvim-dap-virtual-text").setup()

            local last_program = vim.fn.getcwd();
            local read_program = function()
                last_program = vim.fn.input("Run: ", last_program, "file")
                return last_program
            end

            local last_args = "";
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

            -- Python configurations
            dap.configurations.python = {
                {
                    type = "python",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    pythonPath = function()
                        -- Try to use virtualenv python first
                        local cwd = vim.fn.getcwd()
                        if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                            return cwd .. "/venv/bin/python"
                        elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                            return cwd .. "/.venv/bin/python"
                        else
                            return "/usr/bin/python3"
                        end
                    end,
                },
                {
                    type = "python",
                    request = "launch",
                    name = "Launch file with args",
                    program = "${file}",
                    args = function()
                        local args_string = vim.fn.input("Arguments: ")
                        return vim.split(args_string, " +")
                    end,
                    pythonPath = function()
                        local cwd = vim.fn.getcwd()
                        if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                            return cwd .. "/venv/bin/python"
                        elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                            return cwd .. "/.venv/bin/python"
                        else
                            return "/usr/bin/python3"
                        end
                    end,
                },
                {
                    type = "python",
                    request = "attach",
                    name = "Attach remote",
                    connect = function()
                        local host = vim.fn.input("Host [127.0.0.1]: ")
                        host = host ~= "" and host or "127.0.0.1"
                        local port = tonumber(vim.fn.input("Port [5678]: ")) or 5678
                        return { host = host, port = port }
                    end,
                },
            }

            -- Adapters
            require("dap").adapters.codelldb = {
                type = "executable",
                command = "codelldb",
            }

            dap.adapters.python = {
                type = "executable",
                command = "python3",
                args = { "-m", "debugpy.adapter" },
            }

            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>dd", dap.run_to_cursor)
            vim.keymap.set("n", "<F1>", dap.continue)
            vim.keymap.set("n", "<F2>", dap.step_into)
            vim.keymap.set("n", "<F3>", dap.step_over)
            vim.keymap.set("n", "<F4>", dap.step_out)
            vim.keymap.set("n", "<F5>", dap.restart)
            vim.keymap.set("n", "<F11>", dap.run_last)
            vim.keymap.set("n", "<F12>", dapview.toggle)
        end,
    },
}
