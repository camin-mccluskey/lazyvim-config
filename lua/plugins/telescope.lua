local actions = require("telescope.actions")

return {
  "nvim-telescope/telescope.nvim",
  mappings = {
    ["C-S-q"] = actions.send_selected_to_qflist + actions.open_qflist,
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
    },
  },
}
