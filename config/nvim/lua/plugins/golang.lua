return {
    --[[{
        "ray-x/go.nvim",
        dependencies = {  -- optional packages
            -- "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = {"CmdlineEnter"},
        ft = {"go", 'gomod'},
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },]]
    {
        "leoluz/nvim-dap-go",
        opts = {},
        config = function ()
            require("dap-go").setup({
                --[[
                -- 额外的 DAP 配置
                dap_configurations = {
                    {
                        type = "go",
                        name = "Attach remote",
                        mode = "remote",
                        request = "attach",
                    },
                },
                -- Delve 配置
                delve = {
                    path = "dlv",
                    initialize_timeout_sec = 20,
                    port = "${port}",
                    args = {},
                    build_flags = "",
                    detached = vim.fn.has("win32") == 0,
                    output_mode = "remote",
                },
                -- 运行最近测试的选项
                tests = {
                    verbose = false,
                },
                ]]
            })
        end
    }
}
