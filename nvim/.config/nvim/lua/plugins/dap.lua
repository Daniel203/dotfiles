local dap_dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "nvim-telescope/telescope-dap.nvim",
    "jay-babu/mason-nvim-dap.nvim",
}

local function dap_ui_config()
    local dapui = require("dapui")
    local dap = require("dap")

    -- set dap breakpoint icon
    -- vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "LspDiagnosticsSignError" })
    vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "LspDiagnosticsSignError" })

    require("nvim-dap-virtual-text").setup {}
    dapui.setup({
        enter = true,
        layouts = {
            {
                elements = {
                    { id = 'scopes',  size = 0.50 },
                    { id = 'watches', size = 0.50 },
                },
                position = 'left',
                size = 40,
            },
            {
                elements = {
                    { id = 'repl', size = 0.9 }
                },
                position = 'bottom',
                size = 10
            },
        },
    })

    dap.listeners.before.attach.dapui_config = function()
        dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
    end
end

local function dap_config()
    local dap = require("dap")
    local mason_dap = require("mason-nvim-dap")

    dap.set_log_level("TRACE")

    mason_dap.setup({
        ensure_installed = {
            "delve",
            "codelldb",
        },
        automatic_installation = true,
        handlers = {
            function(config)
                mason_dap.default_setup(config)
            end,
        }
    })

    dap.adapters.codelldb = {
        type = 'server',
        port = "${port}",
        executable = {
            command = '/home/daniel/.config/local/share/nvim/mason/bin/codelldb',
            args = { "--port", "${port}" },
        }
    }

    dap.configurations.rust = {
        {
            name = 'Debug',
            type = 'codelldb',
            request = 'launch',
            program = function()
                vim.fn.jobstart('cargo build')
                return vim.fn.getcwd() .. "/target/debug/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            showDisassembly = "never",
            args = function()
                local input = vim.fn.input('Arguments: ')
                return vim.split(input, " ", { trimempty = true })
            end,
        }
    }

    -- vim.keymap.set("n", "<F1>", dap.continue)
    -- vim.keymap.set("n", "<F2>", dap.step_into)
    -- vim.keymap.set("n", "<F3>", dap.step_over)
    -- vim.keymap.set("n", "<F4>", dap.step_out)
    -- vim.keymap.set("n", "<F5>", dap.step_back)
    -- vim.keymap.set("n", "<F6>", dap.restart)

    vim.keymap.set("n", "<F1>", dap.continue)
    vim.keymap.set("n", "<F2>", dap.step_over)
    vim.keymap.set("n", "<F3>", dap.step_into)
    vim.keymap.set("n", "<F4>", dap.step_back)
    vim.keymap.set("n", "<F5>", dap.step_out)
    vim.keymap.set("n", "<F6>", dap.terminate)

    vim.keymap.set("n", "<leader>rc", dap.run_to_cursor)
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
    vim.keymap.set("n", "<leader>cb", dap.clear_breakpoints)
    vim.keymap.set("n", "<leader>B", function()
        dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
    end
    )
    vim.keymap.set("n", "<leader>?", function()
        require("dapui").eval(nil, { enter = true })
    end
    )
end

return {
    {
        "mfussenegger/nvim-dap",
        dependencies = dap_dependencies,
        config = dap_config,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-dap-virtual-text", "mfussenegger/nvim-dap" },
        config = dap_ui_config,
    }
}
