---@module 'noice'
return {
  'folke/noice.nvim',
  event = 'VimEnter',
  dependencies = {
    'MunifTanjim/nui.nvim',
    {
      'rcarriga/nvim-notify',
      opts = {
        fps = 60,
        timeout = 3000,
        render = 'wrapped-compact',
        stages = 'static',
      },
    },
  },
  opts = {
    routes = {
      {
        filter = {
          event = 'msg_show',
          any = {
            { find = '%d+L, %d+B' },
            { find = '; after #%d+' },
            { find = '; before #%d+' },
          },
        },
        view = 'mini',
      },
    },
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
      override = {
        -- override the default lsp markdown formatter with Noice
        ['vim.lsp.util.convert_input_to_markdown_lines'] = false,
        -- override the lsp markdown formatter with Noice
        ['vim.lsp.util.stylize_markdown'] = false,
        -- override cmp documentation with Noice (needs the other options to work)
        ['cmp.entry.get_documentation'] = false,
      },
    },
    presets = {
      -- you can enable a preset by setting it to true, or a table that will override the preset config
      -- you can also add custom presets that you can enable/disable with enabled=true
      bottom_search = false, -- use a classic bottom cmdline for search
      command_palette = false, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
      cmdline_output_to_split = true,
    },
    ---@type NoiceConfigViews
    views = {},
    ---@type table<string, NoiceCommand>
    commands = {},
  },
  -- stylua: ignore
  keys = {
    {
      '<s-enter>',
      function()
        require('noice').redirect(vim.fn.getcmdline())
      end,
      mode = 'c',
      desc = 'Redirect Cmdline',
    },
    {'<leader>snn', function() require('noice').cmd('pick') end, desc='Noice Picker'},
    {'<leader>snl', function() require('noice').cmd('last') end, desc='Noice Last'},
    {'<leader>snh', function() require('noice').cmd('history') end, desc='Noice History'},
    {'<leader>sna', function() require('noice').cmd('all') end, desc='Noice All'},
  },
}
