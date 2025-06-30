-- 默认leader键为\，可设置leader键为其他，在lazy.lua已设置这里注释掉
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- nvim_set_keymap适用于所有nvim版本，只支持单模式，只支持字符串参数，lua命令需转义
-- vim.keymap.set适用于nvim 0.7+版本，支持多模式，支持lua函数
-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set -- 格式：vim.keymap.set({mode}, {lhs}, {rhs}, {opts})
-- 合并两个或多个table，默认参数force（如原来key有值则覆盖原有参数）
local tbl = function(...)
    return vim.tbl_extend("force",...)
end

-- 复用 opts 参数
local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

map("v", "<", "<gv", tbl(opts,{ desc = "visual模式下 < 缩进代码且不取消选中" }))
map("v", ">", ">gv", tbl(opts,{ desc = "visual模式下 > 缩进代码且不取消选中" }))

map("n", "<S-Up>", ":resize -1<CR>", { noremap = true,silent = true,desc = "当前窗口高度减少一行" })
map("n", "<S-Down>", ":resize +1<CR>", { noremap = true,silent = true,desc = "当前窗口高度增加一行" })
map("n", "<S-Left>", ":vertical resize -1<CR>", { noremap = true,silent = true,desc = "当前窗口宽度减少一列" })
map("n", "<S-Right>", ":vertical resize +1<CR>", { noremap = true,silent = true,desc = "当前窗口宽度增加一列" })
map("n", "<C-Up>", "<C-w>+", { noremap = true,silent = true,desc = "当前窗口高度增加一行" })
map("n", "<C-Down>", "<C-w>-", { noremap = true,silent = true,desc = "当前窗口高度减少一行" })
map("n", "<C-Left>", "<C-w><", { noremap = true,silent = true,desc = "当前窗口宽度减少增加一列" })
map("n", "<C-Right>", "<C-w>>", { noremap = true,silent = true,desc = "当前窗口宽度增加一列" })

map("n", "<leader>wc", "<C-w>c", { noremap = true,silent = true,desc = "关闭当前窗口快捷键简化ctrl+w+c" })
map("n", "<leader>wk", "<C-w>k", { noremap = true,silent = true,desc = "窗口切换快捷键简化ctrl+w+k" })
map("n", "<leader>wj", "<C-w>j", { noremap = true,silent = true,desc = "窗口切换快捷键简化ctrl+w+j" })
map("n", "<leader>wh", "<C-w>h", { noremap = true,silent = true,desc = "窗口切换快捷键简化ctrl+w+h" })
map("n", "<leader>wl", "<C-w>l", { noremap = true,silent = true,desc = "窗口切换快捷键简化ctrl+w+l" })

-- nvim-tree
map("n", "<leader>ee", ":NvimTreeToggle<CR>", { noremap = true,silent = true,desc = "打开nvim-tree" })
map("n", "<leader>ef", ":NvimTreeFocus<CR>", { noremap = true,silent = true,desc = "光标聚焦至nvim-tree" })
map("n", "<leader>es", ":NvimTreeFindFile<CR>", { noremap = true,silent = true,desc = "展开路径至当前Buffer文件,光标聚焦到对应文件节点" })
-- oil 文件浏览插件
map("n", "<leader>eo", ":Oil<CR>", { noremap = true,silent = true,desc = "打开Oil文件浏览插件" })

-- bufferline
map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { noremap = true,silent = true,desc = "Jump to Tab 1" })
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { noremap = true,silent = true,desc = "Jump to Tab 2" })
map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { noremap = true,silent = true,desc = "Jump to Tab 3" })
map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", { noremap = true,silent = true,desc = "Jump to Tab 4" })
map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", { noremap = true,silent = true,desc = "Jump to Tab 5" })
map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", { noremap = true,silent = true,desc = "Jump to Tab 6" })
map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", { noremap = true,silent = true,desc = "Jump to Tab 7" })
map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", { noremap = true,silent = true,desc = "Jump to Tab 8" })
map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", { noremap = true,silent = true,desc = "Jump to Tab 9" })
map("n", "<C-k>", ":BufferLineCyclePrev<CR>", tbl(opts,{ desc = "切换到前一个buffer" }))
map("n", "<C-j>", ":BufferLineCycleNext<CR>", tbl(opts,{ desc = "切换到后一个buffer" }))
map("n", "<C-h>", ":BufferLineMovePrev<CR>", tbl(opts,{ desc = "移动当前buffer到前面" }))
map("n", "<C-l>", ":BufferLineMoveNext<CR>", tbl(opts,{ desc = "移动当前buffer到后面" }))
map("n", "<leader>bp", "<cmd>BufferLinePick<CR>", tbl(opts,{ desc = "选择一个buffer" }))
map("n", "<leader>bP", "<cmd>BufferLinePickClose<CR>", tbl(opts,{ desc = "关闭选中的buffer" }))
map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", tbl(opts,{ desc = "关闭其他buffer" }))
map("n", "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", tbl(opts,{ desc = "关闭左侧buffer" }))
map("n", "<leader>br", "<cmd>BufferLineCloseRight<CR>", tbl(opts,{ desc = "关闭右侧buffer" }))

map("n", "<leader>bc", function()
    Snacks.bufdelete()
end, tbl(opts,{ desc = "关闭当前buffer（bdelete，:ls!仍能够看到，保留窗口布局，如未保存会提示）" }))
map('n', "<leader>bd", function()
    Snacks.bufdelete({ wipe = true })
end, tbl(opts,{ desc = "完全关闭当前buffer（bwipeout，:ls!无法看到，保留窗口布局，如未保存会提示）" }))
map('n', "<leader>bO", function()
    Snacks.bufdelete.other({ wipe = true })
end, tbl(opts,{ desc = "完全关闭其他buffer（bwipeout）" }))
--[[map("n", "<leader>bP", function()
    local success, result = pcall(vim.cmd, "BufferLinePick")
    if success then
        --print("BufferLinePick执行成功：" .. result)
        require("mini.bufremove").delete()
    else
        print("BufferLinePick执行失败：" .. result)
    end
end, tbl(opts,{ desc = "关闭选中的buffer" }))]]

-- which-key
map("n","<leader>?",function() require("which-key").show({ global = false }) end,{ noremap = true,silent = true,desc = "Buffer Local Keymaps (which-key)" })

-- 搜索
--map("n", "<S-S>", ":FzfLua files<CR>", { noremap = true,silent = true,desc = "搜索文件" })
map("n", "<leader>ff", ":FzfLua files<CR>", { noremap = true,silent = true,desc = "搜索文件" })
map("n", "<leader>fgg", ":FzfLua grep<CR>", { noremap = true,silent = true,desc = "grep搜索" })
map("n", "<leader>fgb", ":FzfLua grep_curbuf<CR>", { noremap = true,silent = true,desc = "grep搜索当前buffer" })
map("n", "<leader>fgp", ":FzfLua grep_project<CR>", { noremap = true,silent = true,desc = "grep搜索当前project" })
map("n", "<leader>fb", ":FzfLua buffers<CR>", { noremap = true,silent = true,desc = "搜索buffer" })
map("n", "<leader>fl", ":FzfLua blines<CR>", { noremap = true,silent = true,desc = "搜索当前buffer lines" })
map("n", "<leader>fL", ":FzfLua lines<CR>", { noremap = true,silent = true,desc = "搜索所有打开buffer lines" })
map("n", "<leader>fC", ":FzfLua commands<CR>", { noremap = true,silent = true,desc = "搜索command" })
map("n", "<leader>fc", ":FzfLua command_history<CR>", { noremap = true,silent = true,desc = "搜索command_history" })
map("n", "<leader>fnh", ":FzfLua helptags<CR>", { noremap = true,silent = true,desc = "搜索nvim helptags" })
map("n", "<leader>fnk", ":FzfLua keymaps<CR>", { noremap = true,silent = true,desc = "搜索nvim keymaps" })
map("n", "<leader>fno", ":FzfLua nvim_options<CR>", { noremap = true,silent = true,desc = "搜索nvim options" })
map("n", "<leader>fnc", ":FzfLua colorschemes<CR>", { noremap = true,silent = true,desc = "搜索colorschemes" })
map("n", "<leader>fr", ":GrugFar<CR>", tbl(opts, { desc = "查找文件内容替换(grug-far插件)" }))

map("n", "<leader>ps", ":FzfLua lsp_document_symbols<CR>", tbl(opts, { desc = "lsp搜索当前buffer lsp_document_symbols" }))
map("n", "<leader>pS", ":FzfLua lsp_workspace_symbols<CR>", tbl(opts, { desc = "lsp搜索当前workspace lsp_workspace_symbols" }))
--map("n", "<leader>fS", ":FzfLua lsp_live_workspace_symbols<CR>", { noremap = true,silent = true,desc = "搜索lsp_live_workspace_symbols" })
--
--map("n", "<leader>fd", ":FzfLua lsp_document_diagnostics<CR>", tbl(opts, { silent = false,desc = "lsp搜索当前buffer lsp_document_diagnostics" }))
--map("n", "<leader>fD", ":FzfLua lsp_workspace_diagnostics<CR>", tbl(opts, { silent = false,desc = "lsp搜索当前workspace lsp_workspace_diagnostics" }))
map("n", "<leader>pd", ":FzfLua diagnostics_document<CR>", tbl(opts, { silent = false,desc = "搜索当前buffer document_diagnostics" }))
map("n", "<leader>pD", ":FzfLua diagnostics_workspace<CR>", tbl(opts, { silent = false,desc = "搜索当前workspace document_diagnostics" }))

map("n", "gd", ":FzfLua lsp_definitions<CR>", tbl(opts, { desc = "lsp搜索当前符号 lsp_definitions" }))
map("n", "gy", ":FzfLua lsp_typedefs<CR>", tbl(opts, { desc = "lsp搜索当前符号 lsp_type_definitions" }))
map("n", "gD", ":FzfLua lsp_declarations<CR>", tbl(opts, { desc = "lsp搜索当前符号 lsp_declarations" }))
map("n", "<leader>pc", ":FzfLua lsp_incoming_calls<CR>", tbl(opts, { desc = "lsp搜索 lsp_incoming_calls" }))
map("n", "<leader>pC", ":FzfLua lsp_outgoing_calls<CR>", tbl(opts, { desc = "lsp搜索 lsp_outgoing_calls" }))
map("n", "<leader>pr", ":FzfLua lsp_references<CR>", tbl(opts, { desc = "lsp搜索 lsp_references" }))
map("n", "<leader>pi", ":FzfLua lsp_implementations<CR>", tbl(opts, { desc = "lsp搜索 lsp_implementations" }))
map("n", "<leader>pa", ":FzfLua lsp_code_actions<CR>", tbl(opts, { desc = "lsp搜索 lsp_code_actions" }))
map("n", "<leader>pf", ":FzfLua lsp_finder<CR>", tbl(opts, { desc = "lsp整合搜索当前符号ref,def,impl等信息" }))

-- formatter，使用conform.nvim自定义了一个Format方法
map("n", "<leader>cf", ":Format<CR>", tbl(opts, { desc = "格式化整个文件" }))
map("v", "<leader>cf", ":'<,'>Format<CR>", tbl(opts, { desc = "格式化选中片段" }))
--vim.keymap.set({ "n", "v" }, "<leader>f", function()
--  require("conform").format({ async = true })
--end, { desc = "Format current buffer" })


--[[
-- lsp
-- vim.lsp.buf有默认键位,详情见:help lsp
--map("i", "<C-j>", vim.lsp.buf.signature_help, { noremap = true,silent = true,desc = "函数参数以及签名提示" })

local lspsaga_res = vim.inspect(package.loaded["lspsaga"])
--print(lspsaga_res)

if lspsaga_res ~= nil and lspsaga_res ~= 'nil' then
    --print("lspsaga加载成功")

else
    --print("lspsaga未加载")
end
]]

local pluginsKeys = {}

pluginsKeys.mapLsp = function(bufnr)
    if(bufnr == nil) then
        bufnr = true
    end
    -- 设置缓冲区特定映射,bufnr为缓冲区编号,当为true时自动将映射应用到当前缓冲区。
    -- print("buffer:",bufnr)
    -- 代码动作面板
    map("n", "<C-CR>", "<cmd>Lspsaga code_action<CR>", tbl(opts,{ buffer = bufnr,desc = "打开code action" }))
    map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", tbl(opts,{ buffer = bufnr,desc = "打开code action" }))

    -- 定义跳转预览，这个在使用中有lsp未响应一直等待问题，先使用snacks或者fzf-lua插件替代
    -- map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", tbl(opts,{ buffer = bufnr,desc = "Preview definition" }))
    -- map("n", "gdd", "<cmd>Lspsaga goto_definition<CR>", tbl(opts,{ buffer = bufnr,desc = "goto definition" }))
    -- map("n", "gy", "<cmd>Lspsaga peek_type_definition<CR>", tbl(opts,{ buffer = bufnr,desc = "Preview type definition" }))
    -- map("n", "gyy", "<cmd>Lspsaga goto_type_definition<CR>", tbl(opts,{ buffer = bufnr,desc = "goto type definition" }))

    -- 悬浮文档（带语法高亮）
    map("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", tbl(opts,{ buffer = bufnr,desc = "Enhanced hover" }))

    -- 诊断导航与展示
    map("n", "gp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", tbl(opts,{ buffer = bufnr,desc = "Prev diagnostic" }))
    map("n", "gn", "<cmd>Lspsaga diagnostic_jump_next<CR>", tbl(opts,{ buffer = bufnr,desc = "Next diagnostic" }))
    map("n", "<leader>ll", "<cmd>Lspsaga show_cursor_diagnostics<CR>", tbl(opts,{ buffer = bufnr,silent = true,desc = "展示光标所在位置diagnostics" }))
    map("n", "<leader>lL", "<cmd>Lspsaga show_line_diagnostics<CR>", tbl(opts,{ buffer = bufnr,desc = "展示当前行diagnostics" }))
    map("n", "<leader>ld", "<cmd>Lspsaga show_buf_diagnostics<CR>", tbl(opts,{ buffer = bufnr,desc = "展示当前Buffer diagnostics" }))
    map("n", "<leader>lD", "<cmd>Lspsaga show_workspace_diagnostics<CR>", tbl(opts,{ buffer = bufnr,desc = "展示当前workspace diagnostics" }))

    -- 符号重命名
    map("n", "<leader>ln", "<cmd>Lspsaga rename<CR>", tbl(opts,{ buffer = bufnr,desc = "修改当前buffer变量、方法等符号的名称(Rename symbol)" }))
    map("n", "<leader>lN", "<cmd>Lspsaga rename ++project<CR>", tbl(opts,{ buffer = bufnr,desc = "修改变量、方法等符号的名称,如果名称还在项目某个位置则弹窗继续修改" }))
    --mapbuf("n", "<leader>rn", ":IncRename ", { noremap = true,silent = true,desc = "inc-rename插件,修改文件名" })
    --mapbuf("n", "<leader>rn", function()
    --    return ":IncRename " .. vim.fn.expand("<cword>")
    --end, { expr = true,noremap = true,silent = true,desc = "inc-rename插件,修改文件名" })

    -- 查找references,implementation
    map("n", "<leader>lf", "<cmd>Lspsaga finder<CR>", tbl(opts,{ buffer = bufnr,desc = "查找并弹窗展示references,implementation" }))

    map("n", "<leader>lt", "<cmd>Lspsaga term_toggle<CR>", tbl(opts,{ buffer = bufnr,desc = "弹出一个float terminal" }))

    map("n", "<leader>ls", "<cmd>Lspsaga outline<CR>", tbl(opts,{ buffer = bufnr,desc = "显示当前buffer出现的类、方法等符号(document symbols,o:跳转)" }))

    map("n", "<leader>lc", "<cmd>Lspsaga incoming_calls<CR>", tbl(opts,{ buffer = bufnr,desc = "显示该方法被其他方法调用的列表(e:打开文件)" }))

    map("n", "<leader>lC", "<cmd>Lspsaga outgoing_calls<CR>", tbl(opts,{ buffer = bufnr,desc = "显示该方法调用其他方法的列表(e:打开文件)" }))
end

pluginsKeys.cmp = function(cmp)
    return {
        ['<C-n>'] = cmp.mapping.select_next_item(),  -- 下一补全项
        ['<C-p>'] = cmp.mapping.select_prev_item(),  -- 上一补全项
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),    -- 文档窗口上滚4
        ['<C-f>'] = cmp.mapping.scroll_docs(4), -- 文档窗口下滚4
        ['<C-CR>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }
end

pluginsKeys.mapBlinkCmp = function()
    return {
        ['<C-CR>'] = { 'show', 'show_documentation', 'hide_documentation' },
        --['<CR>'] = { 'select_and_accept' },
    }
end

pluginsKeys.mapDap = function()
    map('n', '<F5>', function() require('dap').continue() end, tbl(opts, { desc = '启动调试或继续执行' }))
    map('n', '<F10>', function() require('dap').step_over() end, tbl(opts, { desc = '单步跳过当前行' }))
    map('n', '<F11>', function() require('dap').step_into() end, tbl(opts, { desc = '单步进入当前表达式' }))
    map('n', '<F12>', function() require('dap').step_out() end, tbl(opts, { desc = '单步跳出当前作用域' }))
    map('n', '<leader>db', function() require('dap').toggle_breakpoint() end, tbl(opts, { desc = '在当前行设置或取消断点' }))
    map('n', '<Leader>dB', function() require('dap').set_breakpoint() end, tbl(opts,{ desc = '在当前行设置断点' }))
    map('n', '<leader>dc', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, tbl(opts, { desc = '设置带条件的断点' }))
    map('n', '<leader>dl', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, tbl(opts, { desc = '在当前行设置日志点' }))
    map('n', '<leader>drr', function() require('dap').repl.open() end, tbl(opts, { desc = '打开REPL / 调试控制台' }))
    map('n', '<leader>drl', function() require('dap').run_last() end, tbl(opts, { desc = '重新运行上一次的调试配置' }))

    map({'n', 'v'}, '<Leader>dh', function() require('dap.ui.widgets').hover() end, tbl(opts,{ desc = '在悬浮窗口中查看光标下表达式的值' }))
    map({'n', 'v'}, '<Leader>dp', function() require('dap.ui.widgets').preview() end, tbl(opts,{ desc = '预览光标下表达式的值' }))
    map('n', '<Leader>df', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.frames)
    end, tbl(opts,{ desc = '在居中悬浮窗口中查看当前帧' }))
    map('n', '<Leader>ds', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes)
    end, tbl(opts,{ desc = '在居中悬浮窗口中查看当前作用域' }))

end

pluginsKeys.mapTerm = function()
    -- 切换普通终端
    map("n", "<leader>tt", "<cmd>ToggleTerm<cr>", tbl(opts, { desc = "切换终端" }))
    -- 切换水平分割终端
    map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", tbl(opts, { desc = "切换水平分割终端" }))
    -- 切换垂直分割终端
    map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", tbl(opts, { desc = "切换垂直分割终端" }))
    -- 切换浮动终端
    map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", tbl(opts, { desc = "切换浮动终端" }))
    -- 切换所有终端
    map("n", "<leader>ta", "<cmd>ToggleTermToggleAll<cr>", tbl(opts, { desc = "切换所有终端" }))
    -- 选择一个已打开终端
    map("n", "<leader>ts", "<cmd>TermSelect<cr>", tbl(opts, { desc = "选择一个已打开终端" }))

    -- 创建自定义 lazygit 终端
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",  -- 浮动窗口布局
        hidden = true
    })

    -- 定义切换 lazygit 终端的函数
    function _lazygit_toggle()
        lazygit:toggle()
    end

    -- 设置切换 lazygit 终端的快捷键
    map("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<cr>", tbl(opts, { desc = "切换 lazygit 终端" }))
end

pluginsKeys.mapMiniBufremove = function()
    -- 普通删除（保留窗口布局）
    map("n", "<leader>bc", function()
        require("mini.bufremove").delete() -- 删除当前缓冲区
    end, tbl(opts,{ desc = "删除当前缓冲区（:ls!仍能够看到，保留窗口布局，如未保存会提示）" }))

    -- 彻底删除（保留窗口布局）
    map('n', "<leader>bd", function()
        require("mini.bufremove").wipeout() -- 彻底删除当前缓冲区
    end, tbl(opts,{ desc = "彻底删除当前缓冲区（:ls!无法看到，保留窗口布局，如未保存会提示）" }))

    -- 不显示缓冲区
    map("n", "<leader>bu", function()
        require("mini.bufremove").unshow()
    end, tbl(opts,{ desc = "不显示缓冲区" }))
end

pluginsKeys.mapOverseer = function()
    map("n", "<leader>or", "<cmd>OverseerRun<cr>", tbl(opts,{ desc = "List overseer run templates" }))
    map("n", "<leader>ot", "<cmd>OverseerToggle<cr>", tbl(opts,{ desc = "Toggle overseer task list" }))
    map("n", "<leader>oT", "<cmd>OverseerClose<cr>", tbl(opts,{ desc = "Close overseer task list" }))
end

pluginsKeys.mapSnacks = function()
    map("n", "<leader>sn", function() Snacks.notifier.show_history() end, tbl(opts,{ desc = "显示notifier历史(q:退出)" }))
    map("n", "<leader>sN", function() Snacks.picker.notifications() end, tbl(opts,{ desc = "显示并搜索notifier历史(esc:退出)" }))
    map("n", "<leader>sg", function() Snacks.lazygit() end, tbl(opts,{ desc = "显示一个lazygit float窗口" }))
    map("n", "<leader>sh", function() Snacks.picker.help() end, tbl(opts,{ desc = "搜索nvim help文档" }))
    map("n", "<leader>sk", function() Snacks.picker.keymaps() end, tbl(opts,{ desc = "搜索nvim keymaps" }))
    map("n", "<leader>spc", function() Snacks.picker.colorschemes() end, tbl(opts,{ desc = "搜索nvim colorschemes" }))
    map("n", "<leader>sC", function() Snacks.picker.command() end, tbl(opts,{ desc = "搜索nvim command" }))
    map("n", "<leader>sc", function() Snacks.picker.command_history() end, tbl(opts,{ desc = "搜索nvim command_history" }))

    -- lsp
    map("n", "<leader>ss", function()
        Snacks.picker.lsp_symbols({
            filter={
                default = {
                    "Class",
                    "Constructor",
                    "Enum",
                    "Field",
                    "Function",
                    "Interface",
                    "Method",
                    "Module",
                    "Namespace",
                    "Package",
                    "Property",
                    "Struct",
                    "Trait",
                    "Variable",
                    "Object",
                }
            },
            markdown = true,
            help = true,
        })
    end, tbl(opts,{ desc = "显示当前buffer lsp_symbols(esc:退出)" }))

    map("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, tbl(opts,{ desc = "显示当前workspace lsp_symbols(esc:退出)" }))

    map("n", "<leader>sd", function() Snacks.picker.diagnostics_buffer() end, tbl(opts,{ silent = false, desc = "显示当前buffer diagnostics(esc:退出)" }))
    map("n", "<leader>sD", function() Snacks.picker.diagnostics() end, tbl(opts,{ silent = false, desc = "显示当前workspace diagnostics(esc:退出)" }))

    map("n", "<leader>sr", function() Snacks.picker.lsp_references({auto_confirm = false,}) end, tbl(opts,{ silent = false, desc = "显示并跳转 lsp_references(esc:退出)" }))
    map("n", "<leader>si", function() Snacks.picker.lsp_implementations({auto_confirm = false,}) end, tbl(opts,{ silent = false, desc = "显示并跳转 lsp_implementations(esc:退出)" }))

    map("n", "<leader>spd", function() Snacks.picker.lsp_definitions({auto_confirm = false,}) end, tbl(opts,{ desc = "显示并跳转lsp_definitions(esc:退出)" }))
    map("n", "<leader>spy", function() Snacks.picker.lsp_type_definitions({auto_confirm = false,}) end, tbl(opts,{ desc = "显示并跳转lsp_type_definitions(esc:退出)" }))
    map("n", "<leader>spD", function() Snacks.picker.lsp_declarations({auto_confirm = false,}) end, tbl(opts,{ desc = "显示并跳转lsp_declarations(esc:退出)" }))

end

return pluginsKeys
