local util = require("lspconfig.util")

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {
        root_dir = util.root_pattern(
          "eslint.config.js",
          "eslint.config.cjs",
          "eslint.config.mjs",
          "eslint.config.ts",
          "eslint.config.cts",
          "eslint.config.mts",
          ".eslintrc",
          ".eslintrc.js",
          ".eslintrc.cjs",
          ".eslintrc.mjs"
        ),
      },
      biome = {
        root_dir = util.root_pattern("biome.json", "biome.jsonc"),
        single_file_support = false,
      },
    },
    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "vtsls" then
            client.server_capabilities.documentFormattingProvider = false
          elseif client.name == "biome" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
      biome = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "biome" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "vtsls" then
            client.server_capabilities.documentFormattingProvider = false
          elseif client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
    -- settings = {
    --   tailwindcss = {
    --     experimental = {
    --       -- https://cva.style/docs/getting-started/installation
    --       classRegex = {
    --         { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
    --         { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
    --       },
    --     },
    --   },
    -- },
  },
}
