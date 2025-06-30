return {
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	{
		"nvim-tree/nvim-web-devicons",
    },
    {
        "echasnovski/mini.icons",
        version = false
    },
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = true,
		cmd = "NvimTreeToggle",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	--[[
    -- neo-tree插件，这个插件相比nvim-tree功能要多很多，目前暂时用不到
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        lazy = false,
        ---@module "neo-tree"
        ---@type neotree.Config?
        opts = {
            buffers = {
                follow_current_file = {
                    enabled = true,
                },
            },
        },
    },]]
	--[[{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- Uncomment whichever supported plugin(s) you use
			-- "nvim-tree/nvim-tree.lua",
			"nvim-neo-tree/neo-tree.nvim",
			-- "simonmclean/triptych.nvim"
		},
		config = function()
			require("lsp-file-operations").setup({
                debug = false,
				operations = {
					willRenameFiles = true,
					didRenameFiles = true,
					willCreateFiles = true,
					didCreateFiles = true,
					willDeleteFiles = true,
					didDeleteFiles = true,
				},
			})
		end,
	},]]
	{
		"stevearc/oil.nvim",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			columns = {
				"icon",
				-- "type",
				-- "permissions",
				-- "size",
				{ "mtime", format = "%y-%m-%d %H:%M" },
			},
			win_options = {
				signcolumn = "yes",
			},
		},
		config = function(_, opts)
			local oil = require("oil")
			oil.setup(opts)
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lualine").setup({})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		config = function()
			--vim.opt.termguicolors = true -- 已在options.lua中设置
			require("bufferline").setup({
				options = {
					number = "ordinal",
					-- 左侧让出nvim-tree插件位置
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							highlight = "Directory",
							text_align = "left",
							separator = true,
						},
                        -- 左侧让出neo-tree的位置
						{
							filetype = "neo-tree",
							text = "File Explorer",
							highlight = "Directory",
							text_align = "left",
							separator = true,
						},
					},
				},
			})
		end,
	},
	{
		"echasnovski/mini.bufremove",
		version = false,
		config = function()
            -- buffer关闭插件，封装了原生命令bdelete和bwipeout，可自动选择替代缓冲区保持窗口布局
            -- 使用原生命令删除当前buffer时会导致nvim-tree,neo-tree这些插件布局出现异常
			require("config.keybindings").mapMiniBufremove()
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
            preset = "modern",   -- 弹出窗口样式 "classic" | "modern" | "helix"
            win = {
                no_overlap = false, -- 不允许弹出窗口与光标重叠，光标在某些位置时会导致弹出窗口变窄，可设置为false避免
            }

        },
	},
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile = { enabled = true },
            dashboard = { enabled = false },
            explorer = { enabled = false },
            image = { enabled = false },
            indent = { enabled = true },
            input = { enabled = false },
            lazygit = {
                enabled = false
            },
            picker = { enabled = false },
            notifier = {
                enabled = true,
                timeout = 5000,
            },
            quickfile = { enabled = false },
            scope = { enabled = true },
            scroll = { enabled = false },
            statuscolumn = { enabled = false },
            words = { enabled = false },
        },
        init = function ()
            require("config.keybindings").mapSnacks()
        end
    }
}
