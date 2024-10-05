-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.cc = "120"
vim.diagnostic.config({
  float = {
    source = true,
  },
})

-- disable autoformat for markdown files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- insist on prettier config file to format with prettier
vim.g.lazyvim_prettier_needs_config = true
