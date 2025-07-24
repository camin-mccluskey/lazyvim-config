local client = vim.lsp.start({
  name = "educationallsp",
  cmd = {
    "/Users/caminmccluskey/projects/educationallsp/bin/educationallsp",
  },
})

if not client then
  vim.notify("No test lsp create")
  return
end

return client
