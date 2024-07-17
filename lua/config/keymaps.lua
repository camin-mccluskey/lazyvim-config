-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local lazyterm = function()
  Util.terminal(nil)
end

vim.keymap.set("n", ";", ":", { desc = "Enter command mode" })
vim.keymap.set("n", "<leader>z", "<leader>bd", { desc = "Delete current buffer", remap = true })
vim.keymap.set("n", "<Tab>", "]b", { desc = "Next buffer", remap = true })
vim.keymap.set("n", "<S-Tab>", "[b", { desc = "Previous buffer", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "Comment selected", remap = true })
vim.keymap.set("n", "<leader>/", "gcc", { desc = "Comment Line", remap = true })
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
vim.keymap.set({ "n", "t" }, "<A-i>", lazyterm, { desc = "Toggle Terminal" })
vim.keymap.set("n", "<leader>f", "<leader>cd", { desc = "Line Diagnostics", remap = true })

-- move selection in visual mode
vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv", { desc = "Move selection down" })

-- Remap b/c iterm on mac won't let me use the alt key
vim.keymap.set("i", "<A-3>", "#", { desc = "Insert hash symbol", remap = true })

-- insert today's date in the format YYYY-MM-DD
vim.keymap.set("i", "<M-d>", "<C-r>=strftime('%Y-%m-%d')<CR>", { desc = "Insert today's date", remap = true })

-- Obsidian Plugin Keymaps
vim.keymap.set(
  "n",
  "<leader>od",
  "<cmd>ObsidianToday<CR>",
  { desc = "[O]bsidian - open (or create) today's [D]aily note" }
)
vim.keymap.set(
  "n",
  "<leader>om",
  "<cmd>ObsidianToday 1<CR>",
  { desc = "[O]bsidian - open (or create) to[M]orrow's [D]aily note", noremap = true }
)
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "[O]bsidian - Create new [N]ote" })
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "[O]bsidian - Insert [T]emplate" })
vim.keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "[O]bsidian - [Q]uick switch" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "[O]bsidian - [B]ack links" })
