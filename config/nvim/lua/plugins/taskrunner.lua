return {
	{
		"stevearc/overseer.nvim",
		cmd = {
			"OverseerOpen",
			"OverseerClose",
			"OverseerToggle",
			"OverseerSaveBundle",
			"OverseerLoadBundle",
			"OverseerDeleteBundle",
			"OverseerRunCmd",
			"OverseerRun",
			"OverseerInfo",
			"OverseerBuild",
			"OverseerQuickAction",
			"OverseerTaskAction",
			"OverseerClearCache",
		},
        init = function ()
            require("config.keybindings").mapOverseer()
        end,
        config = function()
            local overseer = require("overseer")
            overseer.setup({
                templates = { "builtin", "mytasks.python_uv_runner" },
                dap = false,
                task_list = {
                    bindings = {
                        ["<C-u>"] = false,
                        ["<C-d>"] = false,
                        ["<C-h>"] = false,
                        ["<C-j>"] = false,
                        ["<C-k>"] = false,
                        ["<C-l>"] = false,
                    },
                },
            })
        end
	},
}
