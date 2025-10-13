-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'help',
  callback = function()
    vim.w.winnr = vim.api.nvim_win_get_number(0)
    vim.cmd('wincmd L')
  end,
})

do -- sync cwd with shell (OSC 7)
  vim.api.nvim_create_autocmd('DirChanged', {
    pattern = { 'global', 'tabpage' },
    callback = function()
      local ev = vim.v.event
      local uv = vim.uv

      local function write_to_stdout(data)
        -- in luv, "stream" can be a handle; here use stdout as stream
        -- uv.stdout is a predefined stream in luv; but in Neovim, you may use uv.new_tty
        local stdout, err = uv.new_tty(1, true)
        if err then
          vim.notify('uv new_tty error: ' .. tostring(err))
          return
        end
        uv.write(stdout, data, function(err)
          if err then
            -- handle error
            vim.schedule(function()
              vim.notify('uv write error: ' .. tostring(err))
            end)
          end
        end)
      end

      local function cwd_relative_to_root(cwd)
        if not cwd or cwd == '' then
          return nil, ''
        end

        local ok, root = pcall(function()
          return LazyVim and LazyVim.root and LazyVim.root()
        end)

        if not ok or not root or root == '' then
          return nil, cwd
        end

        local normalized_cwd = vim.fs.normalize(cwd)
        local normalized_root = vim.fs.normalize(root)

        if normalized_cwd == normalized_root then
          return normalized_root, '.'
        end

        local relative = vim.fs.relpath(normalized_cwd, normalized_root)
        if relative and relative ~= '' then
          return normalized_root, relative
        end

        if vim.startswith(normalized_cwd, normalized_root .. '/') then
          local trimmed = normalized_cwd:sub(#normalized_root + 2)
          return normalized_root, trimmed ~= '' and trimmed or '.'
        end

        return normalized_root, normalized_cwd
      end

      -- Update terminal's cwd (OSC 7)
      local function set_osc7_cwd(cwd)
        cwd = cwd or vim.fn.getcwd()
        local host = vim.fn.hostname()
        local url = string.format('\x1b]7;file://%s%s\x07', host, vim.fn.fnameescape(cwd))
        write_to_stdout(url)
      end

      -- Update terminal title (OSC 0)
      local function set_osc0_title(cwd)
        cwd = cwd or vim.fn.getcwd()
        local root, relative = cwd_relative_to_root(cwd)
        local relative_display = (relative and relative ~= '') and relative or '.'

        local title
        if root and root ~= '' then
          local root_name = vim.fs.basename(root)
          title = string.format('v %s/%s', root_name ~= '' and root_name or root, relative_display)
        else
          title = string.format('v %s', relative_display)
        end

        write_to_stdout(string.format('\x1b]0;%s\x07', title))
      end

      set_osc7_cwd(ev.cwd)
      set_osc0_title(ev.cwd)
    end,
  })
end
