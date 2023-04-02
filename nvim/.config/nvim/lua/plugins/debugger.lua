local function nvim_dap_config()  
    local ok, dap = pcall(require, "dap")
    if not ok then return end

    vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
    vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>")
    vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>")
    vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
    vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
    vim.keymap.set("n", "<leader>B",
        ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
    vim.keymap.set("n", "<leader>lp",
        ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
    vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
    vim.keymap.set("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")

    require("nvim-dap-virtual-text").setup()
    require("dapui").setup()

    local dapui = require("dapui")
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

return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "theHamsta/nvim-dap-virtual-text",

            { 
                "mfussenegger/nvim-dap",
                config = nvim_dap_config,
            },     
        },
    }
}
