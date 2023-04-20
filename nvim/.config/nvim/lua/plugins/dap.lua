local function dap_ui_config()
    local dap, dapui = require("dap"), require("dapui")
    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end
end

local dap_dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    {
        "rcarriga/nvim-dap-ui",
        config = dap_ui_config,
    },
    "nvim-telescope/telescope-dap.nvim",
    "rcarriga/cmp-dap",
}

local function dap_config()
    local dap = require("dap")

    dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/bin/lldb-vscode',
        name = 'lldb'
    }

    dap.configurations.rust = {
        {
            name = 'Launch',
            type = 'lldb',
            request = 'launch',
            program = function()
                vim.fn.jobstart('cargo build')
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {},
        }
    }

    local ok_cmp, cmp = pcall(require, "cmp")
    if ok_cmp then
        cmp.setup.filetype({ "dap-repl", "dapui_watches" }, {
            sources = cmp.config.sources({
                { name = "dap" },
            }, {
                { name = "buffer" },
            }),
        })
    end

    vim.keymap.set("n", "<F5>", dap.continue)
    vim.keymap.set("n", "<F10>", dap.step_over)
    vim.keymap.set("n", "<F11>", dap.step_into)
    vim.keymap.set("n", "<F12>", dap.step_out)
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
    vim.keymap.set("n", "<leader>dr", dap.repl.open)
    vim.keymap.set("n", "<leader>cb", dap.clear_breakpoints)
    vim.keymap.set("n", "<leader>B", function()
        dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
    end
    )
    vim.keymap.set("n", "<leader>lp", function()
        dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
    end
    )

    -- set dap breakpoint icon
    vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "LspDiagnosticsSignError" })

    require("nvim-dap-virtual-text").setup {}
end

return {
    "mfussenegger/nvim-dap",
    dependencies = dap_dependencies,
    config = dap_config,
}
