return {
  'nvim-neotest/neotest',
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",

    'nvim-neotest/neotest-python',
    'nvim-neotest/neotest-plenary',
    'nvim-neotest/neotest-vim-test',

    'rouge8/neotest-rust',

    'lawrence-laz/neotest-zig',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        -- python
        require 'neotest-python' {
          dap = { justMyCode = false },
        },
        require 'neotest-plenary',
        require 'neotest-vim-test' {
          ignore_file_types = { 'python', 'vim', 'lua' },
        },

        -- rust
        require 'neotest-rust' {
          args = { '--no-capture' },
          dap_adapter = 'rt_lldb',
        },

        require("neotest-zig"), -- Registration
      },
    }
  end,
}
