---@module 'noice'
return {
  'folke/noice.nvim',
  event = 'VimEnter',
  opts = {
    messages = {
      enabled = true,
    },
    lsp = {
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
    },
    cmdline = {
      enabled = true,
    },
    markdown = false,
    popupmenu = {
      enabled = false,
    },
    presets = {
      -- you can enable a preset by setting it to true, or a table that will override the preset config
      -- you can also add custom presets that you can enable/disable with enabled=true
      bottom_search = false, -- use a classic bottom cmdline for search
      command_palette = false, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = true, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
      cmdline_output_to_split = false,
    },
    ---@type NoiceRoute[]
    ---@type NoiceConfigViews
    views = {
      mini = {
        timeout = 5000,
        position = {
          row = -1,
        },
        win_options = {
          winblend = 10,
        },
      },
      split = {
        win_options = {
          previewwindow = true,
        },
      },
    },
    ---@type table<string, NoiceCommand>
    commands = {
      last = {
        view = 'popup',
        opts = { enter = true, format = 'details' },
        filter = {
          any = {
            { event = 'notify' },
            { error = true },
            { warning = true },
            { event = 'msg_show' },
            { event = 'lsp', kind = 'message' },
          },
        },
        filter_opts = { count = 1 },
      },
    },
  },
  -- stylua: ignore
  keys = {
    -- {
    --   '<s-enter>',
    --   function()
    --     require('noice').redirect(vim.fn.getcmdline())
    --   end,
    --   mode = 'c',
    --   desc = 'Redirect Cmdline',
    -- },
    {'<leader>n', function() Snacks.picker.noice() end, desc='Noice Picker'},
    {'<leader>snn', function() require('noice').cmd('pick') end, desc='Noice Picker'},
    {'<leader>snl', function() require('noice').cmd('last') end, desc='Noice Last'},
    {'<leader>snh', function() require('noice').cmd('history') end, desc='Noice History'},
    {'<leader>sna', function() require('noice').cmd('all') end, desc='Noice All'},
  },
}
