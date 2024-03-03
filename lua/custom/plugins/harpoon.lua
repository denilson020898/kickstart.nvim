return {
  "windwp/nvim-autopairs",
  -- Optional dependency
  dependencies = { 'ThePrimeagen/harpoon' },
  config = function()
    require("harpoon").setup({})
  end,
}
