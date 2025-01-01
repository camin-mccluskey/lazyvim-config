return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "rose-pine/neovim" },
  opts = {
    refresh = {
      statusline = 1500,
      tabline = 1500,
      winbar = 1500,
    },
    sections = {
      lualine_a = { "branch" },
      lualine_b = {},
      lualine_x = { "diff" },
      lualine_y = {
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      },
      lualine_z = {},
    },
    extensions = {},
    options = {
      theme = require("utils.rose-pine"),
    },
  },
}
