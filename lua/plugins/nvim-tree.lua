return {
  "nvim-tree/nvim-tree.lua",
  enabled = false,
  cmd = "NvimTreeOpen",
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
  },
  opts = {
    sort = {
      sorter = "case_sensitive",
    },
  },
}
