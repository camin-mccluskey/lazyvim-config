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
