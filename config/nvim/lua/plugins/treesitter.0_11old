return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local nts = require("nvim-treesitter")
            nts.setup()
            nts.install { 'lua', 'c', 'python', 'json', 'toml', 'yaml', 'typst', 'bash' , 'markdown' }
            -- 根据文件类型开启语法高亮，代码折叠
            vim.api.nvim_create_autocmd('FileType', {
                pattern = { 'lua', 'c', 'python', 'json', 'typst', 'sh', 'markdown' },
                callback = function()
                    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'   --fold
                    vim.wo[0][0].foldmethod = 'expr'    --fold
                    vim.wo.foldlevel = 99 --fold，默认不要折叠
                    vim.treesitter.start()
                end,
            })
            -- 开启 Folding
            --vim.wo.foldmethod = 'expr'
            --vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
            -- 默认不要折叠
            -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
            --vim.wo.foldlevel = 99
        end,
    }
}
