local util = require("lspconfig.util")

return {
  "neovim/nvim-lspconfig",
  version = "*",
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
  },
}
