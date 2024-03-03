-- return {
--   "windwp/nvim-autopairs",
--   -- Optional dependency
--   dependencies = { 'ThePrimeagen/harpoon' },
--   config = function()
--     require("harpoon").setup({})
--   end,
-- }

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
}
