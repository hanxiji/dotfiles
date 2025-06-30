--[[
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'oil',
  callback = function()
    print("打开oil")
    local bufnr = vim.api.nvim_get_current_buf()
    local gitsigns = require('gitsigns')
    gitsigns.attach(bufnr)  -- 绑定 gitsigns 到当前 buffer
    gitsigns.refresh(bufnr) -- 强制刷新状态
  end
})
]]

local fcitx5_remote_exists = vim.fn.executable("fcitx5-remote") == 1
if fcitx5_remote_exists then
    -- print("fcitx5-remote 存在，可以使用。")
    -- 存储 Fcitx5 输入法状态
    local fcitx5state = vim.fn.system("fcitx5-remote"):gsub("\n", "")

    -- 定义离开插入模式时的自动命令
    vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function()
            fcitx5state = vim.fn.system("fcitx5-remote"):gsub("\n", "")
            vim.fn.system("fcitx5-remote -c")
        end
    })

    -- 定义进入插入模式时的自动命令
    vim.api.nvim_create_autocmd("InsertEnter", {
        callback = function()
            if fcitx5state == "2" then
                vim.fn.system("fcitx5-remote -o")
            end
        end
    })
end

