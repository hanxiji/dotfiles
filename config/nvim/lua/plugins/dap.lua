return {
	{
		"mfussenegger/nvim-dap",
        lazy = false,
        config = function ()
            require("config.keybindings").mapDap()
        end
	},
	{
        "rcarriga/nvim-dap-ui",
        lazy = false,
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function ()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()
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
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        lazy = false,
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        opts = {},
        config = function ()
            require("nvim-dap-virtual-text").setup()
        end
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "mason.nvim"
        },
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
            automatic_installation = true,
            handlers = {},
            ensure_installed = {
                -- Update this to ensure that you have the debuggers for the langs you want
            },
        },
        config = function()
            require("mason-nvim-dap").setup()
        end,
    },
}
