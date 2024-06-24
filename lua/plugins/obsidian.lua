return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  -- event = {
  --   -- only run this plugin inside my Obsidian vault
  --   "VimEnter "
  --     .. vim.fn.expand("~")
  --     .. "/Obsidian-camin-vault/*",
  --   -- "BufNewFile " .. vim.fn.expand("~") .. "/Obsidian-camin-vault/**.md",
  -- },
  -- keys = { { "<leader>os", desc = "[O]bsidian - [S]tart Obsidian Plugin" } },
  enabled = function()
    return vim.fn.getcwd() == vim.fn.expand("~") .. "/Obsidian-camin-vault"
  end,
  event = "VimEnter",
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
    new_notes_location = "notes_subdir",
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "02 Journals/Daily",
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
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
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
      -- @param client obsidian.Client
      -- @param path obsidian.Path the absolute path to the image file
      -- @return string
      img_text_func = function(client, path)
        path = client:vault_relative_path(path) or path
        return string.format("![%s](%s)", path.name, path)
      end,
    },
    wiki_link_func = "use_alias_only",
    disable_frontmatter = true, -- I thibk it's true that we don't want the plugin to "manage" frontmatter - we'd still like to edit it
    -- Optional, customize how note file names are generated given the ID, target directory, and title.
    -- @param spec { id: string, dir: obsidian.Path, title: string|? }
    -- @return string|obsidian.Path The full path to the new note.
    note_path_func = function(spec)
      -- This is equivalent to the default behavior.
      local path = spec.dir / spec.title
      return path:with_suffix(".md")
    end,
    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    ---@param url string
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      vim.fn.jobstart({ "open", url }) -- Mac OS
      -- vim.fn.jobstart({"xdg-open", url})  -- linux
    end,
  },
}
