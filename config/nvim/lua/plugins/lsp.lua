return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp"
        },
        opts = {
            servers = {
                lua_ls = {},
                gopls = {},
                pylsp = {
                    --[[settings = {
                        pylsp = {
                            plugins = {
                                ruff = {
                                    enabled = true,  -- Enable the plugin
                                }
                            }
                        }
                    }]]
                },
                --ruff = true,
                clangd = {},
            }
        },
        config = function(_,opts)
            for server, config in pairs(opts.servers) do
                -- print(server,type(config))

                if (config ~= nil and (config == true or type(config)=="table")) then
                    vim.lsp.enable(server)

                    if (type(config)=="table") then
                        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                        vim.lsp.config(server,config)
                    end
                end
                -- passing config.capabilities to blink.cmp merges with the capabilities in your
                -- `opts[server].capabilities, if you've defined it
            end
            --[[
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- lua
			vim.lsp.enable("lua_ls")
            vim.lsp.config("lua_ls", {
                capabilities = capabilities
            })
            --require'lspconfig'.lua_ls.setup{}

            -- golang
			vim.lsp.enable("gopls")
            vim.lsp.config("gopls", {
                capabilities = capabilities
            })

            -- python
			vim.lsp.enable("pylsp")
            vim.lsp.config("pylsp", {
                capabilities = capabilities
            })
			vim.lsp.enable("ruff")
        ]]
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
            "nvim-tree/nvim-web-devicons", -- optional
			-- "neovim/nvim-lspconfig",
		},
		config = function()
            require("lspsaga").setup({
                lightbulb = {   -- 告警灯泡提示，由nvim的sign-column功能提供
                    enable = true,            -- 是否启用               
                    virtual_text = true,   -- 是否展示告警灯泡到行末的virtual text
                    sign = false    -- 是否告警灯泡到sign-column行
                },
                --signature_help = {
                --    bind = true,        -- 自动绑定快捷键
                --    handler_opts = {
                --        border = 'single' -- 窗口边框
                --    }
                --}
            })
            local bufnr = false
            require("config.keybindings").mapLsp(bufnr)
		end,
	},
}
