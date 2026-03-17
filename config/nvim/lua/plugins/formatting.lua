return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		-- This will provide type hinting with LuaLS
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt" },
				python = { "ruff" },
				c = { "clang-format" },
				--javascript = { "prettierd", "prettier", stop_after_first = true },
			},
			-- Set default options
            default_format_opts = {
                timeout_ms = 3000,
                async = false, -- not recommended to change
                quiet = false, -- not recommended to change
                lsp_format = "fallback", -- not recommended to change
            },
			-- Set up format-on-save
			--format_on_save = { timeout_ms = 500 },
			format_on_save = false,
			-- Customize formatters
			formatters = {
                injected = { options = { ignore_errors = true } },
				shfmt = {
					prepend_args = { "-i", "2", "-ci" },
				},
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
			--vim.api.nvim_create_user_command("Format", function(args)
			--	local range = nil
			--	if args.count ~= -1 then
			--		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
			--		range = {
			--			start = { args.line1, 0 },
			--			["end"] = { args.line2, end_line:len() },
			--		}
			--	end
			--	require("conform").format({ async = false, lsp_format = "fallback", range = range })
			--end, { range = true })
		end,
	},
}
