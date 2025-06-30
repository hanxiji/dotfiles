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
        opts = {}
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
        opts = {},
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
            end,
        },
        config = function (_,opts)
            require("toggleterm").setup(opts)
            require("config.keybindings").mapTerm()
        end
    },
}
