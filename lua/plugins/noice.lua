return {
  "folke/noice.nvim",
  opts = {
    lsp = {
      hover = {
        silent = true,
      },
    },
    routes = {
      {
        -- REMOVE THIS once this issue is fixed: https://github.com/yioneko/vtsls/issues/159
        filter = {
          event = "notify",
          find = "Request textDocument/inlayHint failed",
        },
        opts = { skip = true },
      },
      {
        -- REMOVE THIS once this issue is fixed: https://github.com/yioneko/vtsls/issues/159
        filter = {
          event = "notify",
          find = "Request textDocument/documentHighlight failed",
        },
        opts = { skip = true },
      },
    },
  },
}
