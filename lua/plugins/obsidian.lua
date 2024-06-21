return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  event = {
    -- only run this plugin for markdown files in my Obsidian vault
    "BufReadPre "
      .. vim.fn.expand("~")
      .. "/Obsidian-camin-vault/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/Obsidian-camin-vault/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Obsidian-camin-vault",
        path = "~/Obsidian-camin-vault",
      },
    },
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "02 Journal/Daily",
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = "05 Daily Journal",
    },
    templates = {
      folder = "06 Utilities/Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
    use_advanced_uri = true,
    attachments = {
      -- The default folder to place images in via `:ObsidianPasteImg`.
      -- If this is a relative path it will be interpreted as relative to the vault root.
      -- You can always override this per image by passing a full path to the command instead of just a filename.
      img_folder = "06 Utilities/Attachments",
      -- A function that determines the text to insert in the note when pasting an image.
      -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
      -- This is the default implementation.
      ---@param client obsidian.Client
      ---@param path obsidian.Path the absolute path to the image file
      ---@return string
      img_text_func = function(client, path)
        path = client:vault_relative_path(path) or path
        return string.format("![%s](%s)", path.name, path)
      end,
    },
  },
}
