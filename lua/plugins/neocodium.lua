return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup()
    vim.keymap.set("i", "<C-a>", neocodeium.accept)
  end,
}
-- return {
--   "Exafunction/windsurf.nvim",
--   config = function(opts)
--     require("codeium").setup(opts)
--   end,
--   -- config = function()
--   --   vim.g.codeium_no_map_tab = true
--   --   require("codeium").setup(opts)
--   -- end,
-- }
