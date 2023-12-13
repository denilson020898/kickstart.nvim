return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    -- "nvim-neotest/neotest-python",
    -- "nvim-neotest/neotest-plenary",
    -- "nvim-neotest/neotest-vim-test",
    "rouge8/neotest-rust",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-rust") {
          args = { "--no-capture" },
          dap_adapter = "rt_lldb",
        }
      }
    })
  end,
}
