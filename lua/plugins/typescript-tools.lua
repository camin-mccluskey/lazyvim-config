return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  enabled = false,
  opts = {
    settings = {
      code_lens = "off",
      complete_function_calls = true,
      include_completions_with_insert_text = true,
      separate_diagnostic_server = true,
      publish_diagnostic_on = "insert_leave",
      tsserver_path = nil,
      tsserver_max_memory = 20000,
      tsserver_file_preferences = {
        completions = { completeFunctionCalls = true },
        init_options = { preferences = { disableSuggestions = true } },
        importModuleSpecifierPreference = "auto",
        jsxAttributeCompletionStyle = "braces",
      },
      tsserver_locale = "en",
      disable_member_code_lens = true,
    },
  },
}
