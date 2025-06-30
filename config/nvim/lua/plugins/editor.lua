return {
	--{
	--	"echasnovski/mini.pairs",
	--	version = false,
	--	config = function()
	--		require("mini.pairs").setup()
	--	end,
	--},
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
        -- fuzzy模糊搜索
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "echasnovski/mini.icons" },
        opts = {
            winopts = {
                preview = {
                    layout = "vertical",    -- horizontal|vertical|flex
                },
            },
            lsp = {
                jump1 = false,  --结果只有一个时是否自动跳转
            }
        }
    },
    {
        -- 查找替换
        "MagicDuck/grug-far.nvim",
        -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
        -- additional lazy config to defer loading is not really needed...
        config = function()
            -- optional setup call to override plugin options
            -- alternatively you can set options with vim.g.grug_far = { ... }
            require("grug-far").setup({
                -- options, see Configuration section below
                -- there are no required options atm
            });
        end
    },
    --{
    --    "smjonas/inc-rename.nvim",
    --    opts = {},
    --    config = function()
    --        require("inc_rename").setup()
    --    end
    --},
    {
        "lewis6991/gitsigns.nvim",
        --event = "LazyFile",
        opts = {},
        config = function(_,opts)
            require("gitsigns").setup(opts)
        end
    },
    {
        "sindrets/diffview.nvim",
        --event = "LazyFile",
        opts = {
            view = {
                -- Configure the layout and behavior of different types of views.
                -- Available layouts:
                --  'diff1_plain'
                --    |'diff2_horizontal'
                --    |'diff2_vertical'
                --    |'diff3_horizontal'
                --    |'diff3_vertical'
                --    |'diff3_mixed'
                --    |'diff4_mixed'
                -- For more info, see |diffview-config-view.x.layout|.
                merge_tool = {
                    -- Config for conflicted files in diff views during a merge or rebase.
                    layout = "diff3_mixed",
                    disable_diagnostics = true,   -- Temporarily disable diagnostics for diff buffers while in the view.
                    winbar_info = true,           -- See |diffview-config-view.x.winbar_info|
                },
            },
        },
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts={
            on_open = function(term)
                --print("打开一个终端：",term.bufnr)
                -- 终端打开时执行的函数（如绑定快捷键）
                local opts = { buffer = term.bufnr }
                vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)  -- Esc 退出终端模式
                vim.keymap.set('t', '<esc><esc>', [[<C-\><C-n><C-W>c]], { noremap = true,silent = true,desc = "关闭当前term窗口" })  -- Esc 退出终端模式
            end,
        },
        config = function (_,opts)
            require("toggleterm").setup(opts)
            require("config.keybindings").mapTerm()
        end
    },
    {
        "keaising/im-select.nvim",
        config = function()
            require("im_select").setup({
                -- 默认事件 "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave"
                set_default_events = { "VimEnter", "InsertLeave", },
            })
        end,
    }
}
