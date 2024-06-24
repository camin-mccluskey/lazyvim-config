-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Set commentstring for Prisma schema files
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("PrismaCommentString", { clear = true }),
  callback = function(ev)
    vim.bo[ev.buf].commentstring = "// %s"
  end,
  pattern = { "prisma" },
})

-- Disabled folding for particular buffer types
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "neo-tree" },
  callback = function()
    require("ufo").detach()
    vim.opt_local.foldenable = false
  end,
})

-- Example lsp attach on autocmd
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   callback = function()
--     local educational_lsp = require("config.load-test-lsp")
--     vim.lsp.buf_attach_client(0, educational_lsp)
--   end,
-- })
