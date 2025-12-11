return {
  'zbirenbaum/copilot.lua',
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      hide_during_completion = false,
    },
  },
  keys = {
    {
      '<m-l>',
      function()
        return require('copilot.suggestion').accept()
      end,
      mode = 'i',
    },
  },
  cmd = 'Copilot',
  event = { 'InsertEnter' },
}
