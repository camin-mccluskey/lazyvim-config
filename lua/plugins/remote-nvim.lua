return {
  "amitds1997/remote-nvim.nvim",
  version = "0.3.11", -- Pin to GitHub releases (unstable)
  dependencies = {
    "nvim-lua/plenary.nvim", -- For standard functions
    "MunifTanjim/nui.nvim", -- To build the plugin UI
    "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
  },
  config = true,
  opts = {
    client_callback = function(port, workspace_config)
      local cmd = ("tmux new-window -n 'nvim-remote'  'nvim --server localhost:%s --remote-ui'"):format(port)
      vim.fn.jobstart(cmd, {
        detach = true,
        on_exit = function(job_id, exit_code, event_type)
          -- This function will be called when the job exits
          print("Client", job_id, "exited with code", exit_code, "Event type:", event_type)
        end,
      })
    end,
  },
}
