return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                -- 默认安装language parser
                ensure_installed = {
                    "lua",
                },
                sync_install = true,
                -- 语法高亮
                highlight = {
                    enable = true,
                },
                -- 启用基于Treesitter的代码格式化，visual模式下输入=号格式化
                indent = {
                    enable = true,
                },
            })
            -- 开启 Folding
            vim.wo.foldmethod = 'expr'
            vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
            -- 默认不要折叠
            -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
            vim.wo.foldlevel = 99
        end,
    }
}
