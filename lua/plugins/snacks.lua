local logo = [[
                      ..............              
                    .:::::::::::::::.             
                   .::::::::::::::::::            
                  .::::::::::::::::::::           
                 .:::::::.                        
                ::::::::.                         
                :::::::       ..                  
                 :::::      .....                 
                  ::.      .......                
                   .      ........                
                         ........                 
            ...................                   
             .................                    
              ...............                     
]]

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      sections = {
        {
          section = "terminal",
          cmd = "chafa ~/dotfiles/.config/nvim/stackfix-logo.png --format symbols --symbols vhalf --size 35x20 --stretch",
          height = 20,
          padding = 1,
          indent = 12,
        },
        -- { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          desc = "Browse Repo",
          padding = 1,
          key = "b",
          action = function()
            Snacks.gitbrowse()
          end,
        },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              title = "Open Issues",
              cmd = "gh issue list -L 3",
              key = "i",
              action = function()
                vim.fn.jobstart("gh issue list --web", { detach = true })
              end,
              icon = " ",
              height = 7,
            },
            {
              icon = " ",
              title = "Open PRs",
              cmd = "gh pr list -L 3",
              key = "p",
              action = function()
                vim.fn.jobstart("gh pr list --web", { detach = true })
              end,
              height = 7,
            },
            {
              icon = " ",
              title = "Git Status",
              cmd = "git --no-pager diff --stat -B -M -C",
              height = 10,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              pane = 2,
              section = "terminal",
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
        { section = "startup" },
      },
      -- preset = {
      --   header = logo,
      -- },
    },
    lazygit = {},
    terminal = {},
    zen = {},
  },
}
