---@class BuildOpts
---@field ensure_active? boolean

local M = {}

---@param name string
---@param func fun(): nil
---@param opts? BuildOpts
M.build = function(name, func, opts)
    opts = opts or {}

    vim.api.nvim_create_autocmd('PackChanged', {
        callback = function(ev)
            if opts.ensure_active == nil then
                opts.ensure_active = true
            end

            local kind = ev.data.kind
            if
                ev.data.spec.name == name
                and (kind == 'update' or kind == 'install')
            then
                if opts.ensure_active and not ev.data.active then
                    vim.cmd.packadd(name)
                end
                func()
            end
        end,
    })
end

return M