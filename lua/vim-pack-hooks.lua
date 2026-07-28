local M = {}

---@param name string
---@param func fun(): nil
M.build = function(name, func)
    vim.api.nvim_create_autocmd('PackChanged', {
        callback = function(ev)
            local kind = ev.data.kind
            if
                ev.data.spec.name == name
                and (kind == 'update' or kind == 'install')
            then
                func()
            end
        end,
    })
end

return M
