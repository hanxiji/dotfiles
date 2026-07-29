return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        dependencies = {
            --"nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        }, -- if you prefer nvim-web-devicons
        ft = { "markdown", "norg", "rmd", "org", "codecompanion" },

        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
    {
        "selimacerbas/markdown-preview.nvim",
        dependencies = { "selimacerbas/live-server.nvim" },
        config = function()
            require("markdown_preview").setup({
                -- all optional; sane defaults shown
                instance_mode = "takeover",  -- "takeover" (one tab) or "multi" (tab per instance)
                port = 0,                    -- 0 = auto (8421 for takeover, OS-assigned for multi)
                default_theme = "dark",      -- "dark" or "light"; initial preview theme
                debounce_ms = 300,
                host = "0.0.0.0",
                open_browser = false,
                hooks = {
                    on_start = function(url)
                        vim.notify("Markdown Preview: " .. url, vim.log.levels.INFO)
                    end,
                },
            })
        end,
    }
}
