return {
    {
        "romus204/tree-sitter-manager.nvim",
        dependencies = {}, -- tree-sitter CLI must be installed system-wide
        config = function()
            require("tree-sitter-manager").setup({
                -- Default Options
                -- ensure_installed = {}, -- list of parsers to install at the start of a neovim session
                -- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
                -- auto_install = false, -- if enabled, install missing parsers when editing a new file
                -- highlight = true, -- treesitter highlighting is enabled by default
                -- languages = {}, -- override or add new parser sources
                -- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
                -- query_dir = vim.fn.stdpath("data") .. "/site/queries",
            })
            -- 开启 Folding
            vim.wo.foldmethod = 'expr'
            vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            -- 默认不要折叠
            -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
            vim.wo.foldlevel = 99
        end
    }
}
