return {
    -- Required fields
    name = "python uv runner",
    condition = {
        filetype = {"python"},
    },
    builder = function(params)
        -- This must return an overseer.TaskDefinition
        return {
            -- cmd is the only required field
            cmd = {"uv", "run"},
            -- additional arguments for the cmd
            --args = vim.list.extend({ vim.fn.expand("%:p") }),
            args = { vim.fn.expand("%:p") },
            -- the name of the task (defaults to the cmd of the task)
            name = vim.fn.expand("%:t"),
            -- set the working directory for the task
            cwd = vim.fn.expand("%:p:h"),
            -- the list of components or component aliases to add to the task
            components = {
                {"on_output_quickfix", open = true, set_diagnostics = true},
                "on_exit_set_status",
                {"display_duration", detail_level = 2}
            },
        }
    end,
    -- Optional fields
    desc = "使用uv运行当前python脚本",
    params = {
        -- See :help overseer-params
    },
}
