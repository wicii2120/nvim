if _G.MY == nil then
    _G.MY = {}
end

local function copy_location(start_pos, end_pos, selection_type)
    -- Positions are { line, 0-based byte column }.
    if
        start_pos[1] > end_pos[1]
        or (start_pos[1] == end_pos[1] and start_pos[2] > end_pos[2])
    then
        start_pos, end_pos = end_pos, start_pos
    end

    local path = vim.api.nvim_buf_get_name(0)
    if path == '' then
        path = '[No Name]'
    end

    local location

    if selection_type == 'line' then
        location = ('%s:%d-%d'):format(path, start_pos[1], end_pos[1])
    else
        location = ('%s:%d:%d-%d:%d'):format(
            path,
            start_pos[1],
            start_pos[2] + 1,
            end_pos[1],
            end_pos[2] + 1
        )
    end

    vim.fn.setreg('+', location)
    vim.notify('Copied: ' .. location)
end

_G.MY.copy_location_operator = function(type)
    copy_location(
        vim.api.nvim_buf_get_mark(0, '['),
        vim.api.nvim_buf_get_mark(0, ']'),
        type
    )
end

vim.keymap.set('n', '<leader>y', function()
    vim.go.operatorfunc = 'v:lua.MY.copy_location_operator'
    return 'g@'
end, {
    expr = true,
    desc = 'Copy source range',
})

vim.keymap.set('n', '<leader>yy', function()
    vim.go.operatorfunc = 'v:lua.MY.copy_location_operator'
    return 'g@_'
end, {
    expr = true,
    desc = 'Copy source range',
})

vim.keymap.set('x', '<leader>y', function()
    local mode = vim.fn.mode()

    -- getpos() columns are 1-based, unlike nvim_buf_get_mark().
    local visual_start = vim.fn.getpos('v')
    local cursor = vim.fn.getpos('.')

    local start_pos = { visual_start[2], visual_start[3] - 1 }
    local end_pos = { cursor[2], cursor[3] - 1 }

    local selection_type = mode == 'V' and 'line'
        or mode == '\22' and 'block'
        or 'char'

    copy_location(start_pos, end_pos, selection_type)

    return '<esc>'
end, {
    expr = true,
    desc = 'Copy selected source range',
})
